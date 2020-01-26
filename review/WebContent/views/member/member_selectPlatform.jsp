<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 구글 api 클라이언트 아이디 입력 부분 -->
<meta name="google-signin-client_id" content="566882666738-mj2b6q1ffar2lvqhqgkat4vh0kpcfarp.apps.googleusercontent.com">

<title>Insert title here</title>

<script src="js/jquery-3.4.1.min.js"></script>
<!-- 카카오 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 구글 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script type="text/javascript">
	var googleClickFlag = false; //구글 로그인 되어있을때 클릭해야지 서브밋 되게 수정
	
	function submit(param, data){
		/* if(param == "kakao"){
			$("#email").val(data.kakao_account.email);
		}else{
			//네이버,구글 else if 추가해서 넣기
			$("#platform").val(param);
			//$("#loginForm").attr("action", "/memberLogin");
			//$("#loginForm").submit();
			
			
			$.ajax({
				url : "/memberLogin",
				type : "post",
				dataType : "json",
				//data : $("#loginForm").serialize(),
				data : {
					"myId" : $("#id").val(),
					"myPw" : $("#pass").val(),
					"email" : $("#email").val(),
					"platform" : $("#platform").val()
				},
				success : function(data){
					if(!data.resultCode){
						//아이디 정보가 없을때
						alert('로그인에 실패했습니다.');
						window.location.href="/page?page=login";
					}else{
						//아이디 정보가 일치해서 존재할때
						window.opener.fnLoginSuccess(data.user);
						window.close();
					}
				},
				error : function(err){
					alert("에러가 발생했습니다.\n브라우저 콘솔의 내용을 확인하세요.");
					console.log(err);
				}
			}); 

		}*/
	}
	
	function BtnGoogleClick(){
		alert("123");
	}
</script>
</head>

<body>

	<h1>회원가입</h1>
	<h2>STEP 1 - 플랫폼 선택</h2>
	
	<!-- <form id="loginForm" action="/memberLogin"> -->
	<form id="loginForm" method="post">
		<input id="platform" type="hidden" name="platform">
	</form>
	
	 <input type="button" value="돈독 계정으로 회원가입" onclick="submit('dondok');"><br>
	 <a id="kakao-login-btn"></a>
	 <div id="naver_id_login"></div>
	 <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	 
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
	            console.log(res);
	            
	            var returnVal = new Object();
				/* returnVal = {
						
				}; */
				
//				submit('naver', returnVal);
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
	    function kout(){
	    	Kakao.Auth.logout();
		}
	  //]]>
	  
	  //네이버
		var clientId = "obaG5HszPWxOuj0r9ab5";
		var callbackUrl = "http://localhost:8787/views/member/naverLogin.jsp";
		var naver_id_login = new naver_id_login(clientId, callbackUrl);
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 40);
		naver_id_login.setDomain("http://localhost:8787");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
		
		function response(email, nickname, age){
			var returnVal = new Object();
			returnVal = {
					nickname : nickname,
					email : email
			};
			
			submit('naver', returnVal);
	  	}
		
		//구글
	    function onSignIn(googleUser) {
	        var profile = googleUser.getBasicProfile();
			var returnVal = new Object();
			returnVal = {
					name : profile.getName(),
					profile : profile.getImageUrl(),
					email : profile.getEmail()
			};
			
			submit('google', returnVal);
	    }
	
	</script>


</body>
</html>