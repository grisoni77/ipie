<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// Registering classes
JLoader::register(PFX.'Helper',          dirname(__FILE__).'/helpers/base.php');
JLoader::register(PFX.'HelperUi',        dirname(__FILE__).'/helpers/ui.php');
JLoader::register(PFX.'HelperToolbar',   dirname(__FILE__).'/helpers/toolbar.php');
JLoader::register(PFX.'HelperMailer',   dirname(__FILE__).'/helpers/mailer.php');

JLoader::register(PFX.'Controller',      dirname(__FILE__).'/controller.php');
JLoader::register(PFX.'ControllerAdmin', dirname(__FILE__).'/controllers/admin.php');
JLoader::register(PFX.'ControllerForm',  dirname(__FILE__).'/controllers/form.php');

JLoader::register(PFX.'ModelAdmin',      dirname(__FILE__).'/models/admin.php');
JLoader::register(PFX.'ModelList',       dirname(__FILE__).'/models/list.php');

JLoader::register(PFX.'TableBase',       dirname(__FILE__).'/tables/base.php');
JLoader::register(PFX.'TableMultiKeys',  dirname(__FILE__).'/tables/multikeys.php');

JLoader::register(PFX.'View',            dirname(__FILE__).'/views/view.html.php');
JLoader::register(PFX.'ViewList',        dirname(__FILE__).'/views/listview.html.php');
JLoader::register(PFX.'ViewForm',        dirname(__FILE__).'/views/formview.html.php');

JLoader::register(PFX.'PluginCompany',      dirname(__FILE__).'/models//plugins/company.php');
JLoader::register(PFX.'PluginDraft',      dirname(__FILE__).'/models//plugins/draft.php');


// html class
JHtml::addIncludePath( dirname(__FILE__).'/helpers/html');