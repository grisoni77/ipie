<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.controllerform');

/**
 * Form Controller
 */
class IPieControllerDraft extends JControllerForm
{

    public function __construct($config = array())
    {
        parent::__construct($config);

        $this->model_prefix = 'IPieSiteModel';
    }

    /**
     * @since	1.6
     */
    protected $view_item = 'draft';

    /**
     * @since	1.6
     */
    protected $view_list = 'draft';

    public function allowEdit($data = array(), $key = 'draft_id')
    {
        $user = JFactory::getUser();
        $draft_id = $data[$key];
        $model = $this->getModel('Draft');
        return $model->isDraftOwner($draft_id, $user->id);
    }

    public function allowSave($data, $key = 'draft_id')
    {
        $user = JFactory::getUser();
        $draft_id = $data[$key];
        $model = $this->getModel('Draft');
        return $model->isDraftOwner($draft_id, $user->id);
    }

    /**
     * Method to edit an existing record.
     *
     * @param   string  $key     The name of the primary key of the URL variable.
     * @param   string  $urlVar  The name of the URL variable if different from the primary key
     * (sometimes required to avoid router collisions).
     *
     * @return  boolean  True if access level check and checkout passes, false otherwise.
     *
     * @since   11.1
     */
    public function edit($key = 'draft_id', $urlVar = 'id')
    {
        // Initialise variables.
        $app = JFactory::getApplication();
        $user = JFactory::getUser();
        $model = $this->getModel();
        $table = $model->getTable();
        $cid = JRequest::getVar('cid', array(), 'post', 'array');
        $context = "$this->option.edit.$this->context";

        // Determine the name of the primary key for the data.
        if (empty($key))
        {
            $key = $table->getKeyName();
        }

        // To avoid data collisions the urlVar may be different from the primary key.
        if (empty($urlVar))
        {
            $urlVar = $key;
        }

        // Get the previous record id (if any) and the current record id.
        $recordId = (int) (count($cid) ? $cid[0] : JRequest::getInt($urlVar));
        // se id non specificato lo ricava dal db
        if (empty($recordId)) {
            $recordId = $model->getDraftByUser($user->id);
        }

        // Access check.
        if (!$this->allowEdit(array($key => $recordId), $key))
        {
            $this->setError(JText::_('JLIB_APPLICATION_ERROR_EDIT_NOT_PERMITTED'));
            $this->setMessage($this->getError(), 'error');

            $this->setRedirect(
                    JRoute::_(
                            'index.php?option=' . $this->option . '&view=' . $this->view_list
                            . $this->getRedirectToListAppend(), false
                    )
            );

            return false;
        }

        // Attempt to check-out the new record for editing and redirect.
        $checkin = property_exists($table, 'checked_out');
        if ($checkin && !$model->checkout($recordId))
        {
            // Check-out failed, display a notice but allow the user to see the record.
            $this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_CHECKOUT_FAILED', $model->getError()));
            $this->setMessage($this->getError(), 'error');

            $this->setRedirect(
                    JRoute::_(
                            'index.php?option=' . $this->option . '&view=' . $this->view_item
                            . $this->getRedirectToItemAppend($recordId, $urlVar), false
                    )
            );

            return false;
        }
        // La bozza appartiene all'utente loggato
        // Ora stabilisce dove redirigere l'utente a seconda dello stato bozza
        // (pagina di edit se modificabile oppure pagina feedback con stato bozza)
        else
        {
            if ($model->isEditable($recordId)) 
            {
                // Check-out succeeded, push the new record id into the session.
                $this->holdEditId($context, $recordId);
                $app->setUserState($context . '.data', null);

                $this->setRedirect(
                        JRoute::_(
                                'index.php?option=' . $this->option . '&view=' . $this->view_item
                                . $this->getRedirectToItemAppend($recordId, $urlVar), false
                        )
                );
            } else {
                $this->setRedirect(JRoute::_('index.php?option=com_ipie&task=draft.pending&id='.$recordId, false));
            }

            return true;
        }
    }

//    protected function postSaveHook(\JModel &$model, $validData = array())
//    {
//        $item = $model->getItem();
//        $id = $item->get('draft_id');
//        //$this->notifyUser($id, $item);
//    }



