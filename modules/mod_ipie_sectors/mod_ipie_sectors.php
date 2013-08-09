<?php

// no direct access
defined('_JEXEC') or die;

// Include the syndicate functions only once
require_once(dirname(__FILE__)) . '/helper.php';

$list   = modIPieSectorsHelper::getSectors($params);

require JModuleHelper::getLayoutPath('mod_ipie_sectors', $params->get('layout', 'default'));
