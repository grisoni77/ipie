<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');

require JPATH_COMPONENT_ADMINISTRATOR.DS.'defines.php'; 
require JPATH_COMPONENT.DS.'loader.php';

// import joomla controller library
jimport('joomla.application.component.controller');
 
// Get an instance of the controller prefixed by BnB
$controller = JController::getInstance(PFX);

// Get the task
$jinput = JFactory::getApplication()->input;
$task = $jinput->get('task', "", 'STR' );
 
// Perform the Request task
$controller->execute($task);
 
// Redirect if set by the controller
$controller->redirect();