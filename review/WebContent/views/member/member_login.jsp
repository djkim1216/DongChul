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
      
      #find{
      margin-left: 190px; 
      }
      
</style>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#register").click(function(){
			location.href = "/page?page=join";
		});
	});
	
	function submit(param, data){
		if(param == "kakao"){
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

		}
	}
	
</script>
</head>

<body>

	<h1>WELCOME</h1>
	<h2>로그인</h2>
	
	<!-- <form id="loginForm" action="/memberLogin"> -->
	<form id="loginForm" method="post">
		<input id="id" type="text" name="myId" placeholder="ID"></br>
	 	<input id="pass" type="password" name="myPw" placeholder="PW"></br>
	
		<input id="email" type="hidden" name="email"></br>
		<input id="platform" type="hidden" name="platform">
	</form>
	
	<a href="/views/member/member_findIdPw.jsp" id="find">ID/PW찾기</a>

	 <input type="button" value="로그인" onclick="submit('dondok');"><br>
	 <input type="button" value="회원가입"  id="register">


	<a id="kakao-login-btn"></a>
	<a onclick="kout();">카카오 로그아웃</a>

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
    function kout(){
    	Kakao.Auth.logout();
	}
    
    
  //]]>
  
</script>

<div id="naver_id_login"></div>
<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>

<script type="text/javascript">
		var clientId = "HfNsjkYXUYG3ExPNXmA9";
		var callbackUrl = "http://localhost:8787/views/member/member_main.jsp";
		var naver_id_login = new naver_id_login(clientId, callbackUrl);
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 40);
		naver_id_login.setDomain("localhost:8787/views/member/member_main.jsp");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
</script>


</body>
</html>