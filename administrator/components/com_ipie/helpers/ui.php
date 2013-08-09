<?php

/**
 * Base helper
 *
 * @author cris
 */
class IPieHelperUi {
    
    static public function getCompanyFilter($selected)
    {
        $model = JModel::getInstance('Companies', 'IPieModel');
        $opts = $model->getItems();
        array_unshift($opts, JHtml::_('select.option', '', 'Select seller', 'company_id', 'name'));
        
        return JHtml::_('select.genericlist', $opts, 'filter_seller', 'onchange="this.form.submit()"', 'company_id', 'name', $selected, null, true);

    }

    static public function getPublishedFilter($selected, $options = array('trash'=>false, 'archived'=>false))
    {
        $opts = JHtml::_('jgrid.publishedOptions', $options);
        array_unshift($opts, JHtml::_('select.option', '', 'JOPTION_SELECT_PUBLISHED', 'value', 'text'));
        
        return JHtml::_('select.genericlist', $opts, 'filter_published', 'onchange="this.form.submit()"', 'value', 'text', $selected, null, true);

    }
    
}

