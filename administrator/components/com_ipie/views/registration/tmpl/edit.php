<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.modal');

$key_name = $this->_singular.'_id';

?>
<form action="<?php echo JRoute::_('index.php?option='.CNL.'&layout=edit&id='.(int) $this->item->$key_name); ?>"
      method="post" name="adminForm" id="<?php echo $this->_singular ?>-form">
        <fieldset class="adminform">
                <legend><?php echo JText::_( 'Details' ); ?></legend>
                <ul class="adminformlist">
<?php foreach($this->form->getFieldset() as $field): ?>
                        <li><?php echo $field->label;echo $field->input;?></li>
<?php endforeach; ?>
                </ul>
        </fieldset>
        <div>
                <input type="hidden" name="task" value="<?php echo $this->_singular ?>.approve" />
                <?php echo JHtml::_('form.token'); ?>
        </div>
</form>

