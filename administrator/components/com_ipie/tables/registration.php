<?php

// No direct access
defined('_JEXEC') or die('Restricted access');

/**
 * Table class
 */
class IPieTableRegistration extends IPieTableBase
{
    function store($updateNulls = false)
    {
        if (empty($this->company_id)) {
            $this->company_id = null;
        }
        
        return parent::store($updateNulls);
    }
    
}