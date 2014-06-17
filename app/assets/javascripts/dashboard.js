var ready;
ready = function() {

  if ($('#map').length >= 1) {
    google.maps.event.addDomListener(window, 'load', initialize);
  } // end if $('#map')

  function initialize() {
    console.log("initialize");
    var map, infowindow, userLatLng;

    $.ajax({
      url: '/current_user_lat_long',
      type: 'get',
      dataType: 'json',
      success: function(response) {
        // global variable, don't be mad
        userLatLng = new google.maps.LatLng(response.latitude, response.longitude);
      }
    }); // end ajax 

    map = new google.maps.Map(document.getElementById( "map-canvas"), {
      center: userLatLng,
      zoom: 16
    });


      // Creates Place (Bike Shop) Markers:
    function callback(results, status) {
      console.log("i'm a callback");
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
          var open,
              place = results[i]
          if (place.opening_hours && place.opening_hours.open_now){open = "Currently Open"}
          else {open = "Currently Closed"}

          var content = '<div class="bike_shop">' +
        '<h3 id="firstHeading">' + place.name + '</h3>'+
        '<div id="bodyContent">'+ '<p>' + open + '</p>' + '<p>Rating: ' + place.rating + '</p>' + '</p>' + '<p>Phone: ' + place.formatted_phone_number + '</p>' + '<p>Address: ' + place.formatted_address + '</p>' +'</div>'

          createMarker(place.geometry.location, content);
        }
      }
    }

    
    // Creates Marker Text for Current User Pin
    // createMarker(userLatLng, "<h3>You are here</h3>");

    // Adds Bike Routes to Map -- DON'T DELETE
    var bikeLayer = new google.maps.BicyclingLayer();
    bikeLayer.setMap(map);

    $.ajax({
      url: '/events',
      type: 'get',
      dataType: 'json',
      success: function(response) {
        console.log("ajax");
        infowindow = new google.maps.InfoWindow();

        var request = {
          location: userLatLng,
          radius: 5000,
          keyword: "bike shops"
        }

        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
      
        service.nearbySearch(request, callback);


        for (var i = 0; i < response.length; i++) {
          console.log(i);
          var request = response[i].request;
          var requester = response[i].requester;
          var location = new google.maps.LatLng(request.latitude, request.longitude);
          // debugger
          if (request.latitude && request.longitude) {
            createMarker(request.latitude, request.longitude, "hello");
          }
        }
      } // end success
    }); // end ajax

    // Creates Markers for Events (Help Requests):
    function createMarker(location, content) {
      console.log(location);
      // var placeLoc = place.geometry.location;
      var marker = new google.maps.Marker({
        map: map,
        position: location
        // icon: image
        // position: place.geometry.location
      });


      google.maps.event.addListener(marker, 'click', function() {
        console.log("click listenere for marker");
        infowindow.setContent(content);
        infowindow.open(map, this);
         $("#event-detail").html(content);
      });

    } // end function createMarker


  } // end initialize
};

$(document).ready(ready);
$(document).on('page:load', ready);