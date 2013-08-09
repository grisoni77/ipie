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
        $state = $this->get('State');

        // Assign the Data
        $this->items = $items;
        $this->state = $state;

        // Display the template
        parent::display($tpl);
    }

}