<?php

defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('list');

class JFormFieldFreecompany extends JFormFieldList
{

    /**
     * The form field type.
     *
     * @var		string
     * @since	1.6
     */
    protected $type = 'Freecompany';

    /**
     * Method to get the field options.
     *
     * @return	array	The field option objects.
     * @since	1.6
     */
    protected function getOptions()
    {
        // Initialise variables.
        $options = array();

        // get province
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('c.name as text, c.company_id as value')
                ->from('#__ipie_company AS c')
                ->where('c.user_id IS NULL')
                ->order('c.name')
        ;
        $db->setQuery($query);
        $options = $db->loadObjectList();

        // Merge any additional options in the XML definition.
        $nullobj = array('text'=>'- Scegli un\'azienda -', 'value'=>'');
        $nullobj = JArrayHelper::toObject($nullobj);
        array_unshift($options, $nullobj);

        return $options;
    }

}