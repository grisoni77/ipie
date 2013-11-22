<?php
JHtml::_('behavior.modal');

$item = $this->item;

// link print
$print = IPieHelperRoute::companyLink($item->company_id, $item->name, array(
            'format' => 'pdf',
            //'tmpl' => 'component',
            //'print' => 1,
        ));
// link email
require_once JPATH_SITE . '/components/com_mailto/helpers/mailto.php';
$link = JURI::root() . JRoute::_(IPieHelperRoute::companyLink($item->company_id, $item->name), false);
$email = 'index.php?option=com_mailto&tmpl=component&link=' . MailToHelper::addLink($link);

// title pagina
$doc = JFactory::getDocument();
$doc->setTitle(JText::sprintf('Scheda Azienda %s', $item->name));
// Briciole di pane
$pathway = JFactory::getApplication()->getPathway();
$pathway->addItem(JText::sprintf('Scheda %s', $item->name));
?>

<!-- INIZIO CODICE TEMPLATE -->

<h2><?php echo $item->name ?></h2>

<?php if (0 == JRequest::getInt('print')) : ?>
    <ul class="actions">
        <li class="print-icon">
            <a href="<?php echo $print; ?>" title="Pdf" rel="nofollow" class="blank"><img src="/media/system/images/pdf_button.png" alt="Pdf"  /></a>
        </li>
        <li class="email-icon">
            <a href="<?php echo JRoute::_($email) ?>" title="Email" onclick="window.open(this.href, 'win2', 'width=400,height=350,menubar=yes,resizable=yes');
                    return false;"><img src="/media/system/images/emailButton.png" alt="Email"  /></a>
        </li>
    </ul>
<?php endif; ?>

<div class="scheda">

    <div class="blocco">
        <?php if (count($this->sectors)) : ?>
        <p>
            <strong><?php echo JText::_('Settore di interesse')?>:</strong> 
            <?php echo implode(', ', $this->sectors) ?>
        </p>
        <?php endif; ?>
        <p class="spazia">
            <strong><?php echo JText::_('Dati di sintesi')?>:</strong>
            <?php if (!empty($item->logo)) : ?>
            <img src="<?php echo JUri::root().'images/ipie/logo/'.$item->logo ?>" alt="Logo <?php echo $item->name ?>" class="logo" />
            <?php endif; ?>
            <br />
            
            <?php echo $item->address ?> - <?php echo $item->cap ?> <?php echo $item->city ?> (<?php echo strtoupper($item->province_code) ?>)                        
            <a href="index.php?option=com_ipie&view=company&layout=map&tmpl=component&id=<?php echo $item->company_id ?>" 
                                                                        class="modal" title="<?php echo JText::_('Apri mappa in modale'); ?>"
                                                                        rel="{handler: 'iframe', size: {x: 800, y: 500}}" >
                <img class="mappa" src="/images/google.gif" alt="<?php echo JText::_('Apri mappa in modale'); ?>" width="26" height="27" />
            </a>
            <br />
            <?php if (!empty($item->tel)) : ?>
            <?php JText::printf('tel.: %s', $item->tel) ?><br />
            <?php endif; ?>
            <?php if (!empty($item->fax)) : ?>
            <?php JText::printf('fax.: %s', $item->fax) ?><br />
            <?php endif; ?>
            <?php if (!empty($item->email)) : ?>
            <?php echo JText::_('e-mail.:') ?>
            <?php echo JHtml::_('email.cloak', $item->email) ?>
            <br />
            <?php endif; ?>
            <?php if (!empty($item->web)) : ?>
            <?php echo JText::_('web:') ?>
            <a href="<?php echo $item->web ?>" class="blank" title="<?php echo JText::_('Sito esterno') ?>">
                <?php echo $item->web ?>
            </a>
            <br />
            <?php endif; ?>
        </p>
        <p class="spazia">
            <strong><?php echo JText::_('Anno di fondazione') ?>:</strong> <?php echo $item->year_foundation ?><br />
            <strong><?php echo JText::_('Numero di addetti') ?>:</strong> <?php echo $item->employees ?>                    
        </p>
    </div>

    <div class="blocco">
                
        <ul class="bollini">
            <li>
                <img src="/images/bollino_ipie.gif" alt="<?php echo JText::_('Bollino iPie') ?>" />
            </li>
        </ul>
        
        <?php if (count($item->factors)>0) : ?>
        <p><strong><?php echo JText::_("Fattori per cui") ?>:</strong></p>

        <ul>
            <?php foreach ($item->factors as $f) : ?>
            <li><?php echo JText::_($f->description) ?></li>
            <?php endforeach; ?>
        </ul>
        <?php endif; ?>
    </div>

    <?php if (!empty($this->area_eccellenza)) : ?>
    <div class="blocco">
        <p>
            <strong><?php echo JText::_('Area di eccellenza') ?></strong><br />
            <?php echo $this->area_eccellenza ?>
        </p>

    </div>
    <?php endif; ?>
    
    <?php if (!empty($this->collaborazioni)) : ?>
    <div class="blocco">
        <p><strong><?php echo JText::_('Collaborazioni ricercate') ?></strong><br />
            <?php echo $this->collaborazioni ?>
        </p>
    </div>
    <?php endif; ?>


    <?php if (count($item->related)>0) : ?>
    <p><?php echo JText::_("Nella Community Imprese Innovative Piemonte ti potrebbero interessare anche") ?>:</p>
    <ul class="arancio">
        <?php foreach ($item->related as $r) : 
            $link = JRoute::_(IPieHelperRoute::companyLink($r->company_id, $r->name));
        ?>
        <li><a href="<?php echo $link ?>"><?php echo $r->name ?></a></li>
        <?php endforeach; ?>
    </ul>      
    <?php endif; ?>
</div>   
<!-- FINE CODICE TEMPLATE --> 
<?php
//print_r($this->item);
?>