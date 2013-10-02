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
        $mail->setSubject(JText::_('Nuova richiesta di registrazione al sito Imprese Innovative Piemonte'));
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
        $mail->setSubject(JText::_('Richiesta di registrazione approvata'));
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
        $mail->setSubject(JText::_('Richiesta di registrazione respinta'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
    
    static public function notifyOnCompanySuspension($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifyOnCompanySuspension', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($data['email']);
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Sospensione account'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
    
    static public function notifySystemOnDraftSubmission($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifySystemOnDraftSubmission', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($params->get('system_email'));
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Nuova bozza in attesa di approvazione'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
    
    static public function notifyOnDraftApproval($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifyOnDraftApproval', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($data['email']);
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Scheda azienda approvata'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
    
    static public function notifyOnDraftRejection($data)
    {
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = self::parseTemplate('notifyOnDraftRejection', $data);
        //echo $body;

        $mail = self::getMailer();
        $mail->IsHTML();
        $mail->addRecipient($data['email']);
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Scheda azienda respinta'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
    }
}
