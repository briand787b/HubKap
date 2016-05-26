//Code on this page is to make Ajax poll the server from the questions/show page for new answers

$(document).ready(function(){
	if (document.contains(document.getElementById("pending-answer-table"))) {
		console.log("pending-answer-table exists"); //for debugging ajax
		setTimeout(updateComments, 10000);
	}
});

function updateComments() {
	console.log("updateComments is working, ajax is on its way"); //for ajax debugging
	var question_id = $("#show-question-header").attr("data-id");
	console.log("Question has id#" + question_id); //for ajax debugging
	
	$.getScript("/questions/" + question_id + ".js");
	setTimeout(updateComments, 10000);
}