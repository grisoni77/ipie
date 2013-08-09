<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla view library
jimport('joomla.application.component.view');

/**
 * Form View
 */
class IPieViewDraft extends IPieViewForm
{

    public function addToolBar($item)
    {
        $input = JFactory::getApplication()->input;
        $input->set('hidemainmenu', true);
        JToolBarHelper::title('Approva / Correggi bozza');
        JToolBarHelper::save($this->_singular . '.save');
        JToolBarHelper::apply($this->_singular . '.apply');
        if ($item->state == 'pending') {
            JToolBarHelper::custom($this->_singular . '.approve', 'publish', 'publish', 'Approva', false);
            JToolBarHelper::custom($this->_singular . '.reject', 'unpublish', 'unpublish', 'Rifiuta', false);
        }
        JToolBarHelper::cancel($this->_singular . '.cancel', $isNew ? 'JTOOLBAR_CANCEL' : 'JTOOLBAR_CLOSE');
    }

}