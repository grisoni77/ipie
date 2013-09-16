<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library
jimport('joomla.application.component.view');

/**
 * Form View
 */
class IPieViewRegistration extends IPieViewForm
{
    function addToolBar()
    {
        $input = JFactory::getApplication()->input;
        $input->set('hidemainmenu', true);
        JToolBarHelper::title(JText::_('Approve registration'));
        JToolBarHelper::save($this->_singular . '.approve', 'Approva');
        JToolBarHelper::save($this->_singular . '.refuse', 'Rifiuta');
        JToolBarHelper::cancel($this->_singular . '.cancel', $isNew ? 'JTOOLBAR_CANCEL' : 'JTOOLBAR_CLOSE');
    }
}