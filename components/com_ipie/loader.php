<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

if (defined('IPIE_LOADER')) {
    return;
}
define('IPIE_LOADER', 1);

// Registering classes
JLoader::register(PFX.'Helper',          JPATH_ADMINISTRATOR. '/components/'.CNL.'/helpers/base.php');
JLoader::register(PFX.'HelperUi',        JPATH_ADMINISTRATOR. '/components/'.CNL.'/helpers/ui.php');
JLoader::register(PFX.'HelperMailer',    JPATH_ADMINISTRATOR. '/components/'.CNL.'/helpers/mailer.php');
JLoader::register(PFX.'HelperRoute',     JPATH_SITE. '/components/'.CNL.'/helpers/route.php');

JLoader::discover(PFX.'ControllerForm', JPATH_ADMINISTRATOR. '/components/'.CNL.'/controllers/form.php', true, false);
JLoader::discover(PFX.'Model', JPATH_ADMINISTRATOR. '/components/'.CNL.'/models', true, false);
JLoader::discover(PFX.'Table', JPATH_ADMINISTRATOR. '/components/'.CNL.'/tables', true, false);
JLoader::discover(PFX.'Plugin', JPATH_ADMINISTRATOR. '/components/'.CNL.'/models/plugins', true, false);

// add model include path
jimport('joomla.application.component.model');
JModel::addIncludePath(JPATH_ADMINISTRATOR. '/components/'.CNL.'/models', PFX.'Model');
JModel::addIncludePath(JPATH_SITE. '/components/'.CNL.'/models', PFX.'SiteModel');
JModel::addTablePath(JPATH_ADMINISTRATOR. '/components/'.CNL.'/tables/', PFX.'Table');
// add form include path
JForm::addFormPath(JPATH_ADMINISTRATOR . '/components/'.CNL.'/models/forms');
JForm::addFieldPath(JPATH_ADMINISTRATOR . '/components/'.CNL.'/models/fields');
// add table include path
JTable::addIncludePath(JPATH_ADMINISTRATOR. '/components/'.CNL.'/tables/', PFX.'Table');

