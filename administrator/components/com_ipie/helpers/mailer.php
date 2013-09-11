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
    
    /**
     * Usato per mandare email di notifica dopo richiesta registrazione
     * 
     * @param boolean $validData
     */
    static public function notifySystemOnRegistration($data)
    {
        print_r($data);
        $app = JFactory::getApplication();
        $params = JComponentHelper::getParams('com_ipie');

        $body = JText::sprintf('REGISTRATION_NOTIFICATION', $data['name']);
        //echo $body;

        $mail = self::getMailer();

        $mail->addRecipient($params->get('system_email'));
        $mail->addReplyTo(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSender(array($params->get('sender_email'), $params->get('sender_name')));
        $mail->setSubject(JText::_('Una nuova registrazione ? stata inviata'));
        $mail->setBody($body);
        //echo $body;die();
        $sent = $mail->Send();
        
    }
    
    static public function notifyOnCompanyApproval($data)
    {
        $mailer = self::getMailer();
        // send mail
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
