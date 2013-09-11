<?php
/**
 * @package		Joomla.Site
 * @copyright	Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

$url = clone(JURI::getInstance());


/* The following line loads the MooTools JavaScript Library */
JHtml::_('behavior.framework', true);

/* The following line gets the application object for things like displaying the site name */
$app = JFactory::getApplication();
?>
<?php echo '<?'; ?>xml version="1.0" encoding="<?php echo $this->_charset ?>"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" >
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">jQuery.noConflict()</script>
        <!-- The following JDOC Head tag loads all the header and meta information from your site config and content. -->
        <jdoc:include type="head" />

        <!-- The following line loads the template CSS file located in the template folder. -->
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/print.css" type="text/css" media="print" />
        <!--[if lte IE 7]>
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template_ie.css" type="text/css" media="screen" />
        <![endif]-->
        <!-- The following four lines load the Blueprint CSS Framework and the template CSS file for right-to-left languages. If you don't want to use these, delete these lines. -->
        <?php if ($this->direction == 'rtl') : ?>
            <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template_rtl.css" type="text/css" />
        <?php endif; ?>


        <script type="text/javascript">
//<![CDATA[
            window.onload = function() {
                if (!document.getElementsByTagName)
                    return;
                l = document.getElementsByTagName("a");
                for (i = 0; i < l.length; i++)
                {
                    if (l[i].className.indexOf("blank") != -1)
                    {
                        l[i].onclick = function() {
                            window.open(this.href);
                            return(false)
                        };
                    }
                }
            }
//]]>
        </script>
    </head>
    <body id="mainbody" oncontextmenu="return false;">
        <div id="wrapper">
            <div id="corpo">
                <div id="testata">
                    <h1><?php echo htmlspecialchars($app->getCfg('sitename')); ?></h1>
                    <div id="logos"><ul><li id="camcom"><a href="http://www.pie.camcom.it//" class="blank" title="Vai al sito di Unioncamere Piemonte [nuova finestra]"><span>Vai al sito di Unioncamere Piemonte</span></a></li>
                            <li id="iito"><a href="/" title="iPie home page"><span>Torna alla home page di Imprese Innovative Piemonte</span></a></li></ul></div>
                </div><!-- fine testata -->              


                <div id="main-<?php print $cols; ?>">
                    <div id="body_outer">
                        <?php if (0 && $this->countModules('breadcrumb')) { ?>
                            <div id="pathway">
                                <jdoc:include type="modules" name="breadcrumb" />
                            </div>
                            <hr /> 
                        <?php } ?>
                        <jdoc:include type="message" />
                        <jdoc:include type="component" />
                        <?php if ($this->countModules('bottom')) { ?>
                            <div id="bottom">
                                <jdoc:include type="modules" name="bottom"  style="none" headerLevel="2" />
                            </div>
                            <div class="clr"></div>
                        <?php } ?>
                    </div> <!-- fine body_outer -->
                </div><!-- fine main -->
                <div id="footer">
                    <?php if ($this->countModules('footer')) { ?>
                        <jdoc:include type="modules" name="footer"  style="nea" headerLevel="2" />
                    <?php } ?><!-- end footer -->
                </div>	
            </div><!-- fine corpo -->
        </div><!-- fine wrapper -->
        <jdoc:include type="modules" name="debug" />
    </body>
</html>
