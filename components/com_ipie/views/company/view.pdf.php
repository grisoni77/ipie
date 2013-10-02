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
            $item->area_eccellenza = $item->area_eccellenza_it;
            $item->collaborazioni = $item->collaborazioni_it;
        } else {
            $item->area_eccellenza = $item->area_eccellenza_en;
            $item->collaborazioni = $item->collaborazioni_en;
        }
        include 'tmpl/pdf.php';
        //echo 'PDF';
        die();
    }
}