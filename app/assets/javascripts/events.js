$('#container #map-canvas #agree-to-help').click(function(event) {
	debugger
	event.preventDefault();

	var url = $(this).attr('href');

	$.ajax({
		url: url,
      type: 'PUT',
      success: function (response) {
        $('#event-detail').html("<h1>Thanks</h1>");
      }
	});
});
