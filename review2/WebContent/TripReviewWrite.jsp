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

@import url("css/TripReviewWrite.css");
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('form').submit(function() {
			var check = true;
			$('input').each(function(i){
				if(!$(this).val()){
					$(this).focus();
					if($(this).attr('type')==='text'){
						alert("제목을 입력해주세요.");
					} else {
						alert("일정을 선택해주세요.");
					}
					check = false;
				}
			});
			return check;
		});
		
		var hoverTeamEvnet = function(that) {
			$(that).hover(function() {
				$(that).removeClass('out');
				$(that).addClass('over');
			}, function() {
				$(that).removeClass('over');
				$(that).addClass('out');
			});
		};

		var clickTeamEvent = function(that) {
			$(that).off('click');
			$(that).on('click', function() {
				var t_id = $(that).attr('data-t_id');
				var oldNum = $('input[type=hidden]').val();
				if (oldNum) {

					$('li[data-t_id=' + oldNum + ']').removeClass('over');
					$('li[data-t_id=' + oldNum + ']').addClass('out');
					
					hoverTeamEvnet($('li[data-t_id=' + oldNum + ']'));
					clickTeamEvent($('li[data-t_id=' + oldNum + ']'));
				}
				$('input[type=hidden]').val(t_id);
				$(that).removeClass('out');
				$(that).addClass('over');
				$(that).unbind('mouseenter mouseleave');

				$(that).off('click');

				$(that).on('click', function() {
					$('input[type=hidden]').val('');
					$(that).removeClass('over');
					$(that).addClass('out');

					hoverTeamEvnet(that);
					clickTeamEvent(that);
				});
			});
		};
		
		var mouseEvnet = function(i,that){
			
			var teamBox = $('ul.teamBox').eq(i);
			
			$(that).on('mouseenter',function(e){
				var top = e.offsetY+$(that).height()*(i*1.8);
				var left = e.offsetX+5;
				
				teamBox.css({
					'top' : top,
					'left' : left
				});
				$('ul.teamBox').css('display','none');
				teamBox.slideToggle(200);
			});
			
			$(that).on('mousemove',function(e){
				var top = e.offsetY+$(that).height()*(i*1.8);
				var left = e.offsetX+5;
				teamBox.css({
					'top' : top,
					'left' : left
				});
			});
			
			$(that).on('mouseleave', function(){
				$('ul.teamBox').css('display','none');
			});
			
			$(that).on('mouseout', function(){
				$('ul.teamBox').css('display','none');
			});
		};
		
		$('li.team').each(function(i) {
			hoverTeamEvnet(this);
			clickTeamEvent(this);
			mouseEvnet(i,this);
		});
	});
</script>
<style type="text/css">
@import
url("css/bodyPosition.css");
</style>
<script type="text/javascript" src="js/haederLoad.js"></script>
</head>
<body>
	<section class="projectSection">
		<article id="article_header">
			<div class="nowLocation">
				<a href="TripReviewList">여행 후기</a><span></span> <span
					class="locationName">작성하기</span>
			</div>
		</article>
		<article class="contents">
			<form action="TripeReviewWirteRes" method="post">
				<div class="box">
					<div>여행 후기 제목</div>
					<div>
						<input type="text" name="tv_title" placeholder="여행 후기 제목을 입력해주세요." />
						<input type="hidden" name="tv_teamid" />
					</div>
					<div>작성되지 않은 일정들...</div>
					<div>
						<div class="listBox">
							<ul class="teamList">
								<c:forEach var="team" items="${trwList}">
									<li class="team" data-t_id="${team.t_id}">${team.t_name}</li>
									<ul class="teamBox">
												<li>
													<ul class="teamInfoBox">
														<li>팀 정보</li>
														<li><span style="box-shadow: none;">팀명</span>${team.t_name}</li>
														<li><span style="box-shadow: none;">리더</span>${team.t_name}</li>
														<li><span style="box-shadow: none;">일정 기간</span>
															<fmt:formatDate value="${team.t_startdate}" pattern="yyyy/MM/dd"/><span class="slide">~</span><fmt:formatDate value="${team.t_enddate}" pattern="yyyy/MM/dd"/>
															<span style="font-weight: 600;">${team.t_days}<span style="font-weight:400; font-size:10pt; color:#848484;box-shadow: none;">일</span></span>
														</li>
													</ul>
												</li>
												<li>
													<ul class="memberBox">
														<li>팀 맴버 정보</li>
														<c:forEach var="tmList" items="${tmlList}">
															<c:forEach var="member" items="${tmList}">
																<c:if test="${member.tm_tid eq team.t_id}">
																	<li><span style="display:inline-block;vertical-align:middle; margin:0 10px 0 0; padding:0;box-shadow: none;width: 5px;height: 5px;background-color: #607f78;border-radius:25px;"></span>${member.tm_uid}</li>
																</c:if>
															</c:forEach>
														</c:forEach>
													</ul>
												</li>
									</ul>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div>
						<input type="submit" value="작성" /> <input type="button"
							onclick="history.back();" value="취소" />
					</div>
				</div>
			</form>
		</article>
	</section>
</body>
</html>