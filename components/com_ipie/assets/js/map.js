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


    var xhr = jQuery.ajax({
        url: 'index.php?option=com_ipie&view=companies&format=json&limit=0',
        method: 'get',
        dataType: 'json',
        success: function(data) {
             /*jQuery.each(data, function(idx, item) {
                //codeAddress(item);
                //console.log(item);
                codeAddress(item);
             });
             var bounds = map.getBounds();
             jQuery.each(markers, function(m, idx) {
                bounds.extend(m.getPosition());
             });
             */
             jQuery.each(data, function(idx, item) {
                 addCompanyMarker(item);
             });
             //map.fitBounds(bounds);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(errorThrown);
        }
    }
    );

    // aggiungi circle su torino
    var torino = new google.maps.LatLng(45.070982, 7.685676);
    var circ = new google.maps.Circle({
            center:torino,
            clickable:true,
            fillColor:'#FF0000',
            fillOpacity:0.35, 
            map:map,
            radius:20000,
            strokeColor:'#FF0000',
            strokeWeight:2,
            strokeOpacity:0.5});

    //create info window
    var infoWindow= new google.maps.InfoWindow({
        content: '<p>Le imprese innovative della Provincia di Torino sono visibili sul portale \
        <a href="http://www.innovativetorino.it" target="_blank">iTo</a></p>'
    });

    //add a click event to the circle
    google.maps.event.addListener(circ, 'click', function(ev){
        //call  the infoWindow
        infoWindow.setPosition(circ.getCenter());
        infoWindow.open(map);
    }); 
}

var markers = [];

function addCompanyMarker(item) {
    // init infowindow
    var contentString = '<div id="info_content">' +
            '<strong>' + item.name + '</strong>' +
            '<div id="bodyContent">' +
            '<p>' + item.address + '</p>' +
            '<p><a href="' + item.web + '">'+Joomla.JText._('SITO WEB')+'</a></p>' +
            '</div>' +
            '</div>';

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });

    // init marker
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(item.lat, item.lng),
        map: map,
        title: item.name
    });

    markers.push(marker);

    google.maps.event.addListener(marker, 'click', function() {
        //map.setZoom(12);
        infowindow.open(map, marker);
    });
    
}

function codeAddress(item) {
    var address = item.address + ' Piemonte Italia';
    //console.log(address);
    geocoder.geocode({'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            //map.setCenter(results[0].geometry.location);

            // init infowindow
            var contentString = '<div id="info_content">' +
                    '<strong>' + item.name + '</strong>' +
                    '<div id="bodyContent">' +
                    '<p>' + item.address + '</p>' +
                    '<p><a href="' + item.web + '">Sito web</a></p>' +
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

            markers.push(marker);

            google.maps.event.addListener(marker, 'click', function() {
                //map.setZoom(12);
                infowindow.open(map, marker);
            });

        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}