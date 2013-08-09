<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * HelloWorlds View
 */
class IPieViewForm extends IPieView {

    /**
     * display method of edit view
     * @return void
     */
    public function display($tpl = null)
    {
        // get the Data
        $form = $this->get('Form');
        $item = $this->get('Item');

        // Check for errors.
        if (count($errors = $this->get('Errors')))
        {
            JError::raiseError(500, implode('<br />', $errors));
            return false;
        }
        // Assign the Data
        $this->form = $form;
        $this->item = $item;

        // Set the toolbar
        $this->addToolBar($item);

        // Display the template
        parent::display($tpl);
    }

    /**
     * Setting the toolbar
     */
    protected function addToolBar($data)
    {
        $input = JFactory::getApplication()->input;
        $input->set('hidemainmenu', true);
        $table = $this->getModel()->getTable();
        $id = $table->getkeyName();
        $isNew = ($this->item->$id == 0);
        JToolBarHelper::title($isNew ? JText::sprintf('Create %s', $this->_singular) : JText::sprintf('Edit %s', $this->_singular));
        JToolBarHelper::save($this->_singular . '.save');
        JToolBarHelper::apply($this->_singular . '.apply');
        JToolBarHelper::cancel($this->_singular . '.cancel', $isNew ? 'JTOOLBAR_CANCEL' : 'JTOOLBAR_CLOSE');
    }

}