<?php
/**
 * @package		Joomla.Site
 * @copyright	Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$col_left = false;
$col_right = false;
$cols = 1;
if ($this->countModules('right')
	&& JRequest::getCmd('layout') != 'form'
	&& JRequest::getCmd('task') != 'edit') {
	$cols += 1;
	$col_right = true;
}
if ($this->countModules('left')) {
	$cols += 1;
	$col_left = true;
}
//corregge se c'? solo col destra (la classe del main in quel caso ? main-4)
$cols += (($col_right && !$col_left) ? 2 : 0);

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
		<!-- The following JDOC Head tag loads all the header and meta information from your site config and content. -->
		<jdoc:include type="head" />

<!-- The following line loads the template CSS file located in the template folder. -->
		<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/print.css" type="text/css" media="print" />
<!--[if lte IE 7]>
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template_ie.css" type="text/css" media="screen" />
<![endif]-->
		<!-- The following four lines load the Blueprint CSS Framework and the template CSS file for right-to-left languages. If you don't want to use these, delete these lines. -->
		<?php if($this->direction == 'rtl') : ?>
			<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template_rtl.css" type="text/css" />
		<?php endif; ?>

	
      	<!-- The following line loads the template JavaScript file located in the template folder. It's blank by default. -->
		<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/template.js"></script>
        
        <script type="text/javascript">
//<![CDATA[
window.onload=function() {
if(!document.getElementsByTagName) return;
l=document.getElementsByTagName("a");
for(i=0;i<l.length;i++)
{
if(l[i].className.indexOf("blank")!=-1)
{
l[i].onclick=function(){window.open(this.href);return(false)};
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
  <div id="top">
	    <div id="strumenti">
    						<jdoc:include type="modules" name="strumenti" style="nea" />
        </div><!-- fine strumenti -->
	  <br class="clr" />
<hr />   
<div id="ja-mainnav">
<jdoc:include type="modules" name="topmenu" style="none" />
</div>
 <div id="banner_ani"><span><strong>Target Innovazione</strong></span></div>
 
<hr />   
 </div><!-- fine top -->
  </div><!-- fine testata -->              
 <div class="clr"></div>
     <?php if ($this->countModules('left')) { ?>
            <div id="sidebar-left">     	 
                <div class="moduletable_aziende">
							<h2><span>Aziende per settore</span></h2>
						<ul>
    <li id="s1">
        <a href="#" title="Tessile">
            <span>Tessile</span>
        </a>
    </li>
    <li id="s2">
        <a href="#" title="Agroalimentare">
            <span>Agroalimentare</span>
        </a>
    </li>
    <li id="s3">
        <a href="#" title="Ambiente-Energia">
            <span>Ambiente-Energia</span>
        </a>
    </li>
    <li id="s4">
        <a href="#" title="Automotive">
            <span>Automotive</span>
        </a>
    </li>
    <li id="s5">
        <a href="#" title="Scienze della vita">
            <span>Scienze della vita</span>
        </a>
    </li>
    <li id="s6">
        <a href="#" title="ICT">
            <span>ICT</span>
        </a>
    </li>
    <li id="s7">
        <a href="#" title="Trasporti">
            <span>Trasporti</span>
        </a>
    </li>
    <li id="s8">
        <a href="#" title="Materiali">
            <span>Materiali</span>
        </a>
    </li>
    <li id="s9">
        <a href="#" title="Design">
            <span>Design</span>
        </a>
    </li>
    <li id="s10">
        <a href="#" title="Ecocostruzioni">
            <span>Ecocostruzioni</span>
        </a>
    </li>
    <li id="s11">
        <a href="#" title="Media/audiovisivi">
            <span>Media/audiovisivi</span>
        </a>
    </li>
    <li id="s12">
        <a href="#" title="Meccatronica">
            <span>Meccatronica</span>
        </a>
    </li>
</ul>		</div>
 <jdoc:include type="modules" name="left" style="nea" headerLevel="2" />
        <hr /> </div><!-- end sidebar_left -->
        <?php } ?>
      <?php if ($this->countModules('right')) { ?>
        <div id="sidebar-right">
                     <jdoc:include type="modules" name="right" />
          <hr /> </div><!-- end sidebar_right -->      
        <?php } ?>
        
        <div id="main-<?php print $cols ;?>">
 <div id="body_outer">
  <?php if ($this->countModules('ricerca')) { ?>
 <div id="ricerca">
         <jdoc:include type="modules" name="ricerca" style="nea" />
  </div>
<hr /> 
    <?php } ?>
       <div id="ricerca">
         		<div class="moduletable">
							<h2><span>Cerca azienda</span></h2>
						

<form action="/it/risultati-cerca-azienda.html?sort=firm_name" method="get" class="-koowa-grid" id="form1" data-token-name="_token" data-token-value="68b0ec0f85fb69243a3e0407a6ced2ac">
<input type="hidden" name="sort" value="firm_name" />
    <div id="form_az">
	<label for="chiave">Parola chiave:</label> 
	<input type="text" id="chiave" name="keywords" value="-- parola chiave --" />
    	<label for="sector_id">Settore di attivit�:</label>
    	<select name="sector_id" id="sector_id" size="1">
<option value="0"  >-- settore --</option>
<option value="2"  >Agroalimentare</option>
<option value="3"  >Ambiente-Energia</option>
<option value="4"  >Automotive</option>
<option value="9"  >Design</option>
<option value="10"  >Ecocostruzioni</option>
<option value="6"  >ICT</option>
<option value="8"  >Materiali</option>
<option value="12"  >Meccatronica</option>
<option value="11"  >Media/Audiovisivi</option>
<option value="5"  >Scienze della vita</option>
<option value="1"  >Tessile</option>
<option value="7"  >Trasporti</option>
</select>	<label for="nomeaz">nome azienda:</label>
	<input type="text" id="nomeaz" name="search" value="-- nome azienda --" />
    <label for="sector_id">Provincia:</label>
<select name="prov" id="prov" size="1">
<option value="0"  >-- provincia --</option>
<option value="1"  >Alessandria</option>
<option value="2"  >Asti</option>
<option value="3"  >Biella</option>
<option value="4"  >Cuneo</option>
<option value="5"  >Novara</option>
<option value="6"  >Verbania</option>
<option value="7"  >Vercelli</option>
</select>
        
<input type="submit" id="form1_submit" value="Cerca" />
<input type="reset" id="form1_reset" value="Nuova ricerca" />
    </div>
</form>
		</div>
</div>	

<hr /> 
 <?php if ($this->countModules('breadcrumb')) { ?>
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
