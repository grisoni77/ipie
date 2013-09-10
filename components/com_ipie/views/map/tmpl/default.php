<?php
$doc = JFactory::getDocument();
$doc->addScript('http://maps.google.com/maps/api/js?sensor=false');
$doc->addScript(JURI::root().'components/com_ipie/assets/js/map.js');

?>

<div id="map_canvas"></div>