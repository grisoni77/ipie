<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Company Controller
 */
class IPieControllerDraft extends IPieControllerForm
{

    public function __construct($config = array())
    {
        parent::__construct($config);
        $this->view_list = 'companies';
    }
    
    public function approve()
    {
        // Check for request forgeries.
        JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

        $id = JRequest::getInt('id');
        if (empty($id)) {
            JError::raiseError(400, 'Bad Request');
        }
        
        $model = $this->getModel('Draft');
        if (!$model->approve($id)) {
            $this->setRedirect('index.php?option=com_ipie&task=draft.edit&id='.$id, $model->getError());
        } else {
            $this->sendApprovalNotification($id);
            $this->setRedirect('index.php?option=com_ipie&view=companies', 'Scheda approvata con successo');
        }
    }

    public function sendApprovalNotification($id)
    {
        $model = $this->getModel('Draft');
        $item = $model->getItem($id);
        $cmodel = $this->getModel('Company');
        $company = $cmodel->getItem($item->company_id);
        // TODO mandare la mail con i dati di company...
        IPieHelperMailer::notifyOnDraftApproval($company);
    }    

    public function reject()
    {
        // Check for request forgeries.
        JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

        $id = JRequest::getInt('id');
        if (empty($id)) {
            JError::raiseError(400, 'Bad Request');
        }
        
        $model = $this->getModel('Draft');
        if (!$model->reject($id)) {
            $this->setRedirect('index.php?option=com_ipie&task=draft.edit&id='.$id, $model->getError());
        } else {
            $reason = JRequest::getString('reason');
            $this->sendRejectNotification($id, $post['reason']);
            $this->setRedirect('index.php?option=com_ipie&view=companies', 'Scheda rifutata con successo');
        }
    }

    public function sendRejectNotification($id, $reason)
    {
        $model = $this->getModel('Draft');
        $item = $model->getItem($id);
        $cmodel = $this->getModel('Company');
        $company = $cmodel->getItem($item->company_id);
        // TODO mandare la mail con i dati di company...
        IPieHelperMailer::notifyOnDraftRejection(array(
            'company' => $company,
            'reason' => $reason,
        ));
    }    
    
}