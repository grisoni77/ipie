<?php

// no direct access
defined('_JEXEC') or die;

// Include the syndicate functions only once
require_once JPATH_ADMINISTRATOR.'/components/com_ipie/defines.php';
require_once JPATH_SITE.'/components/com_ipie/loader.php';
require_once (dirname(__FILE__)) . '/helper.php';
require_once (dirname(__FILE__)) . '/../mod_ipie_sectors/helper.php';

$prov = modIPieSearchHelper::getProvinces($params);
$sectors = modIPieSectorsHelper::getSectors($params);
// get module state
$pfx = 'mod.ipie.search.';
$filter_sector = JFactory::getApplication()->getUserStateFromRequest($pfx.'filter_sector', 'filter_sector', 0, 'int');
$filter_province = JFactory::getApplication()->getUserStateFromRequest($pfx.'filter_province', 'filter_province', 0, 'int');
$keywords = JFactory::getApplication()->getUserStateFromRequest($pfx.'keywords', 'keywords', '', 'string');
$filter_name = JFactory::getApplication()->getUserStateFromRequest($pfx.'filter_name', 'filter_name', '', 'string');

require JModuleHelper::getLayoutPath('mod_ipie_search', $params->get('layout', 'default'));
