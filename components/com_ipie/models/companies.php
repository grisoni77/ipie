<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.modellist');

/**
 * Admin Model
 */
class IPieSiteModelCompanies extends JModelList
{

    //Override construct to allow filtering and ordering on our fields
    public function __construct($config = array())
    {
        // field dove cercare
        $this->searchInFields = array('ci.name', 'p.name', 'ftmp.factors');
        $lang = JFactory::getLanguage();
        $locale = $lang->getLocale();
        if ('it' == $locale[4]) {
        	$this->searchInFields[] = 'c.area_eccellenza_it';
        	$this->searchInFields[] = 'c.collaborazioni_it';
        } else {
        	$this->searchInFields[] = 'c.area_eccellenza_en';
        	$this->searchInFields[] = 'c.collaborazioni_en';
        }

        // add ordering field white list
        $config['filter_fields'] = array(
            'ci.name', 'p.name'
        );
        

        parent::__construct($config);
    }

    public function getStateFromRequest($request, $default = null, $type = 'none')
    {
        return JRequest::getVar($request, $default, 'default', $type);
    }

    public function getItems()
    {
    	$items = parent::getItems();
    	foreach ($items as &$item) 
    	{
    		// aggiunge http scheme
    		if (!empty($item->web)) {
			$web = new JUri($item->web);
			$scheme = $web->getScheme();	
			if (empty($scheme)) {
				$web->setScheme('http');
				$item->web = $web->toString();
			}
	    	}
	}
    	return $items;
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
                ->select('DISTINCT c.company_id AS id, c.company_id, c.name')
                ->select('c.published, ci.name as city, c.address, p.name as province, c.web')
                ->select('c.lat, c.lng')
                ->from('#__ipie_company c')
                ->join('INNER', '#__ipie_city ci ON (ci.city_id=c.city_id)')
                ->join('INNER', '#__ipie_province p ON (ci.province_id=p.province_id)')
                ->order($db->escape($this->getState('list.ordering', 'c.name')) . ' ' .
                        $db->escape($this->getState('list.direction', 'asc')));
        ;

        // add query conditions
        $this->buildQueryConditions($query);
	//echo $db->replacePrefix($query);
        return $query;
    }

    protected function buildQueryConditions(&$query)
    {
        $query->where('(c.user_id IS NOT NULL) ');
        $query->where('(c.published = 1) ');

        // Filter search // Extra: Search more than one fields and for multiple words
        if (count($this->searchInFields))
        {
            $regex = str_replace(' ', '|', $this->getState('filter.search'));
            if (!empty($regex))
            {
                $db = JFactory::getDbo();
            	$q2 = $db->getQuery(true);
                $q2
                ->select('fc.company_id')
                ->select('GROUP_CONCAT(f.description ORDER BY f.description ASC SEPARATOR \' \') as factors ')
                ->from('#__ipie_factor_company fc')
                ->join('LEFT', '#__ipie_factor f ON (fc.factor_id=f.factor_id)')
                ->group('fc.company_id');
                
                $query->join('LEFT', sprintf('(%s) ftmp ON (c.company_id=ftmp.company_id)', $q2));
                
                $regex = ' REGEXP ' . $db->quote($regex);
                $query->where('(' . implode($regex . ' OR ', $this->searchInFields) . $regex . ')');
                //$query->where('( ftmp.factors ' . $regex . ')');
            }
        }

        // Filter
        $val = $this->getState('filter.name');
        if (!empty($val))
        {
            $query->where('(c.name LIKE \'%' . $val . '%\')');
        }

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
        // Filter
        $val = $this->getState('filter.sector');
        if (!empty($val))
        {
            $query->join('INNER', '#__ipie_subsector_company sc ON (sc.company_id=c.company_id)');
            $query->join('INNER', '#__ipie_subsector ss ON (ss.subsector_id=sc.subsector_id)');
            $query->where('(ss.sector_id=' . $val . ')');
        }
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     *
     * @since       1.6
     */
    protected function populateState($ordering = 'c.name', $direction = 'asc')
    {
        $app = JFactory::getApplication();

        // Load the filter state.
        $search = $this->getStateFromRequest('keywords', '', 'string');
        $this->setState('filter.search', preg_replace('/\s+/', ' ', $search));
        
        $name = $this->getStateFromRequest('filter_name', '', 'string');
        //Omit double (white-)spaces and set state
        $this->setState('filter.name', preg_replace('/\s+/', ' ', $name));

        //Filter (dropdown) state
        $state = $this->getStateFromRequest('filter_city', '', 'int');
        $this->setState('filter.city', $state);

        //Filter (dropdown) state
        $state = $this->getStateFromRequest('filter_province', '', 'int');
        $this->setState('filter.province', $state);

        //Filter (dropdown) state
        $state = $this->getStateFromRequest('filter_sector', '', 'int');
        $this->setState('filter.sector', $state);

        //Takes care of states: list. limit / start / ordering / direction
        $value = $this->getStateFromRequest('limit', $app->getCfg('list_limit'), 'uint');
        $limit = $value;
        $this->setState('list.limit', $limit);

        $value = $this->getStateFromRequest('limitstart', 0, 'uint');
        $limitstart = ($limit != 0 ? (floor($value / $limit) * $limit) : 0);
        $this->setState('list.start', $limitstart);

        // Check if the ordering field is in the white list, otherwise use the incoming value.
        $value = $this->getStateFromRequest('filter_order', $ordering);
        if (!in_array($value, $this->filter_fields))
        {
            $value = $ordering;
            $this->setState($this->context . '.ordercol', $value);
        }
        $this->setState('list.ordering', $value);

        // Check if the ordering direction is valid, otherwise use the incoming value.
        $value = $this->getStateFromRequest('filter_order_Dir', $direction);
        if (!in_array(strtoupper($value), array('ASC', 'DESC', '')))
        {
            $value = $direction;
            $this->setState($this->context . '.orderdirn', $value);
        }
        $this->setState('list.direction', $value);
    }
    


}