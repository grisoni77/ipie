<?php 
$doc = JFactory::getDocument();
$doc->addScript('http://maps.google.com/maps/api/js?sensor=false');


?>

<div id="map_canvas"></div>
<script>
if (typeof(window.addEventListener) !== 'undefined') {
    window.addEventListener("load", initialize, true);
} else if (typeof(window.attachEvent) !== 'undefined') {
    window.attachEvent("onload", initialize);
}

var map;
var geocoder;
function initialize() {

    var myOptions = {
        center: new google.maps.LatLng(45.0781, 7.6761),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    // not used
//		google.maps.event.addListener(map, 'zoom_changed', function() {
//			
//		});

    // init geocoder
    geocoder = new google.maps.Geocoder();
    // aggiungi marker
    //var address = item.firm_address+' Piemonte Italia';        
    //codeAddress(address);

    codeAddress({
        'address':'<?php echo $this->item->address ?>',
        'name':'<?php echo $this->item->name ?>',
        'web':'<?php echo $this->item->web ?>'
    });

}

function codeAddress(item) {
    var address = item.address + ' Piemonte Italia';
    //console.log(address);
    geocoder.geocode({'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);

            // init infowindow
            var contentString = '<div id="info_content">' +
                    '<strong>' + item.name + '</strong>' +
                    '<div id="bodyContent">' +
                    '<p>' + item.address + '</p>' +
                    (item.web != '' ? '<p><a target="_blank" href="' + item.web + '">Sito web</a></p>' : '') +
                    '</div>' +
                    '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            // init marker
            var marker = new google.maps.Marker({
                position: results[0].geometry.location,
                map: map,
                title: item.name
            });
            
            google.maps.event.addListener(marker, 'click', function() {
                //map.setZoom(12);
                infowindow.open(map, marker);
            });

        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}
</script>
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>