    public function save()
    {
        // Check for request forgeries.
        JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

        // Initialise variables.
        $app = JFactory::getApplication();
        $model = $this->getModel('Draft');
        $context = "$this->option.edit.$this->context";

        // Get the user data.
        $requestData = JRequest::getVar('jform', array(), 'post', 'array');
        // check if saveable
        if (!$this->allowSave($requestData)) {
            JError::raiseError(400, JText::_('Draft cannot be saved. Please contact a site administrator'));
            return false;
        }
        if (!$model->isEditable($requestData['draft_id'])) {
            JError::raiseError(400, JText::_('Draft is under revision by the Unioncamere and cannot be saved. Please contact a site administrator'));
            return false;
        }

        // Validate the posted data.
        $form = $model->getForm();
        if (!$form) {
            JError::raiseError(500, $model->getError());
            return false;
        }
        $data = $model->validate($form, $requestData);

        // Check for validation errors.
        if ($data === false) {
            // Get the validation messages.
            $errors = $model->getErrors();

            // Push up to three validation messages out to the user.
            for ($i = 0, $n = count($errors); $i < $n && $i < 3; $i++) {
                if ($errors[$i] instanceof Exception) {
                    $app->enqueueMessage($errors[$i]->getMessage(), 'warning');
                }
                else {
                    $app->enqueueMessage($errors[$i], 'warning');
                }
            }

            // Save the data in the session.
            $app->setUserState('com_ipie.draft.data', $requestData);

            // Redirect back to the registration screen.
            $this->setRedirect(JRoute::_('index.php?option=com_ipie&view=draft', false));
            return false;
        }

        // Attempt to save the data.
        $return = $model->save($data);

        // Check for errors.
        if ($return === false) {
            // Save the data in the session.
            $app->setUserState('com_ipie.draft.data', $data);

            // Redirect back to the edit screen.
            $this->setMessage(JText::sprintf('Salvataggio bozza fallito', $model->getError()), 'warning');
            $this->setRedirect(JRoute::_('index.php?option=com_ipie&task=draft.edit', false));
            return false;
        }

        // Flush the data from the session.
        $app->setUserState($context . '.data', null);

        // Redirect to the profile screen.
        $this->setMessage(JText::_('Salvataggio bozza riuscito con successo'));
        $this->setRedirect(JRoute::_('index.php?option=com_ipie&task=draft.edit', false));

        return true;
    }
    
    /**
     * @todo modifica lo stato della bozza e invia una mail di notifica a azienda e unioncamere
     */
    public function sendForApprovation()
    {
        $app = JFactory::getApplication();
        $data = JRequest::getVar('jform', array(), 'post', 'array');
        $id = JRequest::getInt('id');
        $model = $this->getModel('Draft');
        $context = "$this->option.edit.$this->context";
        
        if ($model->setPending($id)) {
            $this->notifyUsers($id, $data);
            $this->setMessage(JText::sprintf('Invio bozza riuscito con successo', $model->getError()), 'warning');
            $this->setRedirect(JRoute::_('index.php?option=com_ipie&task=draft.pending&id='.$id, false));
        } else {
            $this->setMessage(JText::sprintf('Invio bozza fallito', $model->getError()), 'warning');
            $this->setRedirect(JRoute::_('index.php?option=com_ipie&task=draft.edit', false));
        }
        
        $app->setUserState($context . '.data', null);
    }

    /**
     * Usato per mandare email di notifica dopo invio bozza
     * @param JModel $model
     * @param boolean $validData
     * @todo le mail...
     */
    protected function notifyUsers($id, $data)
    {
        return true;
        
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $hash = md5($data->name . $data->surname . $data->email);
        $body = JText::sprintf('REGISTRATION_BODY', JRoute::_(JURI::root() . 'index.php?option=com_bnb&task=registration.complete&id=' . $id . '&hash=' . $hash, 'Complete now your registration!'));
        //echo $body;

        $mail = JFactory::getMailer();

        $mail->addRecipient($data->email);
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Complete your registration on BnB'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }  
    
    
    public function pending() 
    {
        $draft_id = JRequest::getInt('id');
        $model = $this->getModel('Draft');
        $view = $this->getView('draft', 'html');
        $view->assignRef('item', $model->getItem($draft_id));
        $view->pending();
    }
}