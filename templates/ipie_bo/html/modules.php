<?php
/**
 * @package		Joomla.Site
 * @copyright	Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die;

/**
 * This is a file to add template specific chrome to module rendering.  To use it you would
 * set the style attribute for the given module(s) include in your template to use the style
 * for each given modChrome function.
 *
 * eg.  To render a module mod_test in the sliders style, you would use the following include:
 * <jdoc:include type="module" name="test" style="slider" />
 *
 * This gives template designers ultimate control over how modules are rendered.
 *
 * NOTICE: All chrome wrapping methods should be named: modChrome_{STYLE} and take the same
 * two arguments.
 *
 * This module chrome file creates custom output for modules used with the Atomic template.
 * The first function wraps modules using the "container" style in a DIV. The second function
 * uses the "bottommodule" style to change the header on the bottom modules to H6. The third
 * function uses the "sidebar" style to change the header on the sidebar to H3.
 */

function modChrome_nea($module, &$params, &$attribs)
{
	$headerLevel = isset($attribs['headerLevel']) ? (int) $attribs['headerLevel'] : 3;
	if (!empty ($module->content)) : ?>
		<div class="moduletable<?php echo $params->get('moduleclass_sfx'); ?>">
			<?php if ($module->showtitle) : ?>
				<h<?php echo $headerLevel; ?>><?php echo $module->title; ?></h<?php echo $headerLevel; ?>>
			<?php endif; ?>
			<?php echo $module->content; ?>
		</div>
	<?php endif;
}

function modChrome_sidebar($module, &$params, &$attribs)
{
	if (!empty ($module->content)) : ?>
		<?php if ($module->showtitle) : ?>
			<h3><span><?php echo $module->title; ?></span></h3>
		<?php endif; ?>
		<?php echo $module->content; ?>
	<?php endif;
}

function modChrome_nea2($module, &$params, &$attribs)
{
	$headerLevel = isset($attribs['headerLevel']) ? (int) $attribs['headerLevel'] : 3;
	if (!empty ($module->content)) : ?>
		<div class="moduletable<?php echo $params->get('moduleclass_sfx'); ?>">
			<?php if ($module->showtitle) : ?>
				<h<?php echo $headerLevel; ?>><span><?php echo $module->title; ?></span></h<?php echo $headerLevel; ?>>
			<?php endif; ?>
			<?php echo $module->content; ?>
		</div>
	<?php endif;
}
?>