<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
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
      #send{
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
      
	    #name{
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
      
      #check{
      	 background-color: #3383c4;
         margin-left: 0px;
         border-radius: 10px 10px 10px 10px;   
      }
      
      #number{
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
   
   #agree{
		 background-color: #3383c4;
         margin-left: 45px;
         border-radius: 10px 10px 10px 10px;   
      }
      
      #agree2{
		 background-color: #3383c4;
         margin-left: 11px;
         border-radius: 10px 10px 10px 10px;   
      }
   }
</style>
<script src="js/jquery-3.4.1.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script> 
<script type="text/javascript">

function fnSubmit() { 
	/* if (grecaptcha.getResponse() == ""){ 
		return alert("리캡챠를 체크해야 합니다."); 
	} */
	
	$("#memberInsForm").submit();
}

</script> 
</head>
<body>



   <h1>회원가입</h1>
   <hr/>
   <form id="memberInsForm" action="/memberJoin" method="post">
	  	<input type="hidden" name="command" value="join">
	   <table >
	      
		   <tbody>
		   <tr>
		   
		      <tr>
		         <th id="a">아이디</th>
		         <td>
		         	<input id="myid" class="id" type="text" name="myid" placeholder="8글자 영문 대소문자. 숫자 입력" >
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
		      <th id="a">별명</th>
		      <td>
		         <input id="nickname" type="text" placeholder="2글자 이상 입력"  name="mynick">
		      </td>
		      </tr>
		
			   <tr>
		      <th id="a">이름</th>
		      <td>
		       <input id="name" type="text" name="name" />
		      </td>
		      </tr>
		
		      <tr>
		      <th id="a">이메일</th>
		      <td>
		         <input id="email" type="text" size="50" name="myemail">
				 <input id="send" type="button" onclick="'" style="width:50pt;height:26pt; color:white;"  value="전송" ></br>
				<input id="number" type="text" size="50" placeholder="인증번호 입력">
				 <input id="check" type="button" onclick="'" style="width:50pt;height:26pt; color:white;"  value="인증" >
		
		
		      </td>
		      </tr>
		
		
		      <tr>
		      <th id="a">주소</th>
		      <td>
		         <input id="addr" type="text" size="30" name="addr1"><br/>
		         <input id="addr1" type="text" size="30" name="addr2"
		          value="상세 주소를 입력해주세요" style="opacity: 1" onmouseover="this.style.opacity='0.2'" onmouseout="this.style.opacity='1'">
		      </td>
		      <td><a href="./views/member/sample.jsp">ddd</a></td>
		      </tr>
		      </tbody>
	   	</table>
	   	
	   <br/>
	   <input type="checkbox" name="agree" value="">이용약관에 대한 동의(필수)
	   <input id="agree" type="button" onclick="'" style="width:90pt;height:26pt; color:white;"  value="전문보기" >
	   <br/>
	   
	    <input type="checkbox" name="agree2" value="">개인정보 수집 및 이용동의(필수)
	   <input id="agree2" type="button" onclick="'" style="width:90pt;height:26pt; color:white;"  value="전문보기" >
	   <br/><br/>
	   
	   <div class="g-recaptcha" data-sitekey="6Lcx99EUAAAAADM8yS6PteMU1ubh5MIRkpplKUUg"></div>
	</form>
   
   <button id="join" type="button" onclick="fnSubmit();">회원가입</button>
   <button id="cancel" type="button" onclick="javascript: window.location.href='/member_main.jsp'">취소</button>























</body>
</html>