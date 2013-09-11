<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Facilities View
 */
class IPieViewCompanies extends IPieViewList
{

    /**
     * Setting the toolbar
     */
    protected function addToolBar()
    {
        JToolBarHelper::publish($this->_plural . '.publish');
        JToolBarHelper::unpublish($this->_plural . '.unpublish');

        JToolBarHelper::title(JText::_(sprintf('%s List', ucfirst($this->_plural))));
        JToolBarHelper::deleteList(
            JText::sprintf('Are you sure you want to delete this %s?', $this->_plural), $this->_plural . '.delete'
        );
        JToolBarHelper::editList($this->_singular . '.edit');
        //JToolBarHelper::addNew($this->_singular . '.add');
        JToolBarHelper::preferences('com_ipie');
        //parent::addToolBar();
    }

}