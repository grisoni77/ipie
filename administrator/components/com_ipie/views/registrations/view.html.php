<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Items View
 */
class IPieViewRegistrations extends IPieViewList {

    /**
     * Setting the toolbar
     */
    protected function addToolBar()
    {
        JToolBarHelper::title(JText::sprintf('%s List', ucfirst($this->_plural)));
        JToolBarHelper::deleteList(
            JText::sprintf('Are you sure you want to delete this %s?', $this->_plural), 
            $this->_plural . '.delete'
        );
        JToolBarHelper::preferences('com_ipie');
    }

}