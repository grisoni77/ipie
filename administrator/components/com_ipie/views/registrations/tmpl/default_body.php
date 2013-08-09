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
                        <?php echo $item->name; ?>
                    </a>
                </td>
                <td>
                        <?php printf('%s (%s)', $item->city, $item->province); ?>
                </td>
                <td>
                        <?php echo $item->username; ?>
                </td>
                <td>
                        <?php echo $item->email; ?>
                </td>
        </tr>
<?php endforeach; ?>