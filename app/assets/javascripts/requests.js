
var dispatcher = new WebSocketRails( window.location.host + '/websocket' );
  
$(document).ready(function(){

  $("#location").on("click", geoFindMe);

});

function geoFindMe() {
  var latLong = $("#location");
  var request = $('#request').val();
 
  if (!navigator.geolocation){
    latLong.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    var data = { request_text: request, latitude: latitude, longitude: longitude};
    // console.log(data);
    submitToSocket(data);
  };

  function error() {
    latLong.innerHTML = "Unable to retrieve your location";
  };

  function submitToSocket(data) {
  dispatcher.trigger('create', data);
  };
  navigator.geolocation.getCurrentPosition(success, error);
}