<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla modelform library
jimport('joomla.application.component.modeladmin');

/**
 * Admin base Model
 */
class IPieModelAdmin extends JModelAdmin {

    public $_singular;
    public $_plural;

    public function __construct($config = array())
    {
        parent::__construct($config);

        // inflector
        $this->_singular = $this->getName();
        $this->_plural = IPieHelper::getPlural($this->_singular);
    }

    /**
     * Returns a reference to the a Table object, always creating it.
     *
     * @param       type    The table type to instantiate
     * @param       string  A prefix for the table class name. Optional.
     * @param       array   Configuration array for model. Optional.
     * @return      JTable  A database object
     * @since       2.5
     */
    public function getTable($type = null, $prefix = null, $config = array())
    {
        if (!isset($type))
        {
            $type = ucfirst($this->getName());
        }
        if (!isset($prefix))
        {
            $prefix = PFX . 'Table';
        }

        return JTable::getInstance($type, $prefix, $config);
    }

    /**
     * Method to get the record form.
     *
     * @param       array   $data           Data for the form.
     * @param       boolean $loadData       True if the form is to load its own data (default case), false if not.
     * @return      mixed   A JForm object on success, false on failure
     * @since       2.5
     */
    public function getForm($data = array(), $loadData = true)
    {
        // Get the form.
        $form = $this->loadForm(CNL . '.' . $this->_singular, $this->_singular, array('control' => 'jform', 'load_data' => $loadData));
        if (empty($form))
        {
            return false;
        }
        return $form;
    }

    /**
     * Method to get the data that should be injected in the form.
     *
     * @return      mixed   The data for the form.
     * @since       2.5
     */
    protected function loadFormData()
    {
        // Check the session for previously entered form data.
        $data = JFactory::getApplication()->getUserState(CNL . '.edit.' . $this->_singular . '.data', array());
        if (empty($data))
        {
            $data = $this->getItem();
        }
        return $data;
    }
    
	/**
	 * Stock method to auto-populate the model state.
	 *
	 * @return  void
	 *
	 * @since   11.1
	 */
	protected function populateState()
	{
		// Initialise variables.
		$key = 'id';

		// Get the pk of the record from the request.
		$pk = JRequest::getInt($key);
		$this->setState($this->getName() . '.id', $pk);

		// Load the parameters.
		$value = JComponentHelper::getParams($this->option);
		$this->setState('params', $value);
	}    

}