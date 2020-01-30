<%@page import="com.trip.dto.schedule.VoRoomDto"%>
<%@page import="com.trip.dto.schedule.RoomsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function delRooms(tid,id,day){
	$.ajax({
		url : "TeamMemberController?command=delRoom_vote_res",
		type : 'post',
		data : {"rooms_tid":tid,
				"rooms_id":id,
				"rooms_day":day
				},
		success : function(data) {
			alert('삭제 완료!');
		},
		error : function() {
			alert('통신오류');
		}
	});
	location.href="TeamMemberController?command=setRoom_vote_res";
}
</script>
<%
List<VoRoomDto> roomVoteList=(List<VoRoomDto>)request.getAttribute("roomVoteList");
%>
</head>
<body>
<%=roomVoteList.get(0).getVoroom_tid() %>팀
<table id="res">
<%for(int i=0;i<roomVoteList.size();i++){ %>
<tr>
<th>일차</th><td><%=roomVoteList.get(i).getVoroom_day() %></td>
<th>room id</th>
<td>
<%=roomVoteList.get(i).getVoroom_id() %>
<button onclick="delRooms(<%=roomVoteList.get(i).getVoroom_tid() %>,<%=roomVoteList.get(i).getVoroom_id() %>,<%=roomVoteList.get(i).getVoroom_day() %>);">삭제하기</button>
</td>
</tr>
<%} %>
</table>
<button onclick="location.href='TeamMemberController?command=setRoute&day=1'">루트 정하기▶</button>
 
</body>
</html>