<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menubar li ul {
		display: none;
	}

	.menubar li:hover ul {
		display: block;
	}

	.firstline{
		position : relative;
	}

	
	.secondline{
		postion : relative;
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
							var eventstartdate = eventObj.response.body.items.item[i].eventstartdate;
							$("#eventstartdate").val(eventstartdate);
							var eventenddate = eventObj.response.body.items.item[i].eventenddate;
							$("#eventenddate").val(eventenddate);
							var title = eventObj.response.body.items.item[i].title;
							$("#title").val(title);
							var addr1 = eventObj.response.body.items.item[i].addr1;
							$("#addr1").val(addr1);
							
							
							
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
		<div class="home">
			<a><img alt="home" src="img/homepage.jpg" style="width: 20px; height: 20px;"></a> 
			<a href="mainview.jsp">돈독</a>
		</div>
		<div class="menubar">
			<ul>
				<li><a><img alt="menu" src="img/menubar.jpg"
						style="width: 20px; height: 20px;"></a>
					<ul>
						<li><a href="PageMoveServlet?command=schedule">일정관리</a>
							<ul>
								<li><a href="PageMoveServlet?command=scheduleCheck">일정조회</a></li>
								<li><a href="PageMoveServlet?command=scheduleView">일정보기</a></li>
								<li><a href="PageMoveServlet?command=scheduleRegister">일정등록</a></li>
							</ul></li>
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
			<div class="search">
				<input type="text" value="" name="search" placeholder="무엇을 찾으십니까?" />
			
				<a href="PageMoveServlet?command=search">
					<img alt="search" src="img/search.jpg" style="width: 20px; height: 20px;">
				</a> 
				<a href="PageMoveServlet?command=loginform">로그인</a> 
				<a href="PageMoveServlet?command=alarm">
					<img alt="alarm" src="img/alarm.png" style="width: 20px; height: 20px;">
				</a>
			</div>
		</div>
		
		<div>
			<div class="secondline">
				[ <input type="text" id="eventstartdate" />~ <input type="text"
					id="eventenddate" />] <input type="text" id="addr1" />> <input
					type="text" id="title" />
			</div>
		</div>
	</header>

</body>
</html>