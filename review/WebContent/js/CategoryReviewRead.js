/**
 * http://usejsdoc.org/
 */
	var placeNameSelect = function() {
		var placeName;
		$.ajax({
			url : "metaDateCrawling",
			data : {
				url : "https://place.map.kakao.com/" + arguments[0],
				selector : "meta[property=og:title]"
			},
			dataType : "text",
			success : (data) => {
				$('span.location').html(data);
			}
		});
	};