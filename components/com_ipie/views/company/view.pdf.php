<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library
jimport('joomla.application.component.view');

/**
 * Form View
 */
class IPieViewCompany extends JView
{
    // Overwriting JView display method
    function display($tpl = null)
    {
        $this->item = $this->get('Data');
        echo 'PDF';
        return;
        

        // Display the view
        parent::display($tpl);
    }
}