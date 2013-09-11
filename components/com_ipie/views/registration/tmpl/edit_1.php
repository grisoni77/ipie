<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.modal');
JHtml::_('behavior.formvalidation');

$key_name = 'registration_id';

?>
<form action="<?php echo JRoute::_('index.php?option='.CNL.'&layout=edit&id='.(int) $this->item->$key_name); ?>"
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
                <button type="submit" class="validate"><?php echo JText::_('JREGISTER');?></button>
                <?php echo JText::_('COM_USERS_OR');?>
                <a href="<?php echo JRoute::_('');?>" title="<?php echo JText::_('JCANCEL');?>"><?php echo JText::_('JCANCEL');?></a>
                <input type="hidden" name="task" value="registration.save" />
                <?php echo JHtml::_('form.token'); ?>
        </div>
</form>

