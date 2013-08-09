<?php
defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');
jimport('joomla.form.helper');

class JFormFieldSectors extends JFormField
{
    	/**
	 * The form field type.
	 *
	 * @var		string
	 * @since	1.6
	 */
	protected $type = 'Sectors';

	protected function getOptions()
	{
	    // Initialise variables.
		$options = array();

		// Filter by the type
		$sectors = IPieHelper::getSectors();
                foreach ($sectors as $s)
                {
                    $options[$s->sector_id] = array(
                        'sector' => $s,
                        'subsectors' => IPieHelper::getSubSectors($s->sector_id),
                    );
                }

		return $options;
	}
	
	protected function getInput()
	{
            $html = '<div class="ss-box">';
            
            $options = $this->getOptions();
            //print_r($options);
            foreach ($options as $o) 
            {
                $cb = '<label><input id="sector-'.$o['sector']->sector_id.'" class="ss-trigger" type="checkbox" rel="subs-'.$o['sector']->sector_id.'" />'.$o['sector']->name.'</label>';
                $select = JHtml::_('select.genericlist', $o['subsectors'], $this->name.'[]', 
                        ' class="ss-select" multiple="multiple" disabled="disabled" rel="sector-'.$o['sector']->sector_id.'" ', 
                        'subsector_id', 'name', 
                        $this->value, 'subs-'.$o['sector']->sector_id);
                $html .= sprintf('<div class="ss-item">%s %s</div><br/>', $cb, $select);
            }          
            $html .= '</div>';
            
            $doc = JFactory::getDocument();
            $doc->addStyleDeclaration("
                .ss-box {display: inline-block; }
            ");
            
            $doc->addScriptDeclaration("
window.addEvent('domready', function() {
    $$('.ss-trigger').addEvent('change', function(){
        $($(this.id).get('rel')).set('disabled', !this.checked);
    });
    $$('.ss-select option').each(function(el){
        if (el.selected) {
            $(el).getParent().set('disabled', false);
            $($(el).getParent().get('rel')).checked=true;
        }
    });
});
            ");
            
            return $html;
	}

}