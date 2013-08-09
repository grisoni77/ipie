<?php

/**
 * Description of CompanyPlugin
 *
 * @author Cristiano Cucco <cristiano dot cucco at gmail dot com>
 */
class IPiePluginCompany extends JPlugin
{
    /**
     * richiamato da evento before_delete
     */
    public function onBeforeCompanyDelete($context, $table)
    {
        // cancella il draft esistente
        $model = JModel::getInstance('Draft', 'IPieModel');
        $model->deleteDraft($table->company_id);
    }
    
    /**
     * chiamato da dispatcher
     * @param type $context
     * @param type $table
     */
    public function onAfterCompanyDelete($context, $table)
    {
        if (file_exists($this->getLogoPath() . $table->logo)) {
            JFile::delete($this->getLogoPath() . $table->logo);
        }
    }   
    
    protected function getLogoPath()
    {
        return JPATH_ROOT . DS . 'images' . DS . 'ipie' . DS . 'logo' . DS;
    }

}
