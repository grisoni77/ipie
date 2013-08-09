<?php
defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('list');

class JFormFieldProvince extends JFormFieldList
{
    	/**
	 * The form field type.
	 *
	 * @var		string
	 * @since	1.6
	 */
	protected $type = 'Province';

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
		$options = IPieHelper::getProvinces();

		// Merge any additional options in the XML definition.
		$options = array_merge(parent::getOptions(), $options);

		return $options;
	}

	protected function ____getInput()
	{
	    $html = parent::getInput();
	    
	    $id = 'jform_'.$this->element['name'];
	    $doc = JFactory::getDocument();
	    $doc->addScriptDeclaration("
window.addEvent('domready', function() {
    $('".$id."').addEvent('change', function(){
        if (typeof callback_".$id." == 'function') {
            callback_".$id."(this);
        }
    })
});
	    ");
	    
	    return $html;
	}

}