<?php 
$items = $this->items;
$state = $this->state;
?>

<h1><?php echo JText::_('Companies') ?></h1>
<?php if (count($items)) : ?>
<pre>
    <?php foreach ($items as $item) : 
        $link = JRoute::_('index.php?option=com_ipie&view=company&id='.$item->company_id);
        print_r($item);
    ?>
        <a href="<?php echo $link ?>">Scheda</a>
    <?php endforeach; ?>
</pre>
<?php else : ?>
    <p><?php echo JText::_('No companies..' ) ?></p>
<?php endif; ?>
