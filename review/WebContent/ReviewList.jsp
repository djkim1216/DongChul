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
<script type="text/javascript" src="js/ReviewViewAjax.js"></script>
<script type="text/javascript">
$(function() {
	tripReviewView(start, end, '${keyword}');
	$("body").on(
			"mousewheel DOMMouseScroll",
			function(e) {
				var E = e.originalEvent;
				if (E.deltaY > 0) {
					var scrollVal = Math.floor($(window).scrollTop());
					var scrollValChk = Math.floor($(document).height() - $(window).height());
					console.log(scrollVal);
					console.log(scrollValChk);
					if (scrollVal >= scrollValChk-75) {
						start += 8;
						end += 8;
						tripReviewView(start, end, '${keyword}');
					}
				}
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
var chk = true;
var testFun = function(){
	if(chk){
		$(".testView").css("left","100%");
		chk = false;
	} else {
		$(".testView").css("left","0%");
		chk = true;
	}
};
</script>

<body>
	<div class="testChk" onclick="testFun();">dd</div>
	<div class="testView"></div>
	sadfasdf
	<section>
		<article id="article_header">
			<div class="nowLocation"><a href="TripReviewList"><span class="locationName">여행 후기</span></a></div>
			<div class="writeIcon"></div>
			<div class="searchIcon"></div>
			<div class="searchDiv"><input name="keyword" type="text" class="searchBar" placeholder="검색하고자 하는 키워드를 입력하세요."></div>
		</article>
		<article id="article_contents"></article>
	</section>
</body>
</html>