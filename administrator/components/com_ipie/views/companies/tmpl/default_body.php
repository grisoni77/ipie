<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted Access');

$entity_name = IPieHelper::getSingular($this->getName());
$entities_name = $this->getName();

?>
<?php foreach($this->items as $i => $item): 
        $link = 'index.php?option='.CNL.'&task='.$entity_name.'.edit&id='.$item->id;
        $scheda_link = 'index.php?option='.CNL.'&task=draft.edit&id='.$item->draft_id;
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
                        <?php echo $item->city; ?>
                </td>
                <td>
                        <?php echo $item->province; ?>
                </td>
                <td>
                        <?php echo $item->address; ?>
                </td>
                <td>
                    <?php if ($item->draft_state == 'pending') : ?>
                    <a href="<?php echo $scheda_link; ?>">
                    	<img src="templates/bluestork/images/admin/icon-16-notice-note.png" title="In attesa di approvazione" />
                        <img src="templates/bluestork/images/menu/icon-16-edit.png" title="Modifica/approva scheda" />
                    </a>
                    <?php else : ?>
                    non ci sono richieste di modifica
                    <?php endif; ?>
                </td>
                <td>
                        <?php echo JHtml::_('grid.published', $item->published, $i, 'tick.png', 'publish_x.png', $entities_name.'.'); ?>
                </td>
        </tr>
<?php endforeach; ?>