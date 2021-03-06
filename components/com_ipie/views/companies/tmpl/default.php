<?php 
$items = $this->items;
$state = $this->state;

// title pagina
$doc = JFactory::getDocument();
$doc->setTitle(JText::_('Risultati Cerca Azienda'));
// Briciole di pane
$pathway = JFactory::getApplication()->getPathway();
$pathway->addItem(JText::_('Risultati ricerca'));

$print_link = JFactory::getURI();
$print_link->setVar('tmpl', 'component');
$print_link->setVar('print', 1);

$email_link = JFactory::getURI();
require_once JPATH_SITE . '/components/com_mailto/helpers/mailto.php';
$email_link = JUri::root().'index.php?option=com_mailto&tmpl=component&link=' . MailToHelper::addLink($email_link->toString());
?>

<h2><?php echo JText::_('Risultati Cerca Azienda')?></h2>

<ul class="actions">
    <li class="print-icon">
        <a href="<?php echo $print_link ?>" title="Stampa" onclick="window.open(this.href,'win2','status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=640,height=480,directories=no,location=no'); return false;" rel="nofollow"><img src="/media/system/images/printButton.png" alt="Stampa"  /></a>
    </li>
    <li class="email-icon">
        <a href="<?php echo $email_link ?>" title="Email" onclick="window.open(this.href,'win2','width=400,height=350,menubar=yes,resizable=yes'); return false;"><img src="/media/system/images/emailButton.png" alt="Email"  /></a>
    </li>
</ul>
 

<?php if (count($items)) : ?>
<p class="spazia blocco">
    <?php echo JText::sprintf('%s aziende trovate', sprintf('<strong>%d</strong>', $this->total)); ?>
</p>
<?php foreach ($items as $item) : 
    $slug = JFilterOutput::stringURLUnicodeSlug($item->name);
    $link = IPieHelperRoute::companyLink($item->company_id, $slug);
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