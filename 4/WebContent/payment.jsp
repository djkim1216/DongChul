<%@page import="trip.dto.AccountDto"%>
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
int person=(int)request.getAttribute("person");
int per_payment=(Integer.parseInt(accountDto.getAcc_price())-Integer.parseInt(accountDto.getAcc_mileage()))/person;
%>
</head>
<body>
<h1>일정 등록</h1>
   <h2>5단계 : 더치 페이</h2><button onclick="location.href='complate.jsp'">완료▶</button> 
<table>
<tr><td>은행명</td><td><%=accountDto.getAcc_bank() %></td></tr>
<tr><td>계좌번호</td><td><%=accountDto.getAcc_num() %></td></tr>
<tr><td>예금주</td><td><%=accountDto.getAcc_holder() %></td></tr>
<tr><td>입금할 금액</td><td><%=per_payment %></td></tr>
</table>
<hr/>
<table>
<tr><td>총 금액</td><td><%=accountDto.getAcc_price() %></td></tr>
<tr><td>총 마일리지</td><td><%=accountDto.getAcc_mileage() %></td></tr>
</table>
</body>
</html>