<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="list_view">
	<c:forEach varStatus="num" begin="1" end="8" step="1" var="dto" items="${tripReviewView_List}">
		<c:if test="${num.index >= 1}">
			
		</c:if>
	</c:forEach>
</div>
</body>
</html>