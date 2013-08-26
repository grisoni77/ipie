<?php

class IPieSiteModelDraft extends IPieModelDraft
{

    public function __construct($config = array())
    {
        $this->option = 'com_ipie';
        parent::__construct($config);
    }

    public function getDraftByUser($user_id)
    {
        if (empty($user_id)) {
            JError::raiseError(400, JText::_('User ID not valid in model Draft'));
        }
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('d.draft_id')
                ->from('#__ipie_draft d')
                ->join('', '#__ipie_company c ON (c.company_id=d.company_id)')
                ->where('c.user_id = ' . $user_id);
        ;
        $db->setQuery($query);
        echo $db->replacePrefix($query);
        return $db->loadResult();
    }

    public function isDraftOwner($draft_id, $user_id)
    {
        if (empty($draft_id)) {
            JError::raiseError(400, JText::_('Draft ID not valid in model Draft'));
        }
        if (empty($user_id)) {
            JError::raiseError(400, JText::_('User ID not valid in model Draft'));
        }
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('c.user_id')
                ->from('#__ipie_draft d')
                ->join('', '#__ipie_company c ON (c.company_id=d.company_id)')
                ->where('d.draft_id = ' . $draft_id);
        ;
        $db->setQuery($query);
        //echo $db->replacePrefix($query);die();
        $draft_user_id = $db->loadResult();
        return $user_id == $draft_user_id;
    }

    public function isEditable($draft_id)
    {
        if (empty($draft_id)) {
            JError::raiseError(400, JText::_('Draft ID not valid in model Draft'));
        }
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('d.state')
                ->from('#__ipie_draft d')
                ->where('d.draft_id = ' . $draft_id);
        ;
        $db->setQuery($query);
        $state = $db->loadResult();
        return $state == 'editable';
    }

    public function setPending($draft_id)
    {
        if (empty($draft_id)) {
            JError::raiseError(400, JText::_('Draft ID not valid in model Draft '.__LINE__));
        }
        $table = $this->getTable();
        $table->load($draft_id);
        $table->state = 'pending';
        if (!$table->store()) {
            $this->setError($table->getError());
            return false;
        }
        return true;
    }

    
}