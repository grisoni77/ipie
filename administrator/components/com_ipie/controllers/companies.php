<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Items Controller
 */
class IPieControllerCompanies extends IPieControllerAdmin 
{
    public function suspend()
    {
        $cid = JRequest::getVar('cid', array(), 'post', 'array');
        $id = $cid[0];
        $reason = JRequest::getString('reason');
        
        $model = $this->getModel('Company');
        $cp = $model->getItem($id);
        $user = JFactory::getUser($cp->user_id);
        if ($user->get('block') == 1) {
            $this->setRedirect('index.php?option=com_ipie&view=companies', "L'account dell'azienda ".$cp->name." è già stato sospeso in precedenza");
            return;
        }
        
        $model->publish($id, 0);
        
        $user->set('block', 1);
        $user->save();
        
        IPieHelperMailer::notifyOnCompanySuspension(array(
            'name' => $cp->name,
            'piva' => $cp->piva,
            'email' => $user->email,
            'reason' => $reason,
        ));
        
        $this->setRedirect('index.php?option=com_ipie&view=companies', "L'account dell'azienda ".$cp->name." è stato correttamente sospeso");
    }
}