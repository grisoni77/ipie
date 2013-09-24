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
        // settori
        $this->sectors = array();
        foreach ($this->item->sectors as $s) {
            $this->sectors[] = JText::_($s->name);
        }
        // area eccellenza
        $lang = JFactory::getLanguage();
        $locale = $lang->getLocale();
        if ('it' == $locale[4]) {
            $this->area_eccellenza = $this->item->area_eccellenza_it;
            $this->collaborazioni = $this->item->collaborazioni_it;
        } else {
            $this->area_eccellenza = $this->item->area_eccellenza_en;
            $this->collaborazioni = $this->item->collaborazioni_en;
        }


        // Display the view
        parent::display($tpl);
    }
}