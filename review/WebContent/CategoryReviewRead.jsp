<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("css/article_header.css");

@import url("css/CategoryReviewRead.css");

@import url("css/comment.css");
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/CategoryReviewRead.js"></script>
<script type="text/javascript" src="js/ReviewComment.js"></script>
<script type="text/javascript">
	placeNameSelect('${dto.cr_placeid}');
</script>

</head>
<body>
	<!-- 코멘트용 정보 -->
	<input name = "selectComment" type="hidden" value="category"/>
	<input name = "rv_crno" type="hidden" value="${dto.cr_no}"/>
	<input name = "user" type="hidden" value="${user.m_id}"/>
	
	<section class="projectSection">
		<article id="article_header">
			<div class="nowLocation">
				<c:if test="${dto.cr_category eq '명소'}">
					<c:set var="location" value="TouristReviewList"></c:set>
				</c:if>
				<c:if test="${dto.cr_category eq '맛집'}">
					<c:set var="location" value="RestaurantReviewList"></c:set>
				</c:if>
				<c:if test="${dto.cr_category eq '숙소'}">
					<c:set var="location" value="RoomsReviewList"></c:set>
				</c:if>
				<a href="${location}">${dto.cr_category} 리뷰</a> <span></span>
				<span class="locationName">${dto.cr_title}</span>
				<c:if test="${not empty favoriteCheck}">
					<c:if test="${favoriteCheck eq 1}">
						<a href="#" class="wishBtn wishDel" onclick="return favoriteDelete(1);">★</a>
					</c:if>
					<c:if test="${favoriteCheck ne 1}">
						<a href="#" class="wishBtn wishAdd" onclick="return favoriteInsert(1);">★</a>
					</c:if>
				</c:if>
			</div>
		</article>
		<article class="contents">
			<div class="contents_head">
				<p class="head">
					<span class="id">${dto.cr_id}</span> <span class="date"><fmt:formatDate
							value="${dto.cr_date}" pattern="yyyy/MM/dd" /></span> <span>조회수</span>
					<span class="count">${dto.cr_count}</span>
				</p>
				<p class="head">
					<img src="./images/board_icon/location_icon.png"
						class="locationIcon" /> <span class="location"></span>
				</p>
			</div>
			<div class="contents_body">${dto.cr_contents}</div>
			<div class="contents_footer">
				<a href="#" onclick="return false;"><div class="commentBtn">
						<p>
							<img src="./images/board_icon/comment_icon.png" /> <span>댓글</span>
							<span></span> <span></span>
						</p>
					</div></a>
				<c:if test="${user eq dto.cr_id}">
					<a href="CategoryReviewModify?cr_no=${dto.cr_no}" class="modify">수정</a>
					<a href="CategoryReviewDelete?cr_no=${dto.cr_no}" class="delete">삭제</a>
				</c:if>
				<a href="#" onclick="history.back(-1);" class="list">목록</a>
			</div>
		</article>
		<article class="footer">
		<!-- 코멘트 -->
			<div class="commentDiv">
				<div class="commentPage">
				<!-- 페이징 모듈 -->
					<div class="pageGroup">
						<a onclick="return false;"><div class="prevBtn">
								<div class="prevBtnImg"></div>
							</div></a> <a onclick="return false;"><div class="numBtn">
								<span class="num"></span>
							</div></a> <a onclick="return false;"><div class="numBtn">
								<span class="num"></span>
							</div></a> <a onclick="return false;"><div class="numBtn">
								<span class="num"></span>
							</div></a> <a onclick="return false;"><div class="numBtn">
								<span class="num"></span>
							</div></a> <a onclick="return false;"><div class="numBtn">
								<span class="num"></span>
							</div></a> <a onclick="return false;"><div class="nextBtn">
								<div class="nextBtnImg"></div>
							</div></a>
					</div>
				</div>
				<div class="commentWrite">
					<div>
						<div class="commentWriteBac">
							<p class="commentMyId">${user.m_id}</p>
							<div class="commentTextArea">
								<c:choose>
									<c:when test="${empty user}">
										<textarea class="commentContext" placeholder="해당 가능은 로그인이 있어야 사용 가능 합니다." readonly="readonly"></textarea>
									</c:when>
									<c:otherwise>
										<textarea class="commentContext"></textarea>
									</c:otherwise>
								</c:choose>
								<button class="commentSummit">등록</button>
							</div>
							<p class="commentCount"><span>0</span>/1500</p>
						</div>
					</div>
				</div>
			
			</div>
		</article>
	</section>
</body>
</html>