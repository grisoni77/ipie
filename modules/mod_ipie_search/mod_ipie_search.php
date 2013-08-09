<?php

// no direct access
defined('_JEXEC') or die;

// Include the syndicate functions only once
require_once(dirname(__FILE__)) . '/helper.php';
require_once(dirname(__FILE__)) . '/../mod_ipie_sectors/helper.php';

$prov = modIPieSearchHelper::getProvinces();
$sectors = modIPieSectorsHelper::getSectors($params);

require JModuleHelper::getLayoutPath('mod_ipie_search', $params->get('layout', 'default'));
