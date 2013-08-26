<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.modal');
JHtml::_('behavior.formvalidation');

$key_name = 'draft_id';
print_r($this->item);
?>
<form action="<?php echo JRoute::_('index.php?option='.CNL.'&layout=edit&id='.(int) $this->form->getValue($key_name)); ?>"
      class="form-validate" method="post" name="adminForm" id="<?php echo $this->_singular ?>-form">
        <fieldset class="adminform">
                <legend><?php echo JText::_( 'Details' ); ?></legend>
                <ul class="adminformlist">
<?php foreach($this->form->getFieldset() as $field): ?>
                        <li><?php echo $field->label;echo $field->input;?></li>
<?php endforeach; ?>
                </ul>
        </fieldset>
        <div>
            <button type="submit" class="validate" onclick="IPIE.submitDraft('draft.save');return false;">
                <?php echo JText::_('Salva');?></button>
            <button type="submit" onclick="IPIE.submitDraft('draft.sendForApprovation');return false;">
                <?php echo JText::_('Invia');?></button>
            <a href="<?php echo JRoute::_('');?>" title="<?php echo JText::_('JCANCEL');?>"><?php echo JText::_('JCANCEL');?></a>
            <input type="hidden" id="<?php echo $this->_singular ?>-task" name="task" value="draft.save" />
            <?php echo JHtml::_('form.token'); ?>
        </div>
</form>

<script type="text/javascript">
    var IPIE = IPIE || {};
    IPIE.submitDraft = function(task) {
        jQuery('#<?php echo $this->_singular ?>-task').val(task);
        jQuery('#<?php echo $this->_singular ?>-form').submit();
    }
</script>

