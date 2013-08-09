<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require 'defines.php'; 
require 'loader.php';

// import joomla controller library
jimport('joomla.application.component.controller');
 
// Get an instance of the controller prefixed by Ipie
$controller = JController::getInstance('Ipie');
 
// Perform the Request task
$input = JFactory::getApplication()->input;
$controller->execute($input->getCmd('task'));
 
// Redirect if set by the controller
$controller->redirect();