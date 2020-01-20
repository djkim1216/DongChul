<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
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
   
   #c{
      background-color: red;
   }
   
   #b{    margin-left: 120px;
         background-color: red;
         border-radius: 10px 10px 10px 10px;   
         width:150pt;
         height:26pt; 
         color:white;"
      }
      #d{
         background-color: #3383c4;
         
         margin-left: 10px;
         
         border-radius: 10px 10px 10px 10px;   
      }
      
      #qlalf{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      #qlalf1{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      
      #qufaud{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      
      #dlapdlf{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      
      #wnth{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
      
      #wnth2{
         border-radius:10px 10px 10px 10px;
         width: 200pt;
         height: 28pt;
         background-color: #f3f3f3;
      }
   
   
   
   
   
   
   
   
   
   </style>

</head>
<body>
<!--  <input id="d" type="button" onclick="location.href='out.jsp'"
          style="width:90pt;height:26pt; color:white;"  value="회원탈퇴" > -->


   <h1>회원수정</h1>
   <hr/>
   <table >
      
   <tbody>
   <tr>
   
      <tr>
         <th id="a">아이디</th>
         <td>
         <input type="text">
            <input id="d" type="button" onclick="location.href='out.jsp'"
          style="width:90pt;height:26pt; color:white;"  value="회원탈퇴" >
         </td>
      </tr>
      
   <tr>
      <th id="a">비밀번호</th>
      <td>
         <input id="qlalf" type="password">
      </td>
      </tr>
      
      
   <tr>
      <th id="a">비밀번호 확인</th>
      
      <td>
         <input id="qlalf1" type="password">
      </td>
      </tr>
      
      <tr>
      <th id="a">이름</th>
      <td>
         <input type="text"type="text" value="배진한" style="background-color: white;" >
      </td>
      </tr>
      <tr>
      <th id="a">별명</th>
      <td>
         <input id="qufaud" type="text"type="text" value="2글자 이상 입력" style="opacity: 1" onmouseover="this.style.opacity='0.2'" onmouseout="this.style.opacity='1'" >
      </td>
      </tr>
      <tr>
      <th id="a">이메일</th>
      <td>
         <input id="dlapdlf" type="text" size="50">
      </td>
      </tr>
      <tr>
      <th id="a">주소</th>
      <td>
         <input id="wnth" type="text" size="30" style="opacity: 1" onmouseover="this.style.opacity='0.2'" 
         value="8글자 영문 대소문자 숫자 입력" style="opacity: 1" onmouseover="this.style.opacity='0.2'" onmouseout="this.style.opacity='1'"><br/>
         <input id="wnth2" type="text" size="30"
          value="상세 주소를 입력해주세요" style="opacity: 1" onmouseover="this.style.opacity='0.2'" onmouseout="this.style.opacity='1'">
      </td>
      </tr>
      </tbody>
   </table>
   <input id="b" type="button" value="수정완료" onclick="location.href='index.jsp'">

</body>
</html>