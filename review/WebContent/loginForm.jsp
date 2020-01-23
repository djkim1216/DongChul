<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div id="loginFormBox" >
<h1>WELCOME</h1>
<div id="login1">

	<h2>로그인</h2>
	<!-- <form id="loginForm" action="/memberLogin"> -->
	<form id="loginForm" method="post">
		<input id="id" type="text" name="myId" placeholder="ID"></br>
	 	<input id="pass" type="password" name="myPw" placeholder="PW"></br>
		<input id="email" type="hidden" name="email"></br>
		<input id="platform" type="hidden" name="platform"></br>
	
	</form>
</div>
<div class="search">
<a href="/views/member/member_findIdPw.jsp">ID/PW찾기</a>
</div>
     <button type="button"  onclick="submit('dondok');">로그인</button></br>
	 <button type="button"  onclick="joinForm();">회원가입</button></br>

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
            //로그인처리
            submit("kakao", res);
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
</div>
<div onclick="closeBox();" id="loginBak"style = "position : fixed; width : 100%; height: 100%; background-color : #464646b8; z-index:990;"></div>