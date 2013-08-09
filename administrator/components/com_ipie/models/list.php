<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
// import the Joomla modellist library
jimport('joomla.application.component.modellist');

/**
 * FacilityList Model
 */
class IPieModelList extends JModelList {

    //Add this handy array with database fields to search in
    protected $searchInFields = array();

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

        // Load the filter state.
        $search = $this->getUserStateFromRequest($this->context . '.filter.search', 'filter_search');
        //Omit double (white-)spaces and set state
        $this->setState('filter.search', preg_replace('/\s+/', ' ', $search));

        //Takes care of states: list. limit / start / ordering / direction
        parent::populateState($ordering, $direction);
    }

    protected function buildQueryConditions(&$query)
    {
        $db = JFactory::getDbo();

        // Filter search // Extra: Search more than one fields and for multiple words
        if (count($this->searchInFields))
        {
            $regex = str_replace(' ', '|', $this->getState('filter.search'));
            if (!empty($regex))
            {
                $regex = ' REGEXP ' . $db->quote($regex);
                $query->where('(' . implode($regex . ' OR ', $this->searchInFields) . $regex . ')');
            }
        }
    }

}