<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menubar li ul{
		display:none;
	}
	.menubar li:hover ul{
		display:block;
	}

</style>
</head>
<body>
	<div>
		<a href="mainview.jsp">돈 독</a>
			<div class="menubar">
				<ul>
					<li><a><img alt="menu" src="img/menubar.jpg" style="width: 20px; height: 20px;"></a>
						<ul>
						<li><a href="PageMoveServlet?command=schedule">일정관리</a>
							<ul>
								<li><a href="">일정조회</a></li>
								<li><a href="">일정보기</a></li>
								<li><a href="">일정등록</a></li>
							</ul>
						</li>
						<li><a href="PageMoveServlet?command=review">여행후기</a>
							<ul>
								<li><a href="">맛집후기</a></li>
								<li><a href="">명소후기</a></li>
								<li><a href="">숙소후기</a></li>
							</ul>
						</li>
						<li><a href="">앨범공유</a></li>
						<li><a href="">일정공유</a></li>		
					</ul>
					</li>
				</ul>
			<input type="text" value="무엇을 찾으십니까?" name="search"/>
			<a href="PageMoveServlet?command=search"><img alt="search" src="img/search.jpg" style="width: 20px; height: 20px;"></a>
			<a href="PageMoveServlet?command=loginform">로그인</a>
			<a href="PageMoveServlet?command=alarm"><img alt="alarm" src="img/alarm.png" style="width: 20px; height: 20px;"></a>
		</div>
	</div>
	<div>
		
	</div>
</body>
</html>