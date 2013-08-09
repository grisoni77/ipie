<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library
jimport('joomla.application.component.view');

/**
 * HelloWorlds View
 */
class IPieView extends JView
{

    public $_singular;
    public $_plural;

    public function __construct($config = array())
    {
        parent::__construct($config);

        // inflector
        if (IPieHelper::isSingular($this->getName()))
        {
            $this->_singular = $this->getName();
            $this->_plural = IPieHelper::getPlural($this->_singular);
        }
        else {
            $this->_plural = $this->getName();
            $this->_singular = IPieHelper::getSingular($this->_plural);
        }
    }

    public function display($tpl = null)
    {
        $view = JRequest::getCmd('view');
        // sub menu
        JSubMenuHelper::addEntry(JText::_('Registrations'), 'index.php?option=com_ipie&view=registrations', $view == 'registrations');
        JSubMenuHelper::addEntry(JText::_('Companies'), 'index.php?option=com_ipie&view=companies', $view == 'companies');
        JSubMenuHelper::addEntry(JText::_('Factors'), 'index.php?option=com_ipie&view=factors', $view == 'factors');

        parent::display($tpl);
    }

}