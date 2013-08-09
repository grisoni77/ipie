<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted Access');

$listOrder	= $this->escape($this->state->get('list.ordering'));
$listDirn	= $this->escape($this->state->get('list.direction'));

?>
<tr>
        <th width="5">
                <?php echo JText::_('Id'); ?>
        </th>
        <th width="20">
                <input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count($this->items); ?>);" />
        </th>                   
        <th>
                <?php echo JHtml::_('grid.sort', 'Nome', 'c.name', $listDirn, $listOrder); ?>
        </th>
        <th>
                <?php echo JHtml::_('grid.sort', 'Città', 'ci.name', $listDirn, $listOrder); ?>
        </th>
        <th>
                <?php echo JHtml::_('grid.sort', 'Provincia', 'p.name', $listDirn, $listOrder); ?>
        </th>
        <th>
                <?php echo JText::_('Indirizzo'); ?>
        </th>
        <th>
                <?php echo JText::_('Scheda azienda'); ?>
        </th>
        <th>
                <?php echo JHtml::_('grid.sort', 'Published', 'f.published', $listDirn, $listOrder); ?>
        </th>
</tr>
    <div>
        <input type="hidden" name="filter_order" value="<?php echo $listOrder; ?>" />
		<input type="hidden" name="filter_order_Dir" value="<?php echo $listDirn; ?>" />
    </div>
