<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted Access');

// load tooltip behavior
JHtml::_('behavior.tooltip');
?>
<form action="<?php echo JRoute::_('index.php?option='.CNL); ?>" method="post" name="adminForm" id="adminForm">
    
    <fieldset id="suspend-fieldset" class="adminform">
        <legend><?php echo JText::_('Inserisci una motivazione'); ?></legend>
        <ul class="adminformlist">
            <li>
            <label>Inserisci una motivazione da allegare alla e-mail</label>
            <textarea id="reason-fake" name="reason" cols="60" rows="5"></textarea>
            </li>
        </ul>
        <button onclick="Suspend.send();return false;">Conferma rifiuto</button>
        <button onclick="Suspend.close();return false;">Annulla</button>
    </fieldset>

    <thead><?php echo $this->loadTemplate('filters'); ?></thead>
    <table class="adminlist">
        <thead><?php echo $this->loadTemplate('head'); ?></thead>
        <tfoot><?php echo $this->loadTemplate('foot'); ?></tfoot>
        <tbody><?php echo $this->loadTemplate('body'); ?></tbody>
    </table>
    <div>
        <input type="hidden" name="task" value="" />
        <input type="hidden" name="boxchecked" value="0" />
        <?php echo JHtml::_('form.token'); ?>
    </div>
</form>

<script type="text/javascript">
    Joomla.submitbutton = function(task) {
        if (task == 'companies.suspend') {
            Suspend.open();
            return false;
        }
        submitform(task);
    }
    var Suspend = {
        'slider': new Fx.Slide('suspend-fieldset', {duration: 500}),
        'open': function() {
            this.slider.slideIn();
        },
        'close': function() {
            this.slider.slideOut();
        },
                
        'hide': function() {
            this.slider.hide();
        },
                
        'send': function() {
            Joomla.submitform('companies.suspend');
        }
    };
    Suspend.hide();
</script>

