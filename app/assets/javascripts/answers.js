// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  if ($("#activity").length > 0) {
  	hideButtons();
    setTimeout(updateComments, 1000);
  }
});

function updateComments () {
	var answer_id = $("#activity").attr("data-id");
	//var
	$.getScript("/answers/" + answer_id + ".js")
	setTimeout(updateComments, 10000)
}

function hideButtons(){
	if (document.getElementById("timer_btn")){
		var answer_active = $('#timer_btn').attr("data-id");
		console.log(answer_active);
		if (answer_active === "true") {
			console.log("answer_active === true");
			document.getElementById("start_timer").style.display = 'none';
			document.getElementById("end_timer").style.display = 'block';
			document.getElementById("terminator").style.display = 'none';
		} else {
			document.getElementById("start_timer").style.display = 'block';
			document.getElementById("end_timer").style.display = 'none';
		}	
	}
}


function startCount(){
	var start = new Date();
	console.log("Inside startCount");

	var refreshId = setInterval(function(){
		console.log($('#timer_btn').attr('data-id'));
		$('.Timer').text(Math.round((new Date() - start) / 1000));
	}, 1000);

	return refreshId
}