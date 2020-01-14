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
	@import url("css/TripReviewView.css")
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<c:choose>
	<c:when test="${empty keyword}">
		<script type="text/javascript" src="js/tripReviewViewAjax.js"></script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript" src="js/tripReviewViewSearchAjax.js"></script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
$(function() {
	tripReviewView(start, end, '${keyword}');
	$("body").on(
			"mousewheel DOMMouseScroll",
			function(e) {
				var E = e.originalEvent;
				if (E.deltaY > 0) {
					var scrollVal = Math.floor($(window).scrollTop());
					var scrollValChk = Math.floor($(document).height()
							- $(window).height());
					if (scrollVal >= scrollValChk-5) {
						start += 8;
						end += 8;
						tripReviewView(start, end, '${keyword}');
					}
				}
			});
	$(".searchIcon").hover(function(){
		$(".searchIcon").css("background-image","url(./images/board_icon/lowSearch_icon_over.jpg)");
	},function(){
		$(".searchIcon").css("background-image","url(./images/board_icon/lowSearch_icon.jpg)");
	});
	$(".searchIcon").on("click",function(){
		$(".searchDiv").toggle("slow");
	});
	$(".searchBar").keydown(function(key){
		var keyword = $(".searchBar").val()
		if(key.keyCode == 13){
			location.href='TripReviewList?keyword=' + keyword;
		}
	});
});
</script>
<body>
	<section>
		<article id="article_header">
			<div class="nowLocation"><a href="TripReviewList"><span class="locationName">여행 후기</span></a></div>
			<div class="searchIcon"></div>
			<div class="searchDiv"><input name="keyword" type="text" class="searchBar" placeholder="검색하고자 하는 키워드를 입력하세요."></div>
		</article>
		<article id="article_contents"></article>
	</section>
</body>
</html>