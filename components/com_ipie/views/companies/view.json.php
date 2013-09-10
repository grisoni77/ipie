<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library
jimport('joomla.application.component.view');

/**
 * Form View
 */
class IPieViewCompanies extends JView
{

    /**
     * display method of edit view
     * @return void
     */
    public function display($tpl = null)
    {
        // get the Data
        $items = $this->get('Items');
        
        $results = array();
        foreach($items as $item)
        {
            $results[] = array(
                'company_id' => $item->company_id,
                'name' => $item->name,
            );
        }
        
        $document = JFactory::getDocument();
        $document->setName('companies');
        echo json_encode($results);
        return true;
    }

}