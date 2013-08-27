<?php 
$items = $this->items;
$state = $this->state;
$sector = $this->sector;
//print_r($this->sector);

// title pagina
$doc = JFactory::getDocument();
$doc->setTitle(JText::sprintf('Aziende del settore %s', $sector['name']));
// Briciole di pane
$pathway = JFactory::getApplication()->getPathway();
$pathway->addItem(JText::sprintf('Settore %s', $sector['name']));
?>

<h3 class="blocco"><?php echo $this->sector['name']?></h3>

 <ul class="actions">
     <li class="print-icon">
         <a href="/it/come-aderire.html?tmpl=component&amp;print=1&amp;page=" title="Stampa" onclick="window.open(this.href,'win2','status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=640,height=480,directories=no,location=no'); return false;" rel="nofollow"><img src="/media/system/images/printButton.png" alt="Stampa"  /></a>
     </li>
     <li class="email-icon">
         <a href="/it/component/mailto/?tmpl=component&amp;template=ipie&amp;link=7f2c6d2c4392c08b1ef1f16821e024d579843e4d" title="Email" onclick="window.open(this.href,'win2','width=400,height=350,menubar=yes,resizable=yes'); return false;"><img src="/media/system/images/emailButton.png" alt="Email"  /></a>
     </li>
 </ul>
 
<?php if (count($items)) : ?>
<p class="spazia blocco">
    <?php echo JText::sprintf('%s aziende trovate', sprintf('<strong>%d</strong>', $this->total)); ?>
</p>
<?php foreach ($items as $item) : 
    $slug = JFilterOutput::stringURLUnicodeSlug($item->name);
    $link = JRoute::_('index.php?option=com_ipie&view=company&id='.$item->company_id.':'.$slug);
    //print_r($item);
?>
<ul class="arancio">
    <li>
        <a href="<?php echo $link ?>" title="Vedi dettaglio">
            <?php echo $item->name ?>
        </a>
    </li>
</ul>
<?php endforeach; ?>
<?php else : ?>
<p class="spazia blocco"><?php echo JText::_('Non ci sono aziende per questo settore..' ) ?></p>
<?php endif; ?>

<form action="<?php echo JRoute::_('index.php?option=com_ipie&view=companies&layout=sector&filter_sector='.$this->sector['sector_id']); ?>" 
      method="get" name="adminForm" id="adminForm">
    <?php echo $this->pagination->getListFooter(); ?>
    <div>
        <input type="hidden" name="task" value="" />
        <?php echo JHtml::_('form.token'); ?>
    </div>
</form>