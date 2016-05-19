//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  if ($("#central_hub").length > 0) {
    var x = $("#answer_tbl").length; //console.log($("#answer_tbl").length);
    console.log(x);
    console.log("I am in the function on home.js");
    setTimeout(updateModal, 10000);
  } 
});


function updateModal() {
	//console.log("Ajax is working from home.js")

	var user_id = $("#answer_tbl").attr("data-id");
	console.log("The user who created these answers has id#: " + user_id);
	$.getScript("/alert_user.js")
	setTimeout(updateModal, 10000);
}