<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script src="./js/jquery-3.4.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="./api/summernote/summernote.css" rel="stylesheet">
<script src="./api/summernote/summernote.js"></script>

<script type="text/javascript" src="./js/CategoryReviewModify.js"></script>
<script type="text/javascript" src="./js/PlaceSearch.js"></script>
<script type="text/javascript">
	placeNameSelect('${dto.cr_placeid}');
</script>
<style type="text/css">
@import
url("css/CategoryReviewWrite.css");

@import
url("css/article_header.css");

@import
url("css/CategoryPlaceSearch.css")
</style>
<body>
	<section class="projectSection">
		<article id="article_header">
			<div class="nowLocation">
				<span class="locationName">${dto.cr_title}</span>
			</div>
		</article>
		<article id="writeSection">
			<div class="writeDiv">
				<form action="CategoryReviewModifyRes" method="POST">
					<input type="hidden" name="cr_no" value="${dto.cr_no}"/>
					<input type="hidden" name="cr_placeid" value="${dto.cr_placeid}"/>
					<input type="hidden" name="category" value="${dto.cr_category}" />
					<input type="hidden" name="cr_path" value="${dto.cr_path}">
					<div class="writeHead">
						<div class="titleForm">
							<p class="titleP">
								<span>제목</span><input type="text" name="cr_title" value="${dto.cr_title}"/>
							</p>
						</div>
						<div class="placeForm">
							<p class="placeP">
								<span>장소</span><img src="images/board_icon/location_icon.png"/><span><span></span></span><a href="#" onclick="return false;" class="searchIcon"></a>
							</p>
						</div>
					</div>
					<div class="writeMiddle">
						<textarea id="summernote" name="cr_contents">${dto.cr_contents}</textarea>
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