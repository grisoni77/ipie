<?php
$doc = JFactory::getDocument();
$doc->addScript('http://maps.google.com/maps/api/js?sensor=false');
$doc->addScript(JURI::root().'components/com_ipie/assets/js/map.js');

JText::script('SITO WEB');
JText::script('Le imprese innovative della Provincia di Torino sono visibili sul portale');
?>

<div id="map_canvas"></div>
