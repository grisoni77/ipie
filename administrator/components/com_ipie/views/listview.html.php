<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * HelloWorlds View
 */
class IPieViewList extends IPieView {

    /**
     * List view display method
     * @return void
     */
    function display($tpl = null)
    {
        // Get data from the model
        $items = $this->get('Items');
        $pagination = $this->get('Pagination');

        // Check for errors.
        if (count($errors = $this->get('Errors')))
        {
            JError::raiseError(500, implode('<br />', $errors));
            return false;
        }
        // Assign data to the view
        $this->items = $items;
        $this->pagination = $pagination;
        $this->state = $this->get('State');

        // Set the toolbar
        $this->addToolBar();

        // Display the template
        parent::display($tpl);
    }

    /**
     * Setting the toolbar
     */
    protected function addToolBar()
    {
        JToolBarHelper::title(JText::_(sprintf('%s List', ucfirst($this->_plural))));
        JToolBarHelper::deleteList(
            JText::sprintf('Are you sure you want to delete this %s?', $this->_plural), 
            $this->_plural . '.delete'
        );
        JToolBarHelper::editList($this->_singular . '.edit');
        JToolBarHelper::addNew($this->_singular . '.add');
        JToolBarHelper::preferences('com_ipie');
    }

}