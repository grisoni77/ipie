<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.modal');

$key_name = $this->_singular.'_id';
?>
<form action="<?php echo JRoute::_('index.php?option='.CNL.'&layout=edit&id='.(int) $this->item->$key_name); ?>"
      method="post" name="adminForm" id="<?php echo $this->_singular ?>-form"
      enctype="multipart/form-data" >
        <?php foreach($this->form->getFieldsets() as $fs): ?>
        <fieldset class="adminform">
                <legend><?php echo JText::_($fs->name); ?></legend>
                <ul class="adminformlist">
                <?php foreach($this->form->getFieldset($fs->name) as $field): ?>
                        <li><?php echo $field->label;echo $field->input;?></li>
                <?php endforeach; ?>
                </ul>
        </fieldset>
        <?php endforeach; ?>
        <div>
                <input type="hidden" name="task" value="<?php echo $this->_singular ?>.edit" />
                <?php echo JHtml::_('form.token'); ?>
        </div>
</form>

