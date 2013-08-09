<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * List Model
 */
class IPieModelCompanies extends IPieModelList {

    //Override construct to allow filtering and ordering on our fields
    public function __construct($config = array())
    {
        // field dove cercare
        $this->searchInFields = array('c.name');

        // add ordering field white list
        $config['filter_fields'] = array('c.name', 'c.published'
            , 'ci.name', 'p.name'
            );

        parent::__construct($config);
    }

    /**
     * Method to build an SQL query to load the list data.
     *
     * @return      string  An SQL query
     */
    protected function getListQuery()
    {
        // Create a new query object.           
        $db = JFactory::getDBO();
        $query = $db->getQuery(true);
        // Select some fields
        $query
            ->select('c.company_id AS id, c.company_id, c.name')
            ->select('c.published, ci.name as city, c.address, p.name as province')
            ->select('d.draft_id, d.state as draft_state')
            ->from('#__ipie_company c')
            ->join('INNER', '#__ipie_city ci ON (ci.city_id=c.city_id)')
            ->join('INNER', '#__ipie_province p ON (ci.province_id=p.province_id)')
            ->join('LEFT', '#__ipie_draft d ON (d.company_id=c.company_id)')
            ->order($db->escape($this->getState('list.ordering', 'c.name')) . ' ' .
                $db->escape($this->getState('list.direction', 'asc')));
        ;

        // add query conditions
        $this->buildQueryConditions($query);

        return $query;
    }

    protected function buildQueryConditions(&$query)
    {
        parent::buildQueryConditions($query);

        $query->where('(c.user_id IS NOT NULL) ');
        // Filter
        $val = $this->getState('filter.city');
        if (!empty($val))
        {
            $query->where('(c.city_id=' . $val . ')');
        }
        // Filter
        $val = $this->getState('filter.province');
        if (!empty($val))
        {
            $query->where('(c.province_id=' . $val . ')');
        }

        // Filter by state (published, trashed, etc.)
        $state = $this->getState('filter.published');
        if (is_numeric($state))
        {
            $query->where('c.published = ' . (int) $state);
        }
        elseif ($state === '')
        {
            $query->where('(c.published = 0 OR c.published = 1)');
        }
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     *
     * @since       1.6
     */
    protected function populateState($ordering = null, $direction = null)
    {
        // Initialise variables.
        $app = JFactory::getApplication('administrator');

        $state = $this->getUserStateFromRequest($this->context . '.filter.published', 'filter_published', '', 'string');
        $this->setState('filter.published', $state);

        //Filter (dropdown) state
        $state = $this->getUserStateFromRequest($this->context . '.filter.city', 'filter_city', '', 'int');
        $this->setState('filter.city', $state);

        //Filter (dropdown) state
        $state = $this->getUserStateFromRequest($this->context . '.filter.province', 'filter_province', '', 'int');
        $this->setState('filter.province', $state);

        //Takes care of states: list. limit / start / ordering / direction
        parent::populateState('c.name', 'asc');
    }

}