/**
 * http://usejsdoc.org/
 */
var tripReviewMain = function(){
	$.ajax({
		url : "TripReviewView",
		method : "post",
		data : {
			"start" : arguments[0]? arguments[0] : 1,
			"end" : arguments[1]? arguments[1] : 8
		},
		dataType : "html",
		success : function(document){
			$("#contents").append($(document)[5]);
		}
	});
};
tripReviewMain();

