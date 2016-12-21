$(document).ready(function (){
    var myLatLng = new google.maps.LatLng(latitude, longitude);

    function initialize() {
        var mapOptions = {
            center: myLatLng,
            zoom: 13,
            scrollwheel: false
        };

        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);    
        
        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          animation: google.maps.Animation.DROP
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);
});