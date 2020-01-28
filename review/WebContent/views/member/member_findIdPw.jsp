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
         text-align: left;
}

#email{
 border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: left;
}

#id{
 border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: left;
}

#name2{
 border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: left;
}

#pass{
 border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: left;
}

#num{
 border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: left;
}

#a{    margin-left: 10px;
         background-color: #4bb54b;
         border-radius: 10px 10px 10px 10px;   
         width:120pt;
         height:26pt; 
         color:white;"
      }
      
#b{
      margin-left: 10px;
         background-color: #e41334;
         border-radius: 10px 10px 10px 10px;   
         width:57pt;
         height:26pt; 
         color:white;"
   }
   
   #c{    margin-left: 10px;
         background-color: #4bb54b;
         border-radius: 10px 10px 10px 10px;   
         width:120pt;
         height:26pt; 
         color:white;"
      }
      
      #d{
      margin-left: 10px;
         background-color: #e41334;
         border-radius: 10px 10px 10px 10px;   
         width:57pt;
         height:26pt; 
         color:white;"
   }


</style>
</head>
<body>
<h1>회원 계정 찾기</h1>

<h2>아이디 찾기</h2>
<form id="" method="post">
	<input id= name type="text" class="form-control" name="name" placeholder="이름" required="" autofocus="" /></br>
 	<input id=email type="password" class="form-control" name="email" placeholder="email" required=""/></br>
	 <button id=a type="button"  onclick="submit();">아이디 찾기</button>
	 <button id= b type="button"  onclick="submit();">취소</button></br>
</form>
    
<h2>비밀번호 찾기</h2>
<form id="" method="post">
	<input id= id type="text" class="form-control" name="userId" placeholder="아이디" required="" autofocus="" /></br>
	<input id= name2 type="text" class="form-control" name="name" placeholder="이름" required="" autofocus="" /></br>
 	<input id= pass type="password" class="form-control" name="email" placeholder="email" required=""/> <button type="button"  onclick="submit();">인증번호 전송</button></br>
	<input id=num type="password" class="form-control" name="email" placeholder="인증번호 입력" required=""/> <button type="button"  onclick="submit();">인증</button></br>

	 <button id=c type="button"  onclick="submit();">비밀번호 찾기</button>
	 <button id=d type="button"  onclick="submit();">취소</button></br>
</form>
</body>
</html>