<?php

// No direct access
defined('_JEXEC') or die('Restricted access');

// import Joomla table library
jimport('joomla.database.table');

/**
 * Base Table class
 */
class IPieTableBase extends JTable
{

    protected $_name = null;

    /**
     * Constructor
     *
     * @param object Database connector object
     */
    function __construct(&$db, $name = null, $keyName = null)
    {
        if (!isset($name)) {
            $name = sprintf('#__%s_%s', CN, $this->getName());
        }
        if (!isset($keyName)) {
            $keyName = $this->getName() . '_id';
        }
        parent::__construct($name, $keyName, $db);
    }

    /**
     * Method to get the model name
     *
     * The model name. By default parsed using the classname or it can be set
     * by passing a $config['name'] in the class constructor
     *
     * @return  string  The name of the model
     *
     * @since   11.1
     */
    public function getName()
    {
        if (empty($this->_name))
        {
            $r = null;
            if (!preg_match('/Table(.*)/i', get_class($this), $r))
            {
                JError::raiseError(500, JText::_('JLIB_APPLICATION_ERROR_TABLE_GET_NAME'));
            }
            $this->_name = strtolower($r[1]);
        }

        return $this->_name;
    }

    /**
     * Prepare and sanitise the table data prior to saving.
     *
     * @param   JTable  &$table  A reference to a JTable object.
     *
     * @return  void
     *
     * @since   11.1
     */
    protected function prepareTable(&$table)
    {
        // Derived class will provide its own implementation if required.
    }

    public function store($updateNulls = false)
    {
        // al primo save salva data e creatore
        $key = $this->getKeyName();
        if (property_exists($this, 'created_on') && empty($this->$key)) {
            $this->created_on = JFactory::getDate('now')->toMySQL();
        }
        if (property_exists($this, 'created_by') && empty($this->$key)) {
            $this->created_by = JFactory::getUser()->id;
        }
        if (property_exists($this, 'modified_on')) {
            $this->modified_on = JFactory::getDate('now')->toMySQL();
        }
        if (property_exists($this, 'modified_by')) {
            $this->modified_by = JFactory::getUser()->id;
        }
        // salva normalmente
        return parent::store($updateNulls);
    }

}