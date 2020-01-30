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
	
	
	var favoriteInsert = function() {
		
		$.ajax({
			
			url : "FavoriteInsert",
			data : {
				f_pno : $('input[name=rv_crno]').val(),
				f_cate : arguments[0]
			},
			dataType : "text",
			success : (data) => {
				var chkNum = Number(data);
				if(chkNum > 0) {
					var a = `
					<a href="#" class="wishBtn wishDel" onclick="return favoriteDelete(1);">★</a>
					`;
					$('a.wishAdd').remove();
					$('span.locationName').after(a);
				}
			}
			
		});
		
	};
	
	
	var favoriteDelete = function(){
		
		$.ajax({
			
			url : "FavoriteDelete",
			data : {
				f_pno : $('input[name=rv_crno]').val()
			},
			dataType : "text",
			success : (data) => {
				var chkNum = Number(data);
				if(chkNum > 0) {
					var a = `
					<a href="#" class="wishBtn wishAdd" onclick="return favoriteInsert(1);">★</a>
					`;
					$('a.wishDel').remove();
					$('span.locationName').after(a);
				}
			}
			
		});

	}