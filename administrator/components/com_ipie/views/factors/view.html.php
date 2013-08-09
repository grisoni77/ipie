<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Facilities View
 */
class IPieViewFactors extends IPieViewList {

    /**
     * Setting the toolbar
     */
    protected function addToolBar()
    {
        JToolBarHelper::publish($this->_plural . '.publish');
        JToolBarHelper::unpublish($this->_plural . '.unpublish');
        
        parent::addToolBar();
    }

}