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
