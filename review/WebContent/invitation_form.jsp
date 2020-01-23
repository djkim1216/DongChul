<%@page import="com.trip.dto.schedule.TeamMemberDto"%>
<%@page import="java.util.List"%>
<%@page import="com.trip.dao.schedule.TeamMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#invite").click(function() {
			$.ajax({
				url : "TeamMemberController?command=idCheck",
				type : "post",
				data : {
					id : $("#search").val()
				},
				dataType : "json",
				success : function(data) {
					if(data.id){
					$("#res").html("");
					$('#member_list').append('<div name="member">'+decodeURIComponent(data.id)+'</div>');
					}else{
						$("#res").html("이미 초대된 아이디입니다.");
					}
				},
				error : function() {
					$("#res").html("탈퇴 또는 존재하지 않은 회원입니다.");
				}
			});
			
		});
		$("#complate").click(function() {
			$.ajax({
				url : "TeamMemberController?command=complete_0",
				type : "post",
				data : {
					schedule_name : $("#schedule_name").val(),
					acc_holder : $("#acc_holder").val(),
					acc_bank : $("#acc_bank").val(),
					acc_num : $("#acc_num").val()
				},
				dataType : "text",
				success : function(data) {
					location.href = "selectDay.jsp";
				},
				error : function() {
					alert("오류!!");
				}
			});
		});

		function callback() {
			console.log("readyState : " + httpRequest.readyState);
			if (httpRequest.readyState == 4) {
				console.log("status : " + httpRequest.status);

				var obj = JSON.parse(httpRequest.responseText);
			}
		}
	});
</script>
</head>
<body>
	<h1>일정 등록</h1>
	<h2>0단계: 일정 제작</h2>
	<hr />

	<div>

		<div id="trip_name" style="background-color: gray;">일정명</div>
		<div>
			<input type="text" id="schedule_name" placeholder="일정명 입력하세요!" />
		</div><br/>
		
		<div id="member_list" style="background-color: gray;">인원</div>
		<div>
			<div>
				인원 추가<input type="text" id="search" />
				<button id="invite">+</button>
				<span id="res"></span>
			</div>
		</div><br/>
		
		<div  id="acc_registor" style="background-color: gray;">계좌 등록</div>
		<div>
		예금주:<input type="text" id="acc_holder"/><br/>
		은행명:<input type="text" id="acc_bank"/><br/>
		계좌 번호:<input type="text" id="acc_num"/><br/>
		</div>
		
		<hr/>
			<button id="complate">확인</button>
			<button>취소</button>
		

	</div>
</body>
</html>