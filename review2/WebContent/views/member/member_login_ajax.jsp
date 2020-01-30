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
	
	/* function submit(param, data){
		if(param == "kakao"){
			$("#email").val(data.kakao_account.email);
		}
		//네이버,구글 else if 추가해서 넣기
		$("#platform").val(param);
		$("#loginForm").attr("action", "/memberLogin");
		$("#loginForm").submit();
	} */
	
	//ajax로 던지기
	function submit(param, data){
		if(param == "kakao"){
			$("#email").val(data.kakao_account.email);
		}
		//네이버,구글 else if 추가해서 넣기
		$("#platform").val(param);
		/* $("#loginForm").attr("action", "/memberLogin");
		$("#loginForm").submit(); */
		
		var obj = {
				url : "/memberLogin2",
				type : "post",
				dataType : "json",
				/* data : {
					aaa : 123,
					bbb : "hi"
				}, */
				data : $("#loginForm").serialize(),
				success : function(data){
					alert("success");
					console.log(data);
					$("#login1").hide();
					$("#resultTxt").text(data.m_name + "님 반갑습니다.");
					$("#login2").show();
					
				},
				error : function(err){
					alert("에러가 발생했습니다.\n브라우저 콘솔의 내용을 확인하세요.");
					console.log(err);
				}
		};
		
		$.ajax(obj);
		
		
	}
	
	function changeColor(){
		$("#colorBox").css("background-color", "blue");
	}
</script>
</head>

<body>

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
<div id="login2" style="display:none;">
	<span id="resultTxt"></span>
</div>

<div id="colorBox" style="width:100px; height:100px; background-color:red;"></div>
<button type="button"  onclick="changeColor();">색 바꾸기</button></br>

<div class="search">
<a href="/views/member/member_findIdPw.jsp">ID/PW찾기</a>
</div>
     <button type="button"  onclick="submit('dondok');">로그인</button></br>
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
 </body> 
</body>
</html>