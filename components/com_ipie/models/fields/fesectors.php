<?php
defined('JPATH_BASE') or die;

require_once JPATH_COMPONENT_ADMINISTRATOR.'/models/fields/sectors.php';

class JFormFieldFesectors extends JFormFieldSectors
{
    	/**
	 * The form field type.
	 *
	 * @var		string
	 * @since	1.6
	 */
	protected $type = 'Fesectors';
	
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
                $html .= sprintf('<tr><td>%s</td> <td>%s</td></tr>', $cb, $select);
                //$html .= sprintf('<div class="ss-item">%s %s</div><br/>', $cb, $select);
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