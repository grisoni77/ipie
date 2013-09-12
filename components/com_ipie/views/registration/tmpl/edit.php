<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.modal');
JHtml::_('behavior.formvalidation');

$key_name = 'registration_id';

//print_r($this->form->getErrors());
$app = JFactory::getApplication();
$rawerrors = $app->getUserState('com_ipie.registration.errors', $errmsg);
$app->setUserState('com_ipie.registration.errors', null);
$errors = array();
foreach ($rawerrors as $err) 
{
    list($field, $message) = explode('::', $err);
    $errors[$field] = JText::_($message);
}
function isValid($field, $errors) {
    return !isset($errors[$field]);
}
?>

<h2><?php echo JText::_('REGISTRATION_TITLE') ?></h2>
<?php echo JText::_('REGISTRATION_INTRO_1') ?>
<?php echo JText::_('REGISTRATION_INTRO_2') ?>


<form action="<?php echo JRoute::_('index.php?option=' . CNL . '&layout=edit&id=' . (int) $this->item->$key_name); ?>"
      class="form-validate" method="post" name="adminForm" id="registration-form">
    <table class="maschera">
        <colgroup style="width: 20%;"></colgroup>
        <colgroup style="width: 75%;"></colgroup>

        <?php $field = $this->form->getField('name') ?>
        <tr <?php echo isValid('name', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->element['name'] ?><?php echo $field->label ?></th>
            <td><input name="<?php echo $field->name ?>" type="text" id="jform_name" size="60" class="required"
                       value="<?php echo $field->value ?>"
                       placeholder="<?php echo JText::_("inserire il nome completo dell'azienda da registrare") ?>" /></td>
        </tr>
        <?php $field = $this->form->getField('piva') ?>
        <tr <?php echo isValid('piva', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->label ?></th>
            <td><input name="<?php echo $field->name ?>" type="text" id="jform_iva" size="12" maxlength="12" 
                       value="<?php echo $field->value ?>"
                       class="required"
                       placeholder="<?php echo JText::_("partita IVA") ?>" /></td>
        </tr>
        <?php $field = $this->form->getField('province_id') ?>
        <tr <?php echo isValid('province_id', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->label ?></th>
            <td><?php echo $field->input ?></td>
        </tr>
        <?php $field = $this->form->getField('city_id') ?>
        <tr <?php echo isValid('city_id', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->label ?></th>
            <td><?php echo $field->input ?></td>
        </tr>
        <?php $field = $this->form->getField('email') ?>
        <tr <?php echo (isValid('email', $errors) ? '' : 'class="errore"') ?>>
            <th><?php echo $field->label ?></th>
            <td><input name="<?php echo $field->name ?>" type="text" id="jform_email" size="60" class="required validate-email"
                       value="<?php echo $field->value ?>"
                       placeholder="inserire un indirizzo e-mail valido" /></td>
        </tr>
        <?php $field = $this->form->getField('username') ?>
        <tr <?php echo isValid('username', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->label ?></th>
            <td><input name="<?php echo $field->name ?>" type="text" id="jform_username" size="60" class="required validate-username"
                       value="<?php echo $field->value ?>"
                       placeholder="scegliere un nome utente" /></td>
        </tr>
        <?php $field = $this->form->getField('password') ?>
        <tr <?php echo isValid('password', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->label ?></th>
            <td><input name="<?php echo $field->name ?>" type="password" id="jform_password" size="60" class="required" 
                       value="<?php echo $field->value ?>"
                       placeholder="scegliere una password (min. 8 caratteri)" /></td>
        </tr>
        <?php $field = $this->form->getField('password2') ?>
        <tr <?php echo isValid('password2', $errors) ? '' : 'class="errore"' ?>>
            <th><?php echo $field->label ?></th>
            <td><input name="<?php echo $field->name ?>" type="password" id="jform_password2" size="60" class="required validate-password2"
                       value="<?php echo $field->value ?>"
                       placeholder="confermare la password" /></td>
        </tr>
        <?php $field = $this->form->getField('tos') ?>
        <tr <?php echo isValid('tos', $errors) ? '' : 'class="errore"' ?>>
            <td colspan="2" class="destra"> 
                <input type="checkbox" name="<?php echo $field->name ?>" id="jform_tos" class="required validate-tos" value="1" 
                       <?php if ($field->value==1) :?>checked="checked"<?php endif; ?>
                       />
                <label for="jform_tos">dichiaro di aver preso visione e accettato l'<a href="#">informativa sul trattamento dei dati personali</a></label></td>
        </tr>
        <?php $field = $this->form->getField('piva') ?>
        <tr>
            <td colspan="2" class="destra">
                <input type="reset" class="button validate" name="cancella" id="cancella" value="<?php echo JText::_('RESET'); ?>" />   
                <input type="submit" class="button" name="invia" id="invia" value="<?php echo JText::_('Send'); ?>" /></td>
        </tr>
    </table>


    <div>
        <input type="hidden" name="task" value="registration.save" />
        <?php echo JHtml::_('form.token'); ?>
    </div>
</form>

<?php if (count($errors)) : ?>
    <p class="ko">
        <?php echo JText::_('COM_IPIE_REGISTRATION_INVALID') ?>
    <?php foreach($errors as $err): ?>
        <br/><?php echo $err ?>
    <?php endforeach; ?>
    </p>
<?php endif; ?>


<script>
    if (typeof(JFormValidator) != 'undefined') {
        // conforma mootools validation al template
        JFormValidator.prototype.handleResponse = function(state, el)
        {
            // Find the tr object for the given field if it exists
            var tr = el.getParent().getParent();

            // Set the proper classes
            if (state == false) {
                tr.addClass('errore');
            } else {
                tr.removeClass('errore');
            }
        };
        
        //add a validator for ALL instances
        FormValidator.add('tos', {
            errorMsg: '<?php echo JText::_('This field is required') ?>',
            test: function(element){
                return element.checked;
            }
        });
        
        window.addEvent('domready', function() {
            var v = new FormValidator('registration-form');
            //v.validate();
            Array.each(v.getFields(), function(el){console.log(v.validateField(v))});
            console.log('ciupa');
            
        });
    }
</script>