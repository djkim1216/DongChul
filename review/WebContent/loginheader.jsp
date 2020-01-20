<%@page import="com.trip.member.dto.MemberLoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	

	a { text-decoration:none } 

	ul, li { list-style:none; margin: 0; padding:0; }
	
	#menubar {
		float:right;
	}

	#menubar ul > li{
		position:relative;
	}
	
	#menubar li ul {
		display: none;
		width:80px;
	}
	
	#menubar ul>li ul>li{
		postion:relative;
		width:80px;
		padding:5px 10px;
	}

	#menubar li:hover ul {
		display: block;
	}

	.firstline{
		position:relative;
		padding :0;
		padding-bottom:5px;
		height: 40px;
		width:1250px;
		margin : 5px;
		margin : 10px;
	}
	
	.secondline{
		position:relative;
		padding-top:5px;
		padding: 0;
		height:30px;
		margin : 5px;
		width:1250px;
		background-color: lightskyblue;
	}
	.inline{
		display:inline-block;
	}
	.firstcen {
		display:inline-block;
		width:57%;
		float:left;
		height:100%;
		text-align:left;
		border-color: gray;
   	 	border: solid;
   	 	border-radius: 5px;
	}
	
	#secondcenter {
		width:57%;
		height:80%;
		background-color: white;
		text-align:left;
		margin-left:19%;
		border-radius: 5px;
	}
	
	#text_bar{
		display: inline-block;
		width:1px;
		margin : 2px;
	}
	
	#search {
		 width:90%;
		 height:90%;
 		 margin : 0;
 		 border:none;
 		 font-size: medium;
 		 
	}
	
	#homeimg{
		width:40px;
		height:100%;
		border-radius:50%;
		border-color: aqua;
		border: solid;
		margin-left:16%;
		margin-right:5%;
		float:left;
	}
	
	
	#home{
		height:100%;
		font-size:x-large;
		font-weight: bold;
		float: left;
		margin-top: 5px;
		margin-left: 10px;
	}
	
	.second{
		display: inline-block;
		margin : 2px;
		font-size:small;
		text-align:left;
		
	}
	.firstparagraph1{
		float:left;
		width:18%;
		height:100%;
		display: inline-block;
	}
	.firstparagraph3{
		padding:0;
		margin:0;
		float:left;
		width:20%;
		height:100%;
		display: inline-block;
	}
	
	
	
	#title{
		font-weight: bold;
	}
	
	#searchbtn{
		margin-left:7px;
		float:left;
		display:inline-block;
	}
	
	#alarmbtn{
		float:left;
		display:inline-block;
	}
	
	.login{
		width:65%;
		height:40px;
		float:left;
		display:inline-block;
	}
	.loginimg{
		width:30px;
		height:30px;
		border-radius:50%;
		border:solid;
		float:left;
		margin-top:3px;
		margin-left:15px;
	}
	
	.innerlogin{
		margin-left:10px;
		text-align:left;
		width:45%;
		height:40px;
		margin-top:9px;
		float:left;
		display:inline-block;
	}
	
	.linebar{
		font-size:30px;
		float:left;
		padding-left:2px;
		padding-right:2px;
	}
	
	.minibar {
		font-size:20px;
		float:left;
		padding-right:5px;
		padding-top:3px;
	}
	
	.whatbtn{
		float:left;
	}
	
	
	
	
	
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
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

	<%MemberLoginDto result = (MemberLoginDto)session.getAttribute("result"); %>
	
</head>
<body>



	<header>
		
		<div class="firstline">
			<div class="firstparagraph1">
				<div class="inline" id="homeimg">
					
				</div>
				<div class="inline" id="home">	
					<a href="TripReviewView">돈   독</a>
				</div>
				<div class="inline" id="menubar">
					<ul>
						<li><a><img alt="menu" src="img/mainheader/menubar.jpg"
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
				<input id = search type="text" name="search" placeholder="무엇을 찾으십니까?" />
			</div>                             
			<div class="firstparagraph3">
				<div id="searchbtn">
 					<a title="검색"><img alt="search" src="img/mainheader/search.jpg" style="width: 40px; height: 40px;"></a>
				</div>
				<div class="login">
					<span class="linebar"> | </span>
						<div class="loginimg"></div>
						<div class="innerlogin">
							<a><%=result.getM_nick()%></a> 
						</div>
					<span class="linebar"> | </span>
				</div>
				<div id="alarmbtn">
					<a href="PageMoveServlet?command=alarm" title="알림"><img alt="alarm" src="img/mainheader/alarm.png" style="width: 40px; height: 40px;">
					</a>
				</div>
			</div>
		</div>
		
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