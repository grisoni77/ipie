<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require_once 'companies.php';
/**
 * Admin Model
 */
class IPieSiteModelSector extends IPieSiteModelCompanies
{

    public function getSector($sector_id = null) 
    {
        if (!isset($sector_id)) {
            $sector_id = $this->getState('filter.sector');
        }
        if (empty($sector_id)) {
            JError::raiseError(400, 'Bad sector ID');
        }
        $table = $this->getTable('Sector', 'IPieTable');
        $table->load($sector_id);
        return $table->getProperties();
    }

}
