<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#name{
 border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: center;
}

</style>
</head>
<body>
<h1>회원 계정 찾기</h1>

<h2>아이디 찾기</h2>
<form id="" method="post">
	<input id= name type="text" class="form-control" name="name" placeholder="이름" required="" autofocus="" /></br>
 	<input id=email type="password" class="form-control" name="email" placeholder="email" required=""/></br>
	 <button type="button"  onclick="submit();">아이디 찾기</button>
	 <button type="button"  onclick="submit();">취소</button></br>
</form>
    
<h2>비밀번호 찾기</h2>
<form id="" method="post">
	<input type="text" class="form-control" name="userId" placeholder="아이디" required="" autofocus="" /></br>
	<input type="text" class="form-control" name="name" placeholder="이름" required="" autofocus="" /></br>
 	<input type="password" class="form-control" name="email" placeholder="email" required=""/> <button type="button"  onclick="submit();">인증번호 전송</button></br>
<input type="password" class="form-control" name="email" placeholder="인증번호 입력" required=""/> <button type="button"  onclick="submit();">인증</button></br>

	 <button type="button"  onclick="submit();">비밀번호 찾기</button>
	 <button type="button"  onclick="submit();">취소</button></br>
</form>
</body>
</html>