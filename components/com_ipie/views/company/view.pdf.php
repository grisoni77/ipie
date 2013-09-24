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
        $item = $this->get('Data');
        // settori
        $sectors = array();
        foreach ($item->sectors as $s) {
            $sectors[] = $s->name;
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
        include 'tmpl/pdf.php';
        //echo 'PDF';
        die();
    }
}