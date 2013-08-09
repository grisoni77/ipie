<?php
defined('JPATH_BASE') or die;

JHtml::_('behavior.modal');

jimport('joomla.html.html');
jimport('joomla.form.formfield');
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('file');

class JFormFieldLogo extends JFormFieldFile
{
    	/**
	 * The form field type.
	 *
	 * @var		string
	 * @since	1.6
	 */
	public $type = 'Logo';

	protected function getInput()
	{
	    $html = parent::getInput();
            if (!empty($this->value)) {
                if (!empty($this->element['folder'])) {
                    $src = JUri::root().'images/ipie/logo/'.$this->element['folder'].'/'.$this->value;
                } else {
                    $src = JUri::root().'images/ipie/logo/'.$this->value;
                }
                
                $html .= '<a class="modal" href="'.$src.'">';
                $html .= '<img style="width:100px" src="'.$src.'" />';
                $html .= '</a>';
            }
	    
	    return $html;
	}

}