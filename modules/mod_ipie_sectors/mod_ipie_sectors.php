<?php

// no direct access
defined('_JEXEC') or die;

// Include the syndicate functions only once
require_once JPATH_ADMINISTRATOR.'/components/com_ipie/defines.php';
require_once JPATH_SITE.'/components/com_ipie/loader.php';
require_once (dirname(__FILE__)) . '/helper.php';

$language = JFactory::getLanguage();
$language->load('com_ipie', JROOT, false, true);


$list   = modIPieSectorsHelper::getSectors($params);
// get module state
$pfx = 'mod.ipie.search.';
$filter_sector = JFactory::getApplication()->getUserStateFromRequest($pfx.'filter_sector', 'filter_sector', 0, 'int');

require JModuleHelper::getLayoutPath('mod_ipie_sectors', $params->get('layout', 'default'));