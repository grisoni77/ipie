<?php

class IPieSiteModelCompany extends IPieModelCompany
{

    public function __construct($config = array())
    {
        $this->option = 'com_ipie';

        parent::__construct($config);
    }
    
    public function getData($company_id = null)
    {
        if (!isset($company_id)) {
            $company_id = $this->getState($this->getName() . '.id');
        }
        if (empty($company_id)) {
            JError::raiseError(400, 'ID is not valid in file ' . __FILE__);
        }
        
        //$item = $this->getItem($company_id);
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('c.*')
                ->select('ci.name as city, p.name as province')
                ->select('p.code as province_code')
                ->from('#__ipie_company c')
                ->join('INNER', '#__ipie_city ci ON (ci.city_id=c.city_id)')
                ->join('INNER', '#__ipie_province p ON (ci.province_id=p.province_id)')
                ->where('c.company_id = '.$company_id)
                ;
        $db->setQuery($query);
        $item = $db->loadObject();
        $item->related = $this->getRelated($company_id);
        $item->sectors = $this->getSectors();
        $item->factors = $this->getFactors();
        
        // aggiunge http scheme
	$web = new JUri($item->web);
	$scheme = $web->getScheme();
	if (empty($scheme)) {
		$web->setScheme('http');
		$item->web = $web->toString();
	}

        return $item;
    }

    /**
     * La relazione tra aziende simili è definita dall’appartenenza 
     * alla medesima sottocategoria, qualora le aziende con la medesima
     * sotto-categoria fossero in numero inferiore di 2, 
     * la relazione si estende al tutto il settore principale.
     * 
     * @param type $company_id
     */
    public function getRelated($company_id = null)
    {
        if (!isset($company_id)) {
            $company_id = $this->getState($this->getName() . '.id');
        }
        if (empty($company_id)) {
            JError::raiseError(400, 'ID is not valid in file ' . __FILE__);
        }

        // get sottocategorie dell'azienda
        $sectors = $this->getSectors($company_id);
        $subsectors = $this->getSubSectors($company_id);
        $s_ids = array();
        foreach ($sectors as $s) {
            $s_ids[] = $s->sector_id;
        }
        $ss_ids = array();
        foreach ($subsectors as $ss) {
            $ss_ids[] = $ss->subsector_id;
        }

        // get related by sottocategoria
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('DISTINCT c.*')
                ->from('#__ipie_company c')
                ->join('', '#__ipie_subsector_company sc ON (sc.company_id=c.company_id)')
                ->where('c.published = 1')
                ->where('c.company_id != ' . $company_id)
                ->where('sc.subsector_id IN (' . implode(',', $ss_ids) . ')')
                ->order('c.name ASC')
        ;
        $db->setQuery($query);
        //echo $db->replacePrefix($query);//die();
        $related = $db->loadObjectList();
        
        // se ce ne sono meno di due 
        // get related by settore principale
        if (count($related)<2) 
        {
            $query = $db->getQuery(true);
            $query
                    ->select('DISTINCT c.*')
                    ->from('#__ipie_company c')
                    ->join('', '#__ipie_subsector_company sc ON (sc.company_id=c.company_id)')
                    ->join('', '#__ipie_subsector ss ON (sc.subsector_id=ss.subsector_id)')
                    ->where('c.published = 1')
                    ->where('c.company_id != ' . $company_id)
                    ->where('ss.sector_id IN (' . implode(',', $s_ids) . ')')
                    ->order('c.name ASC')
            ;
            $db->setQuery($query);
            //echo $db->replacePrefix($query);//die();
            $related = $db->loadObjectList();
        }
        
        // return related
        return $related;
    }

    public function getSectors($company_id = null)
    {
        if (!isset($company_id)) {
            $company_id = $this->getState($this->getName() . '.id');
        }
        if (empty($company_id)) {
            JError::raiseError(400, 'ID is not valid in file ' . __FILE__);
        }
        // get sottocategorie
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('DISTINCT s.*')
                ->from('#__ipie_subsector_company sc')
                ->join('', '#__ipie_subsector ss ON (sc.subsector_id=ss.subsector_id)')
                ->join('', '#__ipie_sector s ON (s.sector_id=ss.sector_id)')
                ->where('sc.company_id = ' . $company_id)
                ->order('ss.name ASC')
        ;
        $db->setQuery($query);
        return $db->loadObjectList();
    }

    public function getSubSectors($company_id = null)
    {
        if (!isset($company_id)) {
            $company_id = $this->getState($this->getName() . '.id');
        }
        if (empty($company_id)) {
            JError::raiseError(400, 'ID is not valid in file ' . __FILE__);
        }
        // get sottocategorie
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('ss.*')
                ->from('#__ipie_subsector_company sc')
                ->join('', '#__ipie_subsector ss ON (sc.subsector_id=ss.subsector_id)')
                ->where('sc.company_id = ' . $company_id)
                ->order('ss.name ASC')
        ;
        $db->setQuery($query);
        //echo $db->replacePrefix($query);die();
        return $db->loadObjectList();
    }

    public function getFactors($company_id = null)
    {
        if (!isset($company_id)) {
            $company_id = $this->getState($this->getName() . '.id');
        }
        if (empty($company_id)) {
            JError::raiseError(400, 'ID is not valid in file ' . __FILE__);
        }
        // get sottocategorie
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query
                ->select('f.*')
                ->from('#__ipie_factor_company fc')
                ->join('', '#__ipie_factor f ON (fc.factor_id=f.factor_id)')
                ->where('f.published = 1')
                ->where('fc.company_id = ' . $company_id)
                ->order('f.description  ASC')
        ;
        $db->setQuery($query);
        //echo $db->replacePrefix($query);die();
        return $db->loadObjectList();
    }

}