<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/haederLoad.js"></script>	
<script type="text/javascript" src="./js/CategoryReviewWrite.js"></script>
<script type="text/javascript" src="./js/PlaceSearch.js"></script>
<link href="./api/summernote/summernote-lite.min.css" rel="stylesheet">
<script src="./api/summernote/summernote-lite.min.js"></script>
<style type="text/css">
@import
url("css/CategoryReviewWrite.css");

@import
url("css/article_header.css");

@import
url("css/CategoryPlaceSearch.css")
</style>
<!-- 헤드 삽입 -->
<style type="text/css">
@import
url("css/bodyPosition.css");
</style>
<body>
	<section class="projectSection">
		<article id="article_header">
			<div class="nowLocation">
				<span class="locationName" style="margin-top: 5px;">${category} 리뷰 작성</span>
			</div>
		</article>
		<article id="writeSection">
			<div class="writeDiv">
				<form action="CategoryReviewWriteRes" method="POST">
					<input type="hidden" name="cr_placeid"/>
					<input type="hidden" name="category" value="${category}" />
					<div class="writeHead">
						<div class="titleForm">
							<p class="titleP">
								<span>제목</span><input type="text" name="cr_title"/>
							</p>
						</div>
						<div class="placeForm">
							<p class="placeP">
								<span>장소</span><img src="images/board_icon/location_icon.png"/><span><span></span></span><a href="#" onclick="return false;" class="searchIcon"></a>
							</p>
						</div>
					</div>
					<div class="writeMiddle">
						<textarea id="summernote" name="cr_contents"></textarea>
					</div>
					<div class="writeFoot">
						<input type="submit" value="작성" />
						<input type="button" value="목록"/>
					</div>
				</form>
			</div>
		</article>
	</section>
</body>
</html>