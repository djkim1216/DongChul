<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@import
url("css/ReviewView.css");
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/ReviewViewAjax.js"></script>
<style type="text/css">
@import
url("css/bodyPosition.css");
</style>
<script type="text/javascript" src="js/haederLoad.js"></script>
<script type="text/javascript">
	$(function() {
		var urlArray = window.location.pathname.split('/');
		var urlEnd = urlArray[urlArray.length - 1];
		console.log(urlEnd);
		reviewView(start, end, '${keyword}', '${reviewLocation}');
		$("body").on(
				"mousewheel DOMMouseScroll",
				function(e) {
					var E = e.originalEvent;
					if (E.deltaY > 0) {
						var scrollVal = Math.floor($(window).scrollTop());
						var scrollValChk = Math.floor($(document).height()
								- $(window).height());
						if (scrollVal >= scrollValChk - 75) {
							start += 8;
							end += 8;
							reviewView(start, end, '${keyword}',
									'${reviewLocation}');
						}
					}
				});
		$(".searchIcon").on("click", function() {
			$(".searchDiv").toggle("slow");
		});
		$(".searchBar").keydown(function(key) {
			var keyword = $(".searchBar").val()
			if (key.keyCode == 13) {
				location.href = urlEnd + '?keyword=' + keyword;
			}
		});
		$(".locationName").on("click", function() {
			location.href = urlEnd;
		})

	});

	var toolTipBoxOn = function(value, event) {
		console.log(event.clientY);
		console.log(event.clientX);
		$('.toolTip').text(value);
		$('.toolTip').css("display", "block");
		$('.toolTip').css("top", event.clientY + 10 + "px");
		$('.toolTip').css("left", event.clientX + 10 + "px");
	};

	var toolTipBoxOff = function() {
		$('.toolTip').css("display", "none");
	}
</script>
<body>
	<span class="toolTip"></span>
	<section class="projectSection">
		<article id="article_header">
			<div class="nowLocation">
			<c:set var="category" value="${reviewLocation}"></c:set>
				<c:choose>
					<c:when test="${reviewLocation eq 'TripReviewView'}">
					<a href="TripReviewList"><span class="locationName"
				onmousemove="toolTipBoxOn('메인화면으로...',event);" onmouseout="toolTipBoxOff();"> 여행 후기 </span></a></c:when>
					<c:when test="${reviewLocation eq 'RestaurantReviewView'}">
					<a href="RestaurantReviewList"><span class="locationName"
				onmousemove="toolTipBoxOn('메인화면으로...',event);" onmouseout="toolTipBoxOff();"> 맛집 리뷰 </span></a>
					</c:when>
					<c:when test="${reviewLocation eq 'RoomsReviewView'}">
					<a href="RoomsReivewList"><span class="locationName"
				onmousemove="toolTipBoxOn('메인화면으로...',event);" onmouseout="toolTipBoxOff();"> 숙소 리뷰 </span></a>
					</c:when>
					<c:when test="${reviewLocation eq 'TouristReviewView'}">
					<a href="TouristReviewList"><span class="locationName"
				onmousemove="toolTipBoxOn('메인화면으로...',event);" onmouseout="toolTipBoxOff();"> 명소 리뷰 </span></a>
					</c:when>
				</c:choose>
				
			</div>
			<a href="${reviewLocation ne 'TripReviewView'? 'CategoryReviewWrite?category=': 'TripReviewWrite'}${reviewLocation ne 'TripReviewView'? category : ''}" class="writeIcon"
				onmousemove="toolTipBoxOn('글작성',event);"
				onmouseout="toolTipBoxOff();"></a> <a href="#"
				onclick="return flase;" class="searchIcon"
				onmousemove="toolTipBoxOn('검색창',event);"
				onmouseout="toolTipBoxOff();"></a>
			<div class="searchDiv">
				<input name="keyword" type="text" class="searchBar"
					placeholder="검색하고자 하는 키워드를 입력하세요.">
			</div>
		</article>
		<article id="article_contents"></article>
	</section>
</body>
</html>