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
    
        <fieldset id="reject-fieldset" class="adminform">
            <legend><?php echo JText::_('Inserisci una motivazione'); ?></legend>
            <ul class="adminformlist">
                <li>
                <label>Inserisci una motivazione da allegare alla e-mail</label>
                <textarea id="reason-fake" name="reason" cols="60" rows="5"></textarea>
                </li>
            </ul>
            <button onclick="Reject.send();return false;">Conferma rifiuto</button>
            <button onclick="Reject.close();return false;">Annulla</button>
        </fieldset>

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
                <!--<input type="hidden" id="reason" name="reason" value="" />-->
                <input type="hidden" name="task" value="<?php echo $this->_singular ?>.edit" />
                <?php echo JHtml::_('form.token'); ?>
        </div>
</form>

<script type="text/javascript">
    Joomla.submitbutton = function(task) {
        if (task == 'draft.reject') {
            Reject.open();
            return false;
        }
        submitform(task);
    }
    var Reject = {
        'slider': new Fx.Slide('reject-fieldset', {duration: 500}),
        'open': function() {
            this.slider.slideIn();
//            SqueezeBox.open($('reject-modal'), {
//		handler: 'adopt',
//		size: {x: 300, y: 200}
//            });
        },
        'close': function() {
            this.slider.slideOut();
//            $('reject-container').adopt($('reject-modal'));
//            SqueezeBox.close();
        },
                
        'hide': function() {
            this.slider.hide();
//            $('reject-container').adopt($('reject-modal'));
//            SqueezeBox.close();
        },
                
        'send': function() {
//            this.slider.hide();
//            $('reason').value = $('reason-fake').value;
            Joomla.submitform('draft.reject');
        }
    };
    Reject.hide();
</script>

