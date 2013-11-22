<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.modal');
JHtml::_('behavior.formvalidation');

$key_name = 'draft_id';

$params = JComponentHelper::getParams('com_ipie');

$app = JFactory::getApplication();
$success = $app->getUserState('com_ipie.edit.draft.success');
$app->setUserState('com_ipie.edit.draft.success', null);
$rawerrors = $app->getUserState('com_ipie.draft.errors');
$app->setUserState('com_ipie.draft.errors', null);
$errors = array();
if (count($rawerrors))
foreach ($rawerrors as $err) 
{
    list($field, $message) = explode('::', $err);
    $errors[$field] = JText::_($message);
}
function isValid($field, $errors) {
    return !isset($errors[$field]);
}
?>
<h2>Scheda azienda</h2>

	<p>La <strong>compilazione</strong> dei campi contrassegnati con il simbolo <strong>*</strong> è <strong>obbligatoria</strong> così come l’<strong>accettazione dell’informativa sul trattamento dei dati personali</strong>.</p>
	<p>Per eventuale assistenza in fase di compilazione, contattare il numero <strong>800.488.003.48</strong></p> 
	<p><a href="<?php echo JRoute::_('index.php?option=com_content&view=article&id=9') ?>">Scarica la label iPie</a></p>
	
<form action="<?php echo JRoute::_('index.php?option='.CNL.'&layout=edit&id='.(int) $this->form->getValue($key_name)); ?>"
      class="form-validate" method="post" name="adminForm" id="draft-form"
      enctype="multipart/form-data"
      >
        <fieldset>
                <legend><?php echo JText::_( 'Anagrafica azienda' ); ?></legend>
                <table class="maschera scheda">
                <colgroup style="width: 25%;"></colgroup>
                <colgroup style="width: 70%;"></colgroup>
                
                <?php $field = $this->form->getField('name') ?>
                <tr <?php echo isValid('name', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_name" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire il nome completo dell'azienda da registrare") ?>" /></td>
                </tr>
                
                <?php $field = $this->form->getField('ragione_sociale') ?>
                <tr <?php echo isValid('ragione_sociale', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><?php echo $field->input ?></td>
                </tr>
                
                <?php $field = $this->form->getField('piva') ?>
                <tr <?php echo isValid('piva', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_piva" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire la partita IVA") ?>" /></td>
                </tr>
                
                <?php $field = $this->form->getField('employees') ?>
                <tr <?php echo isValid('employees', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_employees" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire il numero di impiegati") ?>" /></td>
                </tr>
                
                <?php $field = $this->form->getField('year_foundation') ?>
                <tr <?php echo isValid('year_foundation', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_year_foundation" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire l'anno di fondazione") ?>" /></td>
                </tr>
                
                <?php $field = $this->form->getField('address') ?>
                <tr <?php echo isValid('address', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_address" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire l'indirizzo") ?>" /></td>
                </tr>
                
                <?php $field = $this->form->getField('cap') ?>
                <tr <?php echo isValid('cap', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_cap" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire il CAP") ?>" /></td>
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
                <tr <?php echo isValid('email', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_email" size="60" class="required"
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire un e-mail valida") ?>" /></td>
                </tr>
                
                <?php $field = $this->form->getField('web') ?>
                <tr <?php echo isValid('web', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><input name="<?php echo $field->name ?>" type="text" id="jform_web" size="60" class=""
                               value="<?php echo $field->value ?>"
                               placeholder="<?php echo JText::_("inserire un indirizzo web valido") ?>" /></td>
                </tr>

                <?php $field = $this->form->getField('logo') ?>
                <tr <?php echo isValid('logo', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?></th>
                    <td><?php echo $field->input ?>
                        <?php $field = $this->form->getField('current_logo') ?>
                        <?php echo $field->input ?>
                        <span class="piccolo">(formati consentiti .gif, .jpg, .png, dimensione massima 2Mb)</span>
                    </td>
                </tr>
                
                </table>
                
        </fieldset>
        <fieldset>
         <legend>Attività azienda</legend>
                <table class="maschera scheda">
                <colgroup style="width: 25%;"></colgroup>
                <colgroup style="width: 70%;"></colgroup>
                
                <?php $field = $this->form->getField('sectors') ?>
                <tr <?php echo isValid('sectors', $errors) ? '' : 'class="errore"' ?>>
                    <th colspan="2">
                        <table class="settori">
                            <colgroup style="width: 25%;"></colgroup>
                            <colgroup style="width: 70%;"></colgroup>
                            <tr>
                                <th>Settore principale *</th>
                                <th>Sotto categorie * <br />          
                                    <span class="piccolo">(per selezionare più di una sotto categoria tenere premuto il pasto CTRL su  windows o il tasto Mela su  Mac)</span>
                                </th>
                            </tr>
                            <?php echo $field->input ?>
                        </table>
                    </th>
                </tr>
                
                <?php $field = $this->form->getField('area_eccellenza_it') ?>
                <tr <?php echo isValid('area_eccellenza_it', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?>
                        <br /><span class="piccolo">massimo 1.500 caratteri</span>
                    </th>
                    <td><?php echo $field->input ?></td>
                </tr>
                
                <?php $field = $this->form->getField('area_eccellenza_en') ?>
                <tr <?php echo isValid('area_eccellenza_en', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?>
                        <br/><span class="piccolo">massimo 1.500 caratteri</span>
                    </th>
                    <td><?php echo $field->input ?></td>
                </tr>
                
                <?php $field = $this->form->getField('collaborazioni_it') ?>
                <tr <?php echo isValid('collaborazioni_it', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?>
                        <br/><span class="piccolo">massimo 500 caratteri</span>
                    </th>
                    <td><?php echo $field->input ?></td>
                </tr>

                <?php $field = $this->form->getField('collaborazioni_en') ?>
                <tr <?php echo isValid('collaborazioni_en', $errors) ? '' : 'class="errore"' ?>>
                    <th><?php echo $field->label ?>
                        <br/><span class="piccolo">massimo 500 caratteri</span>
                    </th>
                    <td><?php echo $field->input ?></td>
                </tr>

                <?php $field = $this->form->getField('tos') ?>
                <tr <?php echo isValid('tos', $errors) ? '' : 'class="errore"' ?>>
                    <td colspan="2" class="destra"> 
                        <input type="checkbox" name="<?php echo $field->name ?>" id="jform_tos" class="required validate-tos" value="1" 
                               <?php if ($field->value==1) :?>checked="checked"<?php endif; ?>
                               />
                        <?php 
                        $tosarticle = $params->get('tos_article');
                        $text = 'informativa sul trattamento dei dati personali';
                        $link = '<a class="modal" title="" href="index.php?option=com_content&amp;view=article&amp;layout=modal&amp;id=' . $tosarticle . '&amp;tmpl=component" rel="{handler: \'iframe\', size: {x:800, y:500}}">' . $text . '</a>';
                        ?>
                        <label for="jform_tos">dichiaro di aver preso visione e accettato l'<?php echo $link ?></label></td>
                </td>
                </tr>
                
                <tr>
                  <td colspan="2" class="destra">
                    <input type="reset" class="button" name="cancella" id="cancella" value="cancella" />  
                    <input type="submit" class="validate" id="submit" value="" style="display:none" />
                    <input type="submit" class="button" onclick="IPIE.saveDraft();return false;"
                        value="<?php echo JText::_('salva bozza');?>" />
                    <input type="submit" class="button" onclick="IPIE.sendDraft();return false;"
                        value="<?php echo JText::_('invia');?>" />
                    
                    <?php $field = $this->form->getField('draft_id') ?>
                    <?php echo $field->input ?>
                    <?php $field = $this->form->getField('company_id') ?>
                    <?php echo $field->input ?>
                    
                    <input type="hidden" id="draft-task" name="task" value="draft.save" />
                    <?php echo JHtml::_('form.token'); ?>
                  </td>
                </tr>
                </table>
                
        </fieldset>
    
</form>
    
<?php if (count($errors)) : ?>
<p class="ko">Per favore, compilare correttamente tutti i campi obbigatori della scheda e accettare l'informativa sul trattamento dei dati personali.</p>
<?php elseif ($success) : ?>
<p class="si">Gentile utente, la sua scheda è stata salvata come bozza ma non inoltrata a Unioncamere Piemonte. <br>
  Potrà apportare alla scheda le modifiche o integrazioni che ritiene necessarie e inviarla per l’approvazione a Unioncamere Piemonte premendo il bottone "Invia".</p>
<?php endif; ?>

    
<script type="text/javascript">
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
            /*var v = new FormValidator('draft-form');
            //v.validate();
            Array.each(v.getFields(), function(el){
            v.validateField(v);
            //console.log(v.validateField(v))
            });
            */
        });
    }
    
    
    var IPIE = IPIE || {};
    IPIE.saveDraft = function(task) {
        jQuery('input[name=task]').val('draft.save');
        jQuery('form input[type=submit]#submit').click();
    }
    IPIE.sendDraft = function(task) {
        jQuery('input[name=task]').val('draft.sendForApprovation');
        jQuery('form input[type=submit]#submit').click();
    }
</script>