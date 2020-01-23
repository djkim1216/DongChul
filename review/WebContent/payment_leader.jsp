<%@page import="com.trip.dto.schedule.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
AccountDto accountDto=(AccountDto)request.getAttribute("accountDto"); 
%>
</head>
<body>
<form action="TeamMemberController?command=updateacc" method="post">
<h1>일정 등록</h1>
   <h2>5단계 : 더치 페이</h2><input type="submit" value="완료!"/>
<table>
<tr><td>은행명</td><td><input type="text" name="acc_bank" value="<%=accountDto.getAcc_bank() %>"/></td></tr>
<tr><td>계좌번호</td><td><input type="text" name="acc_num" value="<%=accountDto.getAcc_num() %>"/></td></tr>
<tr><td>예금주</td><td><input type="text" name="acc_holder" value="<%=accountDto.getAcc_holder() %>"/></td></tr>
<tr><td>입금할 금액</td><td><input type="text" name="acc_price"/></td></tr>
</table>
</form>
</body>
</html>