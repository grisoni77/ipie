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
             jQuery.each(data, function(idx, item) {
                //codeAddress(item);
                //console.log(item);
                codeAddress(item);
             });
             var bounds = map.getBounds();
             jQuery.each(markers, function(m, idx) {
                bounds.extend(m.getPosition());
             });
             map.fitBounds(bounds);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(errorThrown);
        }
    }
    );


}

var markers = [];

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