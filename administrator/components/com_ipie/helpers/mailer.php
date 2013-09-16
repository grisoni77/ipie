<?php

class IPieHelperMailer
{
    static public function getMailer()
    {
        static $mailer = null;
        if (!isset($mailer)) {
            $mailer = JFactory::getMailer();
        }
        return $mailer;
    }
    
    static private function getTemplate($name)
    {
        $lang = JFactory::getLanguage();
        $tag = $lang->getTag();
        $folder = JPATH_SITE.DS.'language'.DS.$tag.DS.'com_ipie_email_tpl';
        $filename = $folder.DS.$name.'.html';
        if (file_exists($filename)) {
            return file_get_contents($filename);
        } else {
            return JError::raiseError(500, 'Template non esistente: '.$name);
        }
    }
    
    static private function parseTemplate($name, $data)
    {
        $tpl = self::getTemplate($name);
        if ($tpl instanceof JException) {
            return false;
        } else {
            foreach ($data as $key => $value) {
                $tpl = str_replace('{{'.$key.'}}', $value, $tpl);
            }
            return $tpl;
        }
    }
    
    /**
     * Usato per mandare email di notifica dopo richiesta registrazione
     * 
     * @param boolean $validData
     */
    static public function notifySystemOnRegistration($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifySystemOnRegistration', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($params->get('system_email'));
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('A new registration request has been sent'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
        
    }
    
    static public function notifyOnRegistrationApproval($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifyOnRegistrationApproval', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($data['email']);
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Your registration request has been approved'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
    
    static public function notifyOnRegistrationRefusal($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifyOnRegistrationRefusal', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($data['email']);
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Your registration request has been refused'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
    
    static public function notifyOnCompanySuspension($data)
    {
        $mailer = self::getMailer();
        // send mail
    }
    
    static public function notifyOnDraftApproval($data)
    {
        $mailer = self::getMailer();
        // send mail
    }
    
    static public function notifyOnDraftRejection($data)
    {
        $mailer = self::getMailer();
        // send mail
        JFactory::getApplication()->enqueueMessage($data['reason']);
    }
}
