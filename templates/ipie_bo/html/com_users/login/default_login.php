<?php
/**
 * @package		Joomla.Site
 * @subpackage	com_users
 * @copyright	Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 * @since		1.5
 */
defined('_JEXEC') or die;
JHtml::_('behavior.keepalive');

$app = JFactory::getApplication();
$msg = $app->getMessageQueue();
?>
    <h2>Login aziende</h2>


    <form action="<?php echo JRoute::_('index.php?option=com_users&task=user.login'); ?>" method="post">
        <table class="maschera">
            <colgroup style="width: 20%;"></colgroup>
            <colgroup style="width: 75%;"></colgroup>

            <tr>
                <th><label for="username">Nome utente</label></th>
                <td><input name="username" type="text" id="username" size="60" 
                           placeholder="<?php echo JText::_('insert username') ?>" />
                </td>
            </tr>
            <tr>
                <th><label for="password">Password</label></th>
                <td><input name="password" type="password" id="password" size="60"  
                           placeholder="<?php echo JText::_('insert password') ?>" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="destra">
                    <input type="reset" class="button" name="cancella" id="cancella" value="<?php echo JText::_('reset') ?>" />   
                    <input type="submit" class="button" name="invia" id="invia" value="<?php echo JText::_('send') ?>" /></td>
            </tr>
        </table>
        
        <?php if (count($msg)) : ?>
        <p class="ko">
            <?php foreach ($msg as $m) : ?>
            <?php echo $m['message'] ?><br/>
            <?php endforeach; ?>
        </p>
        <?php endif; ?>
        <p style="text-align:center">
            <a href="<?php echo JRoute::_('index.php?option=com_users&view=reset'); ?>">
                <?php echo JText::_('COM_USERS_LOGIN_RESET'); ?></a>
            | 
            <a href="<?php echo JRoute::_('index.php?option=com_users&view=remind'); ?>">
                <?php echo JText::_('COM_USERS_LOGIN_REMIND'); ?></a>
        </p>

        <?php 
        require JPATH_SITE.'/components/com_ipie/helpers/route.php';
        ?>
        <input type="hidden" name="__return" value="<?php echo base64_encode(JRoute::_('index.php?option=com_ipie&view=draft')); ?>" />
        <input type="hidden" name="return" value="<?php echo base64_encode(IPieHelperRoute::draftLink()); ?>" />
        <?php echo JHtml::_('form.token'); ?>
    </form>
