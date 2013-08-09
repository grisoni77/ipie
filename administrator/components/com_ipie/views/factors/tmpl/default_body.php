<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted Access');

$entity_name = IPieHelper::getSingular($this->getName());
$entities_name = $this->getName();

?>
<?php foreach($this->items as $i => $item): 
        $link = 'index.php?option='.CNL.'&task='.$entity_name.'.edit&id='.$item->id;
    ?>
        <tr class="row<?php echo $i % 2; ?>">
                <td>
                        <?php echo $item->id; ?>
                </td>
                <td>
                        <?php echo JHtml::_('grid.id', $i, $item->id); ?>
                </td>
                <td>
                    <a href="<?php echo $link ?>">
                        <?php echo $item->description; ?>
                    </a>
                </td>
                <td>
                        <?php echo JHtml::_('grid.published', $item->published, $i, 'tick.png', 'publish_x.png', $entities_name.'.'); ?>
                </td>
        </tr>
<?php endforeach; ?>