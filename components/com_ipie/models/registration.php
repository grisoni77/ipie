<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 *  Model
 */
class IPieSiteModelRegistration extends IPieModelAdmin
{

    public function __construct($config = array())
    {
        $this->option = 'com_ipie';
        parent::__construct($config);
    }

    /**
     * Method to get the data that should be injected in the form.
     *
     * @return	mixed	The data for the form.
     * @since	1.6
     */
    protected function loadFormData()
    {
        return $this->getData();
    }

    public function getData()
    {
        if ($this->data === null) {

            $this->data = new stdClass();
            $app = JFactory::getApplication();

            // Override the base user data with any data in the session.
            $temp = (array) $app->getUserState('com_ipie.registration.data', array());
            foreach ($temp as $k => $v) {
                $this->data->$k = $v;
            }

            // Unset the passwords.
            unset($this->data->password);
            unset($this->data->password2);

        }

        return $this->data;
    }

}