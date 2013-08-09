<?php

/**
 * Description of CompanyPlugin
 *
 * @author Cristiano Cucco <cristiano dot cucco at gmail dot com>
 */
class IPiePluginDraft extends JPlugin
{
    /**
     * chiamato da dispatcher
     * @param type $context
     * @param type $table
     */
    public function onAfterDraftDelete($context, $table)
    {
        if (file_exists($this->getLogoDraftPath() . $table->logo)) {
            JFile::delete($this->getLogoDraftPath() . $table->logo);
        }
    }    
    
    protected function getLogoDraftPath()
    {
        return JPATH_ROOT . DS . 'images' . DS . 'ipie' . DS . 'logo' . DS . 'draft' . DS;
    }    
    
}
