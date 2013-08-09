<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * List Model
 */
class IPieModelFactors extends IPieModelList {

    //Override construct to allow filtering and ordering on our fields
    public function __construct($config = array())
    {
        // field dove cercare
        $this->searchInFields = array('f.description');

        // add ordering field white list
        $config['filter_fields'] = array('f.description', 'f.published');

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
            ->select('f.factor_id AS id, f.factor_id, f.description')
            ->select('f.published')
            ->from('#__ipie_factor f')
            ->order($db->escape($this->getState('list.ordering', 'f.description')) . ' ' .
                $db->escape($this->getState('list.direction', 'asc')));
        ;

        // add query conditions
        $this->buildQueryConditions($query);

        return $query;
    }

    protected function buildQueryConditions(&$query)
    {
        parent::buildQueryConditions($query);

        $db = JFactory::getDBO();

        // Filter by state (published, trashed, etc.)
        $state = $this->getState('filter.published');
        if (is_numeric($state))
        {
            $query->where('f.published = ' . (int) $state);
        }
        elseif ($state === '')
        {
            $query->where('(f.published = 0 OR f.published = 1)');
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

        //Takes care of states: list. limit / start / ordering / direction
        parent::populateState('f.description', 'asc');
    }

}