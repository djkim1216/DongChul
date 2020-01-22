<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
   @import url('https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap');
      * {
         font-family: 'Noto Sans KR', sans-serif;
      }
      
      h1{ 
         font-family: 'Do Hyeon', sans-serif;
         margin: 50;
      }
      
         #id{
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
      
</style>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function joinForm(){
		window.location.href = "/views/member/member_join.jsp";
	}
	
	function submit(){
		$("#loginForm").attr("action", "/memberLogin");
		$("#loginForm").submit();
	}
	function fnLogin(data){
		$("#platform").val("kakao");
		$("#email").val(data.kakao_account.email);
		submit();
		
	}
</script>
</head>

<body>
<h1>WELCOME</h1>
<h2>로그인</h2>
<!-- <form id="loginForm" action="/memberLogin"> -->
<form id="loginForm" method="post">
	<input id="id" type="text" name="myid" required="required" title="n" placeholder="ID"></br>
 	<input id="pass" class="searchBar" type="password" onkeypress="valChk(this.value(i));" placeholder="PW"></br>

	<input id="email" type="hidden" name="email" value=""></br>
	<input id="plaform" type="hidden" name="platform" value="dondok"></br>

</form>

<div class="search">
<a href="/views/member/member_findIdPw.jsp">ID/PW찾기</a>
</div>
     <button type="button"  onclick="submit();">로그인</button></br>
	 <button type="button"  onclick="joinForm();">회원가입</button></br>

</head>
<body>
	<a id="kakao-login-btn"></a>
	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('174a95d64854b089ce7bcd1d5eb41015');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
            //alert(JSON.stringify(res));
            console.log(res);
            
            //로그인처리
            fnLogin(res);
          },
          fail: function(error) {
            //alert(JSON.stringify(error));
        	  console.log(error);
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
     
</body>
</html>