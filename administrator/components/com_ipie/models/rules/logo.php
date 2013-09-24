<?php

defined('JPATH_BASE') or die;

jimport('joomla.form.formrule');

class JFormRuleLogo extends JFormRule {

    /**
     * Method to test the email address and optionally check for uniqueness.
     *
     * @param   SimpleXMLElement  &$element  The SimpleXMLElement object representing the <field /> tag for the form field object.
     * @param   mixed             $value     The form field value to validate.
     * @param   string            $group     The field name group control value. This acts as as an array container for the field.
     *                                       For example if the field has name="foo" and the group value is set to "bar" then the
     *                                       full field name would end up being "bar[foo]".
     * @param   JRegistry         &$input    An optional JRegistry object with the entire data set to validate against the entire form.
     * @param   object            &$form     The form object for which the field is being tested.
     *
     * @return  boolean  True if the value is valid, false otherwise.
     *
     * @since   11.1
     * @throws  JException on invalid rule.
     */
    public function test(&$element, $value, $group = null, &$input = null, &$form = null)
    {
        // get input
        $jinput = JFactory::getApplication()->input;
        $files = $jinput->files->get('jform');
        //print_r($files);die();
        $file = $files['logo'];
        // get form db
        $cl = $input->get('current_logo');
        // field required se non ce n'è già uno in db
//        if (empty($file['name']) && empty($cl)) {
//            return false;
//        }
        if ($file['size'] > 2*1024*1024) {
            return false;
        }
        return true;
    }

}