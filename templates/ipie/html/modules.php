<?php
defined('_JEXEC') or die('Restricted access');

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
 * three arguments.
 */


/**
 * Custom module chrome, echos the whole module in a <div> and the header in <h{x}>. The level of
 * the header can be configured through a 'headerLevel' attribute of the <jdoc:include /> tag.
 * Defaults to <h3> if none given
 */
function modChrome_nea($module, &$params, &$attribs)
{
	$headerLevel = isset($attribs['headerLevel']) ? (int) $attribs['headerLevel'] : 2;
	if (!empty ($module->content)) : ?>
		<div class="moduletable<?php echo $params->get('moduleclass_sfx'); ?>">
			<?php if ($module->showtitle) : ?>
				<h<?php echo $headerLevel; ?>><span><?php echo $module->title; ?></span></h<?php echo $headerLevel; ?>>
			<?php endif; ?>
			<?php echo $module->content; ?>
		</div>
	<?php endif;
}

/*
 * Module chrome for rendering the module in a slider
 */
function modChrome_slider($module, &$params, &$attribs)
{
	jimport('joomla.html.pane');
	// Initialize variables
	$sliders = & JPane::getInstance('sliders');
	$sliders->startPanel( JText::_( $module->title ), 'module' . $module->id );
	echo $module->content;
	$sliders->endPanel();
}
/*
 * Module chrome that allows for rounded corners by wrapping in nested div tags
 */
function modChrome_jarounded($module, &$params, &$attribs)
{ ?>
		<div class="jamod module<?php echo $params->get('moduleclass_sfx'); ?>" id="Mod<?php echo $module->id; ?>">
			<div>
				<div>
					<div>
						<?php if ($module->showtitle != 0) : ?>
						<?php
						if(isset($_COOKIE['Mod'.$module->id])) $modhide = $_COOKIE['Mod'.$module->id];
						else $modhide = 'show';
						?>
						<h3 class="<?php echo $modhide; ?>"><span><?php echo $module->title; ?></span></h3>
						<?php endif; ?>
						<div class="jamod-content"><?php echo $module->content; ?></div>
					</div>
				</div>
			</div>
		</div>
	<?php
}
?>