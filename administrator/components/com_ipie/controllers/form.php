<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla controllerform library
jimport('joomla.application.component.controllerform');

/**
 * Form base Controller
 */
class IPieControllerForm extends JControllerForm
{

    public $_singular;
    public $_plural;

    public function __construct($config = array())
    {
        parent::__construct($config);

        // inflector
        $this->_singular = $this->getSubName();
        $this->_plural = IPieHelper::getPlural($this->_singular);
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
     * Method to edit an existing record.
     * Devo fare override.. altrimenti usa la key della table come urlVar
     * che nel mio caso non è "id" ma "<nome al singolare>_id"
     * TODO: capire perchè questo comportamento
     *
     * @param   string  $key     The name of the primary key of the URL variable.
     * @param   string  $urlVar  The name of the URL variable if different from the primary key
     * (sometimes required to avoid router collisions).
     *
     * @return  boolean  True if access level check and checkout passes, false otherwise.
     *
     * @since   11.1
     */
    public function edit($key = null, $urlVar = 'id')
    {
        return parent::edit($key, $urlVar);
    }

    /**
     * Method to save a record.
     * Devo fare override.. altrimenti usa la key della table come urlVar
     * che nel mio caso non è "id" ma "<nome al singolare>_id"
     * TODO: capire perchè questo comportamento
     *
     * @param   string  $key     The name of the primary key of the URL variable.
     * @param   string  $urlVar  The name of the URL variable if different from the primary key (sometimes required to avoid router collisions).
     *
     * @return  boolean  True if successful, false otherwise.
     *
     * @since   11.1
     */
    public function save($key = null, $urlVar = 'id')
    {
        return parent::save($key, $urlVar);
    }

    /**
     * Check XMLHttpRequest
     * 
     * @return bool true se Ã¨ XHR  
     */
    function isAjaxRequest()
    {
        return (
            !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'
        );
    }

    /**
     * Return HTTP Request method
     * @return 
     */
    function getHttpMethod()
    {
        if (PHP_SAPI != 'cli')
        {
            $method = strtoupper($_SERVER['REQUEST_METHOD']);

            if ($method == 'POST')
            {
                if (isset($_SERVER['X-HTTP-Method-Override'])) {
                    $method = strtoupper($_SERVER['X-HTTP-Method-Override']);
                }
            }
        }
        else
        {
            $method = 'CLI';
        }

        return $method;
    }
    
    

}