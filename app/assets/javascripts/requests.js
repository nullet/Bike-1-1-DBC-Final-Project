// var dispatcher = new WebSocketRails(window.location.host + '/websocket');
// var channel = dispatcher.subscribe('request');

// channel.bind('new_request', function(message) {
//       // console.log("wheeEe", message);
//       var event = JSON.parse( message );
//       console.log(event.location);
//       // createMarker(event.location, event.request_text);
// });

// // dispatcher.on_open = function(data) {
// //   console.log('Connection has been established: ', data);
// //   // You can trigger new server events inside this callback if you wish.
// // }

// function submitToSocket(data) {
//     dispatcher.trigger('create', data);
// }

// submitToSocket("hi");
// function deleteToSocket(id) {
//     dispatcher.trigger('requests.destroy', id)
// }

// var dispatcher = new WebSocketRails('localhost:3000/websocket');

// // subscribe to the channel
// var channel = dispatcher.subscribe('channel_name');

// // bind to a channel event
// channel.bind('event_name', function(data) {
//   console.log('channel event received: ' + data);
// });