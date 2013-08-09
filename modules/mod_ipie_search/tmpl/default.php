<?php 
$doc = JFactory::getDocument();
$doc->addScript(JURI::root().'/modules/mod_ipie_search/assets/jquery.placeholder.js');

$action = JRoute::_('index.php?option=com_ipie&view=companies');

?>
<form action="<?php echo $action ?>" method="get" class="-koowa-grid" id="form1">
    <div id="form_az">
        <label for="chiave"><?php echo JText::_('Parola chiave') ?>:</label> 
        <input type="text" id="chiave" name="keywords" 
               placeholder="-- <?php echo JText::_('parola chiave') ?> --" value="">
        
        <label for="sector_id"><?php echo JText::_('Settore di attività') ?>:</label>
        <select name="filter_sector" id="sector_id" size="1">
            <option value="0">-- <?php echo JText::_('settore') ?> --</option>
            <?php foreach ($sectors as $s) : ?>
            <option value="<?php echo $p->sector_id ?>"><?php echo $p->name ?></option>
            <?php endforeach; ?>
        </select>	
        
        <label for="nomeaz"><?php echo JText::_('nome azienda') ?>:</label>
        <input type="text" id="nomeaz" name="search" 
               placeholder="-- <?php echo JText::_('settore') ?> --" value="">
        
        <label for="sector_id"><?php echo JText::_('Provincia') ?>:</label>
        <select name="filter_province" id="prov" size="1">
            <option value="0">-- <?php echo JText::_('provincia') ?> --</option>
            <?php foreach ($prov as $p) : ?>
            <option value="<?php echo $p->province_id ?>"><?php echo $p->name ?></option>
            <?php endforeach; ?>
        </select>

        <input type="submit" id="form1_submit" value="<?php echo JText::_('Cerca') ?>">
        <input type="reset" id="form1_reset" value="<?php echo JText::_('Nuova ricerca') ?>">
    </div>
</form>