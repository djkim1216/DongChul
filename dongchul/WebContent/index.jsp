<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function clickBtn(){
		$("#submitForm").attr("action", "/sample");
		$("#submitForm").submit();
	}
</script>
</head>
<body>
	<form id="submitForm" method="post">
		<input type="hidden" name="id" value="minji"/>
		<input type="hidden" name="pw" value="123123"/>
	</form>
	<button onclick="clickBtn();">컨트롤러 접속 확인</button>
</body>
</html>