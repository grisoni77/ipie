<?php if (count($list)) : ?>
<ul>
    <?php foreach ($list as $s) : 
            $slug = JFilterOutput::stringURLUnicodeSlug(JText::_($s->name));
            $link = IPieHelperRoute::sectorLink($s->sector_id, $slug);
            //$link = JRoute::_('index.php?option=com_ipie&view=sector&filter_sector='.$s->sector_id.':'.$slug);
    ?>
    <li id="s<?php echo $s->sector_id ?>"
        <?php if ($filter_sector == $s->sector_id ) : ?>class="active"<?php endif; ?>
        >
        <a href="<?php echo JRoute::_($link) ?>" title="" />
            <span><?php echo JText::_($s->name) ?></span>
        </a>
    </li>
    <?php endforeach; ?>
</ul>
<?php else : ?>
<p><?php echo JText::_('No sectors..') ?></p>
<?php endif; ?>