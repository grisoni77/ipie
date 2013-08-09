<?php

defined('JPATH_BASE') or die;

jimport('joomla.form.formrule');

class JFormRulePassword2 extends JFormRule {

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
        $password = $input->get('password');
        $password2 = $input->get('password');
        if ( $password != $password2
             || empty($password) ) {
            return false;
        }
        return true;
    }

}