<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
         
         margin: 0;
      }
   
   
   #a{text-align: center; }
   #a{text-align: justify;}
   #a{margin-left: auto;
      margin-right: auto;
   
   }
   
   #cancel{
      background-color: red;
   }
   
   .id{
      border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
		     text-align: center;
   }
   #join{    margin-left: 100px;
         background-color: #4bb54b;
         border-radius: 10px 10px 10px 10px;   
         width:120pt;
         height:26pt; 
         color:white;"
      }
      .send{
         background-color: #3383c4;
         
         margin-left: 0px;
         
         border-radius: 10px 10px 10px 10px;   
      }
      
      #pass{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: center;
      }
      #pass1{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: center;
      }
      
      #nickname{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: center;
         
      }
      
	    .name{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }

      #email{
         border-radius:10px 10px 10px 10px;
         width: 150pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      
      #phone{
         border-radius:10px 10px 10px 10px;
         width: 150pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      
      .check{
      	 background-color: #3383c4;
         margin-left: 0px;
         border-radius: 10px 10px 10px 10px;   
      }
      
      .number{
           border-radius:10px 10px 10px 10px;
         width: 150pt;
         height: 28pt;
         background-color: #f3f3f3;
           text-align: center;
      }
      
      #addr{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: center;
      }
      
      #addr1{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
         text-align: center;
      }

	   #cancel{
      margin-left: 0px;
         background-color: #e41334;
         border-radius: 10px 10px 10px 10px;   
         width:57pt;
         height:26pt; 
         color:white;"
   }
   
   #btnAgree{
		 background-color: #3383c4;
         margin-left: 45px;
         border-radius: 10px 10px 10px 10px;   
      }
      
      #btnAgree2{
		 background-color: #3383c4;
         margin-left: 11px;
         border-radius: 10px 10px 10px 10px;   
      }
      
      .img_profile{
      	width: 160px;
      	height: 170px;
      	border-radius: 150px;
      	box-shadow: 5px 10px 30px 10px black;
      	margin-left: 28%;
      }
      
   }
