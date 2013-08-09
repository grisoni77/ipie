<?php
defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('list');

class JFormFieldCity extends JFormFieldList
{
    	/**
	 * The form field type.
	 *
	 * @var		string
	 * @since	1.6
	 */
	protected $type = 'City';

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

		// Filter by the type
		$province_id = $this->form->getValue('province_id');
		$options = IPieHelper::getCities($province_id);

		// Merge any additional options in the XML definition.
		$options = array_merge(parent::getOptions(), $options);

		return $options;
	}
	
	protected function getInput()
	{
	    $html = parent::getInput();
	    	    
	    $id = 'jform_'.$this->element['name'];
	    $pid = 'jform_'.$this->element['provfld'];
	    $doc = JFactory::getDocument();
	    
	    $provinces = IPieHelper::getProvinces();
	    $dati = 'var comuni = [];';
	    foreach ($provinces as $prov) 
	    {
	        $comuni = IPieHelper::getCities($prov->province_id);
	        $dati .= 'comuni['.$prov->province_id.'] = [];';
	        foreach ($comuni as $c)
	        {
	            $dati .= 'comuni['.$prov->province_id.'].push({"value":'.$c->city_id.',"text":"'.$c->name.'"});';
	        }
	    }
	    
	    $doc->addScriptDeclaration(
	    $dati."
var callback_".$pid." = function(sel) {
    var pid = sel.value;
    var list = comuni[pid];
    var csel = $('".$id."');
    csel.options.length = null;
    for (var i=0; i<list.length; i++) {
        csel.options[i] = new Option(list[i].text,list[i].value);
    }
}
window.addEvent('domready', function() {
    $('".$pid."').addEvent('change', function(){
        if (typeof callback_".$pid." == 'function') {
            callback_".$pid."(this);
        }
    })
});

	    ");
	    
	    return $html;
	}

}