<?php if (count($list)) : ?>
<ul>
    <?php foreach ($list as $s) : 
            $link = JRoute::_('index.php?option=com_ipie&view=companies&filter_sector='.$s->sector_id);
    ?>
    <li id="s<?php echo $s->sector_id ?>">
        <a href="<?php echo $link ?>" title="" />
            <span><?php echo $s->name ?></span>
        </a>
    </li>
    <?php endforeach; ?>
</ul>
<?php else : ?>
<p><?php echo JText::_('No sectors..') ?></p>
<?php endif; ?>