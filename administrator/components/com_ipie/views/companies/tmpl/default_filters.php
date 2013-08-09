<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted Access');

$searchterms      = $this->state->get('filter.search');

?>

        <fieldset id="filter-bar">
                <div class="filter-search fltlft">
                        <input type="text" name="filter_search" id="filter_search" value="<?php echo $this->escape($searchterms); ?>" title="<?php echo JText::_('Search'); ?>" />
                        <button type="submit">
                                <?php echo JText::_('JSEARCH_FILTER_SUBMIT'); ?>
                        </button>
                        <button type="button" onclick="document.id('filter_search').value='';this.form.submit();">
                                <?php echo JText::_('JSEARCH_FILTER_CLEAR'); ?>
                        </button>
                </div>
                <div class="filter-select fltrt">
                    
                        <?php echo IPieHelperUi::getPublishedFilter($this->state->get('filter.published')) ?>
 
                </div>
        </fieldset>
