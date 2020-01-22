<%@page import="com.trip.member.dto.MemberLoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/loginheader.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	function submit(){
		$("#searchForm").attr("action", "UserSearchServlet");
		$("#searchForm").submit();
	}
	
	$(".innerlogin").click(function() {
		
		  //ul li 구현
	});
	
// 		$(function(){
// 			$.ajax({
// 				url:"memberLogin",
// 				dataType:"json",
// 				success:function(msg){
// 					$("#loginId").html(
// 						msg.usernick
// 					);
// 				},
// 				error:function(){
// 					alert("통신 실패!");
// 				}
// 			})
// 		})

	var num = 1;
		$(function(){
				var eventCon = function(){
					$.ajax({
					type : 'post',
					url : 'TripEvent.do',
					dataType : 'json',
					success : function(msg) {
						var eventObj = msg;
						console.log(eventObj);
						
						var selectEvent = (function(i){
							var len = eventObj.response.body.items.item.length;	
							if(i === len){
								num = 0;
								return;
							}
							var eventstartdate = eventObj.response.body.items.item[i].eventstartdate;
 							$("#eventstartdate").text(eventstartdate);
							var eventenddate = eventObj.response.body.items.item[i].eventenddate;
							$("#eventenddate").text(eventenddate);
							var title = eventObj.response.body.items.item[i].title;
							$("#title").text(title);
							var addr1 = eventObj.response.body.items.item[i].addr1;
							
							
							var split = addr1.split(" ");
							
// 							var yyyymmdd = (function(j){
// 								j.substring(0,3)+"."+j.substring(4,5)+"."+j.substring(6,7);
// 							})
// 							$("#eventstartdate").text(yyyymmdd(eventstartdate));
// 							$("#eventenddate").text(yyyymmdd(eventenddate));
						
							
							$("#addr1").text(split[0]+" "+split[1]+" "+split[2]);
							
							
						});
						selectEvent(0);
						
						
						
						setInterval(function(){
							selectEvent(num);
							num++;
							
							  
						},3000);
					}
				});
			}();
		});

		
		
</script>

	<%MemberLoginDto user = (MemberLoginDto)session.getAttribute("user"); %>
	
</head>
<body>



	<header>
		<form id="searchForm" method="post">
			<input  type="hidden" name="myid" value="<%=user.getM_id()%>"/>
		
		<div class="firstline">
			<div class="firstparagraph1">
				<div class="inline" id="homeimg">
					
				</div>
				<div class="inline" id="home">	
					<a href="TripReviewView">돈   독</a>
				</div>
				<div class="inline" id="menubar">
					<ul>
						<li id="menubarimg"><a><img alt="menu" src="img/mainheader/menubar.jpg"
								style="width: 40px; height: 40px;"></a>
							<ul>
								<li><a href="PageMoveServlet?command=schedule">일정관리</a>
									<ul>
										<li><a href="PageMoveServlet?command=scheduleCheck">일정조회</a></li>
										<li><a href="PageMoveServlet?command=scheduleView">일정보기</a></li>
										<li><a href="PageMoveServlet?command=scheduleRegister">일정등록</a></li>
									</ul>
								</li>
								<li><a href="PageMoveServlet?command=review">여행후기</a>
									<ul>
										<li><a href="">맛집후기</a></li>
										<li><a href="">명소후기</a></li>
										<li><a href="">숙소후기</a></li>
									</ul></li>
								<li><a href="PageMoveServlet?command=shareAlbum">앨범공유</a></li>
								<li><a href="PageMoveServlet?command=shareSchedule">일정공유</a></li>
							</ul></li>
					</ul>
				</div>
				
			</div>
			<span class="linebar">  |</span>
			<div class="firstcen">
				<div class="whatbtn">
					<a >
						<img alt="what" src="img/mainheader/what.png" style="width: 40px; height: 40px;">
					</a>
				</div>
				<span class="minibar">|</span>
				<input id = "search" type="text" name="search" placeholder="무엇을 찾으십니까?" />
			</div>                             
			<div class="firstparagraph3">
				<div id="searchbtn">
 					<a class="img-button" onclick="submit();" title="검색"><img alt="search" src="img/mainheader/search.jpg" style="width: 40px; height: 40px;">
 					</a>
				</div>
				<div class="login">
					<span class="linebar"> | </span>
						<div class="loginimg"></div>
						<div class="innerlogin">
							<ul>
								<li class="idmenu">
									<a href="#"> <%=user.getM_nick() %> </a> 
										<ul class="hide">
											<li><a href="#">개인 정보 수정</a></li>
											<li><a >작성 글 조회</a></li>
											<li><a>등록 스크랩 조회</a></li>
											<li><a>알림 조회</a></li>
											<li><a>로그아웃</a></li>
										</ul>
								</li>
							</ul>
						</div>
					<span class="linebar"> | </span>
				</div>
				<div id="alarmbtn">
					<a href="PageMoveServlet?command=alarm" title="알림"><img alt="alarm" src="img/mainheader/alarm.png" style="width: 40px; height: 40px;">
					</a>
				</div>
			</div>
		</div>
		</form>
		
		<div class="secondline">
			
			 <div id = "secondcenter">
				[<div class="second" id="date">
					<span id= "eventstartdate"></span>~<span id="eventenddate"></span>
				</div>]  
				<div class="second" id="text_bar">|</div> 
				<div class="second" id="addr1" /></div>> 
				<div class="second" id="title" /></div> 
			</div>
		</div>
		
	</header>

</body>
</html>