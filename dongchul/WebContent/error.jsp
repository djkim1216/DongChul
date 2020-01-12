<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>

</head>
<body>
에러페이지
<br/>
이건 catch 탔을때 나오는 페이지 입니다.
<br/>
에러메세지 내용은:
<br />
<%=errorMsg %>
</body>
</html>