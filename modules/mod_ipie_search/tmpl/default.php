<?php 
//$doc = JFactory::getDocument();
//$doc->addScript(JURI::root().'/modules/mod_ipie_search/assets/jquery.placeholder.js');

$action = 'index.php';//JRoute::_('index.php');

?>
<form action="<?php echo $action ?>" method="get" class="-koowa-grid" id="form1">
    <div id="form_az">
        <label for="chiave"><?php echo JText::_('Parola chiave') ?>:</label> 
        <input type="text" id="chiave" name="keywords" 
               placeholder="-- <?php echo JText::_('parola chiave') ?> --" value="<?php echo $keywords ?>">
        
        <label for="sector_id"><?php echo JText::_('Settore di attività') ?>:</label>
        <select name="filter_sector" id="sector_id" size="1">
            <option value="">-- <?php echo JText::_('settore') ?> --</option>
            <?php foreach ($sectors as $s) : ?>
            <option value="<?php echo $s->sector_id ?>"
                    <?php if ($filter_sector == $s->sector_id ) : ?>selected="selected"<?php endif; ?>
                    ><?php echo JText::_($s->name) ?>
            </option>
            <?php endforeach; ?>
        </select>	
        
        <label for="nomeaz"><?php echo JText::_('nome azienda') ?>:</label>
        <input type="text" id="nomeaz" name="filter_name" 
               placeholder="-- <?php echo JText::_('nome azienda') ?> --" value="<?php echo $filter_name ?>">
        
        <label for="sector_id"><?php echo JText::_('Provincia') ?>:</label>
        <select name="filter_province" id="prov" size="1">
            <option value="">-- <?php echo JText::_('provincia') ?> --</option>
            <?php foreach ($prov as $p) : ?>
            <option value="<?php echo $p->province_id ?>"
                    <?php if ($filter_province == $p->province_id ) : ?>selected="selected"<?php endif; ?>
                    ><?php echo $p->name ?>
            </option>
            <?php endforeach; ?>
        </select>

        <input type="hidden" name="option" value="com_ipie">
        <input type="hidden" name="view" value="companies">
        <input type="submit" id="form1_submit" value="<?php echo JText::_('Cerca') ?>">
        <input type="reset" id="form1_reset" value="<?php echo JText::_('Nuova ricerca') ?>"
               onclick="IPIE.resetForm();return false;">
    </div>
</form>

<script type="text/javascript">
    var IPIE = IPIE || {};
    IPIE.resetForm = function() {
        jQuery('#nomeaz').val('');
        jQuery('#chiave').val('');
        jQuery('#sector_id').val(0);
        jQuery('#prov').val(0);
    };
if (!Modernizr.input.placeholder) {
	var ph_chiave = '-- <?php echo JText::_('parola chiave') ?> --';
	var ph_nomeaz = '-- <?php echo JText::_('nome azienda') ?> --';

//	$('form1_submit').setStyle('display','none');
	if ($('chiave').value=='') { $('chiave').value = ph_chiave }
	if ($('nomeaz').value=='') { $('nomeaz').value = ph_nomeaz }

	$$('#form1 input[type=text]')
	.addEvent('focus', function() {
		this.value = '';
	})
	.addEvent('blur', function() {
		if (this.value == '') {
			if (this.id=='chiave') this.value = ph_chiave;
			if (this.id=='nomeaz') this.value = ph_nomeaz;
		}
	});
	$('form1').addEvent('submit', function() {
		if ($('chiave').value==ph_chiave) { $('chiave').value = '' }
		if ($('nomeaz').value==ph_nomeaz) { $('nomeaz').value = '' }
		//$('form1').submit();
	});
}
</script>