</style>
<script src="js/jquery-3.4.1.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script> 
<script type="text/javascript">
	var chkId = false;
	var chkNick = false;
	
	$(function(){
		$("#imgFile").change(function(){
			if($(this).val() == null || $(this).val().length == 0){
				readURL(false, this);
			}else{
				readURL(true, this);
			}

		});
	});

	function openPop_juso(){
		var pop = window.open("views/member/jusoPopup.jsp","juso","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$("#addr").val("(" + zipNo + ") " + roadAddrPart1);
		$("#addr1").val(addrDetail);
	}
	
	function fnExtAccount(){
		alert("외부 계정으로 회원가입시 이메일 변경이 불가합니다.");
	}
	
	function chkDup(sort){
		var dataObj = new Object();
		if(sort == "id"){
			
			if($("#myid").val().trim().length < 1){
				return;
			}
			
			dataObj = {
				"param" : sort,
				"paramValue" : $("#myid").val()
			};
		}else if(sort == "nick"){
			
			if($("#nickname").val().trim().length < 1){
				return;
			}
			
			dataObj = {
				"param" : sort,
				"paramValue" : $("#nickname").val()
			};
		}
		
		$.ajax({
			url : "/dupCheck",
			type : "post",
			dataType : "json",
			data : dataObj,
			success : function(data){
				if(sort == "id"){
					if(!data.resCode){
						$("#myid").val("");
						return alert("입력하신 아이디는 이미 사용중인 아이디 입니다.");
					}else{
						$("#idChkResTxt").text("사용가능한 아이디 입니다.");
						chkId = true;
					}
				}else if(sort == "nick"){
					if(!data.resCode){
						$("#nickname").val("");
						return alert("입력하신 아이디는 이미 사용중인 별명 입니다.");
					}else{
						$("#nickChkResTxt").text("사용가능한 별명 입니다.");
						chkNick = true;
					}
				}
			},
			error : function(err){
				alert("에러가 발생했습니다.\n브라우저 콘솔의 내용을 확인하세요.");
				console.log(err);
			}
		});
	}
	
	function fnClickFile(){
		$("#imgFile").click();
	}
	
	function readURL(flag, input) {
		if(flag){
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				  
				reader.onload = function (e) {
					$('#img_profile').attr('src', e.target.result);  
				}
				  
				reader.readAsDataURL(input.files[0]);
			}
		}else{
			var profile = "${resMap.profile}";
			var src = "";
			if(profile.length < 1){
				src = "img/sampleProfileImage.jpg";
			}else{
				src = profile;
			}
			$('#img_profile').attr('src', src);
		}
	}
	
	var emailCode = "";
	function fnEmailValidation(){
		if($("#email").val().trim().length < 1){
			return;
		}
		
		$.ajax({
			url : "/emailValidation",
			type : "post",
			dataType : "json",
			data : {
				"email" : $("#email").val()
			},
			success : function(data){
				console.log(data);
				if(data.resultCode == "1002"){
					return alert("이미 가입되어 있는 이메일 주소입니다.");
				}else if(data.resultCode == "1001"){
					return alert("메일 발송중 에러가 발생했습니다.\n메일을 발송하지 못했습니다.");
				}
				
				emailCode = data.emailValidationCode;
				alert("메일이 발송 되었습니다.\n메일에 포함된 인증코드를 입력 후 인증 버튼을 눌러주세요.");
			},
			error : function(err){
				alert("에러가 발생했습니다.\n브라우저 콘솔의 내용을 확인하세요.");
				console.log(err);
			}
		});
	}
	
	function chkEmailCode(){
		if($("#emailCodeInput").val() == emailCode){
			alert("인증되었습니다.");
			$("#emailRes").val("Y");
		}else{
			return alert("인증번호가 일치하지 않습니다.");
		}
	}
	
	//회원가입
	function fnSubmit() { 
		var regExpId = /^[a-z0-9+]{8,16}$/; //영문 숫자 8자~16자
		var regExpPass = /^[A-Za-z0-9+]{8,16}$/; //영문 숫자 8자~16자
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!$("#agree").is(":checked")){
			return alert("이용약관에 대한 동의를 체크해야 합니다."); 
		}
		if(!$("#agree2").is(":checked")){
			return alert("개인정보 수집 및 이용동의를 체크해야 합니다."); 
		}
		if (grecaptcha.getResponse() == ""){ 
			return alert("로봇이 아닙니다 항목을 체크해야 합니다."); 
		}
		
		if($("#myid").val().trim().length < 1){
			$("#myid").val("");
			return alert("아이디를 입력해 주세요.");
		}
		
		if(!regExpId.test($("#myid").val())){
			$("#myid").val("");
			chkId = false;
			$("#idChkResTxt").text("");
			return alert("아이디 형식이 올바르지 않습니다.\n8~16글자수의 영문(대,소문자) 와 숫자 조합으로 만들 수 있습니다.");
		}
		
		if(!chkId){
			return alert("아이디 중복체크를 해주시기 바랍니다.");
		}
		
		if($("#pass, #pass1").val().trim().length < 1){
			$("#pass, #pass1").val("");
			return alert("비밀번호를 입력해 주세요.");
		}
		
		if(!regExpPass.test($("#pass").val())){
			$("#pass").val("");
			return alert("비밀번호 형식이 올바르지 않습니다.\n8~16글자수의 영문(대,소문자) 와 숫자 조합으로 만들 수 있습니다.");
		}
		
		if($("#pass").val() != $("#pass1").val()){
			return alert("비밀번호가 일치하지 않습니다.");
		}
		
		if($("#name").val().trim().length < 1){
			$("#name").val("");
			return alert("이름를 입력해 주세요.");
		}
		
		if($("#nickname").val().trim().length < 1){
			$("#nickname").val("");
			return alert("별명를 입력해 주세요.");
		}
		
		if($("#nickname").val().trim().length < 3){
			$("#nickname").val("");
			chkNick = false;
			$("#nickChkResTxt").text("");
			return alert("별명은 2글자 이상으로 설정해 주세요.");
		}
		
		if(!chkNick){
			return alert("별명 중복체크를 해주시기 바랍니다.");
		}
		
		if($("#phone").val().trim().length < 1){
			$("#phone").val("");
			return alert("휴대폰 번호를 입력해 주세요.");
		}
		
		if($("#email").val().trim().length < 1){
			$("#email").val("");
			return alert("이메일을 입력해 주세요.");
		}
		
		if(!regExpEmail.test($("#email").val())){
			$("#email").val("");
			return alert("이메일 형식이 올바르지 않습니다.");
		}
		
		if($("#emailRes").val() == "N"){
			return alert("이메일 인증을 해주시기 바랍니다.");
		}
		
		$("#memberInsForm").submit();
	}  
