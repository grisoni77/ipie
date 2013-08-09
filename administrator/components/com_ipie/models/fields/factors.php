<?php

defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('checkboxes');

class JFormFieldFactors extends JFormFieldCheckboxes
{

    /**
     * The form field type.
     *
     * @var		string
     * @since	1.6
     */
    protected $type = 'Factors';

    protected function getOptions()
    {
        // Initialize variables.
        $options = array();
        $factors = IPieHelper::getFactors();

        foreach ($factors as $factor)
        {
            JHtmlSelect::option($value);
            // Create a new option object based on the <option /> element.
            $options[] = JHtml::_(
                'select.option', (string) $factor->factor_id, 
                    $factor->description.($factor->published==0 ? ' <em>(non pubblicato)</em>' : '') 
            );
        }

        reset($options);

        return $options;
    }


}