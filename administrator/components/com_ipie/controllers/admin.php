<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla controlleradmin library
jimport('joomla.application.component.controlleradmin');

/**
 * Admin base Controller
 */
class IPieControllerAdmin extends JControllerAdmin {

    public $_singular;
    public $_plural;

    public function __construct($config = array())
    {
        parent::__construct($config);

        // inflector
        $this->_plural = $this->getSubName();
        $this->_singular = IPieHelper::getSingular($this->_plural);
        
        // set text prefix according to entity name
        $this->text_prefix = strtoupper($this->option.'_'.$this->_singular);
    }

    /**
     * Method to get the controller name
     *
     * The dispatcher name is set by default parsed using the classname, or it can be set
     * by passing a $config['name'] in the class constructor
     *
     * @return  string  The name of the dispatcher
     *
     * @since   11.1
     */
    public function getSubName()
    {
        if (empty($this->subname))
        {
            $r = null;
            if (!preg_match('/Controller(.*)/i', get_class($this), $r))
            {
                JError::raiseError(500, JText::_('JLIB_APPLICATION_ERROR_CONTROLLER_GET_SUBNAME'));
            }
            $this->subname = strtolower($r[1]);
        }

        return $this->subname;
    }

    /**
     * Proxy for getModel.
     * @since       2.5
     */
    public function getModel($name = null, $prefix = null)
    {
        if (!isset($name))
        {
            $name = ucfirst($this->_singular);
        }
        if (!isset($prefix))
        {
            $prefix = PFX . 'Model';
        }
        echo $name . $prefix;

        $model = parent::getModel($name, $prefix, array('ignore_request' => true));
        return $model;
    }

}