</script> 
</head>
<body>
   <h1>회원가입</h1>
   <hr/>
   <form id="memberInsForm" action="/memberJoin" method="post" enctype="multipart/form-data">
		<input type="hidden" name="platform" value="${resMap.platform}">
		<input type="hidden" name="profile" value="${resMap.profile}">
	    <table >
		   <tbody>
		      <tr>
		         <td colspan="2">
		         	<img id="img_profile" class="img_profile" src="${resMap.profile}" onError="this.src='img/sampleProfileImage.jpg'" alt="">
		         </td>
		      </tr>
		      <tr>
		         <td colspan="2">
					<input class="send" type="button" style="width:80pt;height:26pt; color:white; margin-left: 34%; margin-bottom: 5%;" value="사진등록" onclick="fnClickFile();"/>
					<div style="display:none;">
						<input id="imgFile" name="imgFile" type="file"/>
					</div>
		         </td>
		      </tr>
		      <tr>
		         <th id="a">아이디</th>
		         <td>
		         	<input id="myid" class="id" type="text" name="myid" placeholder="8글자 영문 대소문자. 숫자 입력">
		         </td>
		      </tr>
		      <tr>
		         <td colspan="2">
		         	<input class="send" type="button" style="width:80pt;height:26pt; color:white; margin-left:68px;" value="아이디 중복체크"  onclick="chkDup('id');" />
		         	<span id="idChkResTxt"></span>
		         </td>
		      </tr>
		      <tr>
			      <th id="a">비밀번호</th>
			      <td>
			         <input id="pass" class="searchBar" type="password" placeholder="8글자 영문 대소문자. 숫자 입력" name="mypw">
			      </td>
		      </tr>
		      <tr>
			      <th id="a">비밀번호 확인</th>
			      <td>
			         <input id="pass1" type="password" placeholder="8글자 영문 대소문자. 숫자 입력">
			      </td>
		      </tr>
		      <tr>
			      <th id="a">이름</th>
			      <td>
			       <input id="name" class="name" type="text" name="name" value="${resMap.name}"/>
			      </td>
		      </tr>
		      <tr>
			      <th id="a">별명</th>
			      <td>
			         <input id="nickname" type="text" placeholder="2글자 이상 입력"  name="mynick" value="${resMap.nickname}">
			      </td>
		      </tr>
		      <tr>
		         <td colspan="2">
		         	<input class="send" type="button" style="width:80pt;height:26pt; color:white; margin-left:68px;" value="별명 중복체크"  onclick="chkDup('nick');" />
		         	<span id="nickChkResTxt"></span>
		         </td>
		      </tr>
		      <tr>
			      <th id="a">휴대폰</th>
			      <td>
			         <input id="phone" type="text" placeholder="-없이 입력"  name="phone" style="text-align:center;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11"/>
		         </td>
		      </tr>
		      <tr>
			      <th id="a">이메일</th>
			      <td>
			         <input id="email" type="text" size="50" name="myemail" value="${resMap.email}" <c:if test="${resMap.email != ''}">readonly onclick="fnExtAccount();"</c:if>/>
					 <c:if test="${resMap.email != ''}">
						 <input id="emailRes" type="hidden" value="Y"/>
					 </c:if>
					 <c:if test="${resMap.email == ''}">
						 <input class="send" type="button" style="width:50pt;height:26pt; color:white;"  value="전송" onclick="fnEmailValidation();">
						 <input id="emailCodeInput" class="number" type="text" size="50" placeholder="인증번호 입력">
						 <input class="check" type="button" style="width:50pt;height:26pt; color:white;"  value="인증" onclick="chkEmailCode();">
						 <input id="emailRes" type="hidden" value="N"/>
					 </c:if>
			      </td>
		      </tr>
		      <tr>
			      <th id="a">주소</th>
			      <td>
			         <input id="addr" type="text" size="30" name="addr1" onclick="openPop_juso();" readonly><br/>
			         <input id="addr1" type="text" size="30" name="addr2" placeholder="상세 주소를 입력해주세요" style="opacity: 1" onmouseover="this.style.opacity='0.2'" onmouseout="this.style.opacity='1'">
			      </td>
		      </tr>
	      </tbody>
	   	</table>
	</form>
   	
   <br/>
   <input id="agree" type="checkbox" name="agree">이용약관에 대한 동의(필수)
   <input id="btnAgree" type="button" style="width:90pt;height:26pt; color:white;"  value="전문보기" >
   <br/>
   
    <input id="agree2" type="checkbox" name="agree2">개인정보 수집 및 이용동의(필수)
   <input id="btnAgree" type="button" style="width:90pt;height:26pt; color:white;"  value="전문보기" >
   <br/><br/>
   
   <div class="g-recaptcha" data-sitekey="6Lcx99EUAAAAADM8yS6PteMU1ubh5MIRkpplKUUg"></div>
   
   <button id="join" type="button" onclick="fnSubmit();">회원가입</button>
   <button id="cancel" type="button" onclick="javascript: window.location.href='/member_main.jsp'">취소</button>























</body>
</html>