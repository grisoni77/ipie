<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * List Model
 */
class IPieModelRegistrations extends IPieModelList {

    //Override construct to allow filtering and ordering on our fields
    public function __construct($config = array())
    {
        // field dove cercare
        $this->searchInFields = array('r.name');

        // add ordering field white list
        $config['filter_fields'] = array('r.name');

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
            ->select('r.registration_id AS id, r.registration_id, r.*')
            ->select('c.name as city, p.name as province')
            ->from('#__ipie_registration r')
            ->join('INNER', '#__ipie_province p ON (p.province_id=r.province_id)')
            ->join('INNER', '#__ipie_city c ON (c.city_id=r.city_id)')
            ->order($db->escape($this->getState('list.ordering', 'r.name')) . ' ' .
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

        $query->where('r.state = '.$db->quote('pending'));
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

        //Takes care of states: list. limit / start / ordering / direction
        parent::populateState('r.name', 'asc');
    }

}