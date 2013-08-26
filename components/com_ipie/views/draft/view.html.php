<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library
jimport('joomla.application.component.view');

/**
 * Form View
 */
class IPieViewDraft extends JView
{

    // Overwriting JView display method
    function display($tpl = null)
    {
        // get the Data
        $form = $this->get('Form');

        // Check for errors.
        if (count($errors = $this->get('Errors')))
        {
            JError::raiseError(500, implode('<br />', $errors));
            return false;
        }
        // Assign the Data
        $this->form = $form;

        // Display the template
        parent::display($tpl);
    }
    
    function pending()
    {
        $this->setLayout('pending');
        $this->display();
    }

}