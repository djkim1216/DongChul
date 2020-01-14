/**
 * http://usejsdoc.org/
 */
var start = 1;
var end = 8;
var pageEndChk = true;

var tripReviewView = function() {
	if(pageEndChk){
		$.ajax({
			url : "TripReviewView",
			method : "post",
			data : {
				"start" : arguments[0] ? arguments[0] : 1,
				"end" : arguments[1] ? arguments[1] : 8
			},
			dataType : "html",
			success : function(document) {
				if (document != "null") {
					$("#article_contents").append($(document)[5]);
					if($('.list_view:nth-last-child(1)>div:nth-child(2)').length == 0){
						$('.list_view:nth-last-child(1)').css("height","312.5px");
						$('.list_view:nth-last-child(1)>div:nth-child(1)').css("height","96%");
						pageEndChk = false;
					}
				} 
			}
		});
	}
};

