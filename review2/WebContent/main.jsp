<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		
		url:'headerbar.jsp',
		dataType : 'html',
		success : function(data){
			$('body').append(data);
		}
		
	});
	
	
});

</script>
</head>
<body>

</body>
</html>