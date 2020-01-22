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
		padding-bottom:5px;
		height: 40px;
		width:100%;
		margin : 0;
	}
	
	.secondline{
		position:relative;
		padding-top:5px;
		height:30px;
		margin : 5px;
		width:100%;
		background-color: lightskyblue;
	}
	.inline{
		display:inline-block;
	}
	.firstcen {
		display:inline-block;
		width:60%;
		height:100%;
		text-align:center;
		border-color: gray;
   	 	border: solid;
   	 	border-radius: 5px;
	}
	
	#secondcenter {
		width:60%;
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
		margin-left:20%;
	}
	
	#home{
		width:40px;
		height:100%;
		font-size:medium;
		font-weight: bold;
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
		float:right;
		width:19%;
		height:100%;
		display: inline-block;
	}
	

	
	#title{
		font-weight: bold;
	}
	
	.login{
		float:left;
		display:inline-block;
	}
	
	.linebar{
		font-size:30px;
		padding-left:0.3%
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
				<a ><img alt="what" src="img/mainheader/what.png" style="width: 30px; height: 30px;">
				</a>
				<span>|</span>
				<input id = search type="text" value="" name="search" placeholder="무엇을 찾으십니까?" />
			</div>                             
			<div class="firstparagraph3">
				<a href="PageMoveServlet?command=search" title="검색"><img alt="search" src="img/mainheader/search.jpg" style="width: 40px; height: 40px;">
				</a> 
					<span class="linebar"> | </span><a href="page?page=login" >로 그 인</a> <span class="linebar"> | </span>
				<a href="PageMoveServlet?command=alarm" title="알림"><img alt="alarm" src="img/mainheader/alarm.png" style="width: 40px; height: 40px;">
				</a>
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