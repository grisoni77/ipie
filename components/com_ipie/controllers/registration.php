<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.controllerform');

/**
 * Form Controller
 */
class IPieControllerRegistration extends JControllerForm
{

    public function __construct($config = array())
    {
        parent::__construct($config);

        $this->model_prefix = 'IPieSiteModel';
    }

    /**
     * @since	1.6
     */
    protected $view_item = 'registration';

    /**
     * @since	1.6
     */
    protected $view_list = 'registration';

    public function allowEdit($data = array(), $key = 'id')
    {
        return true;
    }

    public function allowSave($data, $key = 'id')
    {
        return true;
    }


    protected function postSaveHook(\JModel &$model, $validData = array())
    {
        $item = $model->getItem();
        $id = $item->get('registration_id');
        $this->notifyUser($id, $item);
    }

    /**
     * Usato per mandare email di notifica dopo richiesta registrazione
     * @param JModel $model
     * @param boolean $validData
     */
    protected function notifyUser($id, $data)
    {
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

    public function save()
    {
        // Check for request forgeries.
        JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

        // Initialise variables.
        $app = JFactory::getApplication();
        $model = $this->getModel('Registration');

        // Get the user data.
        $requestData = JRequest::getVar('jform', array(), 'post', 'array');

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
            $app->setUserState('com_ipie.registration.data', $requestData);

            // Redirect back to the registration screen.
            $this->setRedirect(JRoute::_('index.php?option=com_ipie&view=registration&layout=edit', false));
            return false;
        }

        // Attempt to save the data.
        $return = $model->save($data);

        // Check for errors.
        if ($return === false) {
            // Save the data in the session.
            $app->setUserState('com_ipie.registration.data', $data);

            // Redirect back to the edit screen.
            $this->setMessage(JText::sprintf('COM_USERS_REGISTRATION_SAVE_FAILED', $model->getError()), 'warning');
            $this->setRedirect(JRoute::_('index.php?option=com_ipie&view=registration&layout=edit', false));
            return false;
        }

        // Flush the data from the session.
        $app->setUserState('com_users.registration.data', null);

        // Redirect to the profile screen.
        $this->setMessage(JText::_('COM_USERS_REGISTRATION_SAVE_SUCCESS'));
        $this->setRedirect(JRoute::_('index.php?option=com_ipie&view=registration&layout=success', false));

        return true;
    }

}