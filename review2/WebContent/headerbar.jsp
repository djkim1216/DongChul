<%@page import="com.trip.dto.member.MemberLoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/loginheader.css">
<link rel="stylesheet" type="text/css" href="css/loginForm.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="js/loginForm.js"></script>	
<script type="text/javascript">

	function submit(){
		$("#searchForm").attr("action", "SearchServlet");
		$("#searchForm").submit();
	}

	function goToLoginForm(){
		var url = "page?page=login"; //로그인 페이지 샘플 (보통은 /서블릿 액션명 을 넣는다)
		var popupName = "login"; //popup에 고유한 이름을 부여한다. 이름이 같은 팝업이 열릴때는 브라우저가 인식해서 중복팝업이 발생 시키지 않게 한다.
		var popupSetting = "width=500, height=700, menubar=no, status=no, toolbar=no"; //팝업이 열리는 시점에 세팅을 하는 곳
		window.open(url, popupName, popupSetting);
	}
	
	//로그인 화면에서 유저정보 return
	function fnLoginSuccess(data){
		$('#loginFormBox').remove();
		$('#loginBak').remove();
		$("header").after(data);
		$('#usernotlogin').remove();
		$('#userlogin').show();
		$('#alarmbtn').show();
		$('#loginIdbar').text(data.m_nick);
		window.location.reload();
		console.log(data.m_nick);
	}
	
	function fnalarmCount(data){
		$('#alarmCount').text(data);
		console.log(data);
	}
	
	function logout(){
		$.ajax({
			type:'post',
			url : 'logout',
			dataType : 'json',
			success : function(data){
				if(!data.result){
					return alert("로그인에 실패했습니다.");
				}
				alert("로그아웃 되었습니다.");
				$('#userlogin').hide();
				$('#usernotlogin').show();
				$('#alarmbtn').hide();
				onClickidmenuBtn();
				var logBtn = `<div id="usernotlogin"  style="width : 45%; height : 40px; margin-left:10px; margin-top:9px; float:left;"><a href="#" onclick = "goToLoginForm();">로 그 인</a></div>`;
				$('div.loginimg').after(logBtn);
				window.location.reload();
			}
		})
	}


	var num = 1;
		$(function(){
				var eventCon = function(){
					$.ajax({
					type : 'post',
					url : 'TripEvent.do',
					dataType : 'json',
					success : function(msg) {
						var eventObj = msg;
						console.log(eventObj);
						
						var selectEvent = (function(i){
							var len = eventObj.response.body.items.item.length;	
							if(i === len){
								num = 0;
								return;
							}
							
							
							function parse(str) {		
							    var y = str.substr(0, 4);
							    var m = str.substr(4, 2);
							    var d = str.substr(6, 2);
							    return new Date(y,m-1,d);
							}
							
							Date.prototype.format = function(f) {
								if (!this.valueOf()) return " ";

								var weekName = ["일", "월", "화", "수", "목", "금", "토"];
								var d = this;
								
								return f.replace(/(yyyy|MM|dd|E|)/gi, function($1) {
									switch ($1) {
										case "yyyy": return d.getFullYear();
										case "MM": return (d.getMonth() + 1).zf(2);
										case "dd": return d.getDate().zf(2);
										case "E": return weekName[d.getDay()];
										default: return $1;
									}
								});
							};

							String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
 							String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
 							Number.prototype.zf = function(len){return this.toString().zf(len);};

							var eventstartdate = eventObj.response.body.items.item[i].eventstartdate+"";
							//console.log(parse(eventstartdate).format("yyyy.MM.dd(E)"));
							$("#eventstartdate").text(parse(eventstartdate).format("yyyy.MM.dd(E)"));
							
							var eventenddate = eventObj.response.body.items.item[i].eventenddate+"";
							
							$("#eventenddate").text(parse(eventenddate).format("yyyy.MM.dd(E)"));
							
							var addr1 = eventObj.response.body.items.item[i].addr1;
							var split = addr1.split(" ");
							$("#addr1").text(split[0]+" "+split[1]+" "+split[2]);
							
							
							var title = eventObj.response.body.items.item[i].title;
							var titleDiv = "<div class='titleCheck' style='margin-left:10px;display:inline-block;'>&#187;<div class='second' id='title'/>"+ title +"</div></div>";
							$("div.titleCheck").remove();
							$("#addr1").after(titleDiv);
							
							
						});
						selectEvent(0);
						
						
						
						setInterval(function(){
							selectEvent(num);
							num++;
							
							  
						},3000);
					}
				});
			}();
		});
		
		var alarmBtnCheck = false; //알람리스트 show/hide key
//	 	카테고리면 알람 코멘트
		function cateFilter(cate){
			var str = "";
			if(cate == 0 ){
				str = "시스템 메세지가 있습니다.";
			} else if(cate == 1){
				str = "새로운 이벤트가 있습니다.";
			} else if(cate == 2){
				str = "작성하신 리뷰에 댓글이 달렸습니다.";
			} else if(cate == 3){
				str = "작성하신 여행 후기에 댓글이 달렸습니다.";
			}
			return str;
		}
		
		function onClickAlarmListItem(item, al_no){		//클릭된 알람리스트 삭제 및 페이지이동
			$(item).closest("li").remove();		//item에서 제일 가까운 li 삭제
			$.ajax({
				type : 'get',
				data : { "al_no" :  al_no},		//업데이트 할 알람번호 전달
				url : 'AlarmUpdate',			//aflag N->Y 업데이트 
				success : function() {			
					onClickAlarmBtn();
				},error:function(request,status,error){
					alert("code="+request.status+"message="+request.responseText+"error="+error);
				}
			});
			
		}	
		
		function dateFilter(date){			//알람기능 날짜 포맷
//	 		var today = new Date();
//	 		var dd = today.getDate();
//	 		var mm = today.getMonth()+1;
//	 		var yyyy = today.getFullYear();
		
			var year = date.year+1900;
			var month = date.month+1;
			var day = date.date;
			
			var hours = date.hours;
			var min = date.minutes;
			var sec = date.seconds;
			
			return year+"."+month+"."+day;
			
			
		}

		function onClickAlarmBtn() {
			if(!alarmBtnCheck){
//	 			리스트 생성
				$.ajax({
					type : 'get',
					url : 'AlarmList',
					dataType:"json",
					success : function(msg) {
						var dtolist = new Array();
						var html = "";
						
						for(var i=0;i<msg.dtoList.length; i++){
							dtolist[i] = msg.dtoList[i];
							
							html += "<li id='alarmListItem"+i+"'>" 
									+ dateFilter(dtolist[i].al_date) +
									" <a href='#'onclick='onClickAlarmListItem(alarmListItem" + i + ", "+dtolist[i].al_no+");'>" + cateFilter(dtolist[i].al_cate) + 
									"</a></li>"
									
									//console.log(dtolist[i]);
						} 
						$("#ulList").html(html);	//알람 ul태그에 ajax에서 추가한 li태그를 담은 html 출력
						
					},
					error:function(request,status,error){
						alert("code="+request.status+"message="+request.responseText+"error="+error);
					}
				});
				$("#alarmList").show();
				alarmBtnCheck = true;
				
			} else {		
//				카운트 재호출(최신화) 및 alarmList hide
				$.ajax({
					type : 'get',
					url : 'AlarmCount',
					dataType:"json",
					success : function(msg) {
						var alarmcount = msg.alarmCount;
						$("#alarmCount").text(alarmcount);
						
					},error:function(request,status,error){
						alert("code="+request.status+"message="+request.responseText+"error="+error);
					}
				});
				$("#alarmList").hide();
				alarmBtnCheck = false;
			}
		}
		
		var idmenuBtnCheck = false;
		function onClickidmenuBtn(){	//id메뉴바 show/hide
			if(!idmenuBtnCheck){
				$("#hide").show();
				idmenuBtnCheck = true;
			} else {
				$("#hide").hide();
				idmenuBtnCheck = false;
			}
		}
		
		
</script>
	<header> 
		<div class="firstline">
			<div class="firstparagraph1">
				<div class="inline" id="homeimg">
					
				</div>
				<div class="inline" id="home">	
					<a href="TripReviewView">돈   독</a>
				</div>
				<div class="inline" id="menubar">
					<ul>
						<li id="menubarimg"><a><img alt="menu" src="img/mainheader/menubar.jpg"
								style="width: 40px; height: 40px;"></a>
							<ul id="menuUl">
								<li class="subtitle"><a href="PageMoveServlet?command=schedule">&nbsp;일정관리</a>
									<ul class="subUl">
										<li><a href="PageMoveServlet?command=scheduleCheck">&nbsp;&nbsp;일정조회</a></li>
										<li><a href="PageMoveServlet?command=scheduleView">&nbsp;&nbsp;일정보기</a></li>
										<li><a href="TeamMemberController?command=createTeam">&nbsp;&nbsp;일정등록</a></li>
									</ul>
								</li>
								<li class="subtitle"><a href="PageMoveServlet?command=review">&nbsp;여행후기</a>
									<ul class="subUl">
										<li><a href="RestaurantReviewList">&nbsp;&nbsp;맛집후기</a></li>
										<li><a href="TouristReviewList">&nbsp;&nbsp;명소후기</a></li>
										<li><a href="RoomsReviewList">&nbsp;&nbsp;숙소후기</a></li>
									</ul></li>
								<li class="subtitle"><a href="PageMoveServlet?command=shareAlbum">&nbsp;앨범공유</a></li>
								<li class="subtitle"><a href="PageMoveServlet?command=shareSchedule">&nbsp;일정공유</a></li>
							</ul>
						</li>
					</ul>
				</div>
				
			</div>
			<span class="linebar">  |</span>
			<div class="firstcen">
				<div class="whatbtn">
					<a >
						<img alt="what" src="img/mainheader/what.png" style="width: 40px; height: 40px;">
					</a>
				</div>
				<span class="minibar">|</span>
				<input id = "search" type="text" name="search" placeholder="무엇을 찾으십니까?" />
			</div>                             
			<div class="firstparagraph3">
				<div id="searchbtn">
 					<a class="img-button" href="#" onclick="return submit();" title="검색"><img alt="search" src="img/mainheader/search.jpg" style="width: 40px; height: 40px;">
 					</a>
				</div>
				<div class="login">
					<span class="linebar"> | </span>
						<div class="loginimg"></div>
						<c:if test="${empty user}">
						<div id="usernotlogin"  style="width : 45%; height : 40px; margin-left:10px; margin-top:9px; float:left;"><a href="#" onclick = "goToLoginForm();">로 그 인</a></div>
						</c:if>
						<c:if test="${not empty user}">
						<div id="userlogin" style="display : block; width : 45%; height : 40px; margin-left:10px; margin-top:9px; float:left;">
						</c:if>
						<c:if test="${empty user}">
						<div id="userlogin" style="display : none; width : 45%; height : 40px; margin-left:10px; margin-top:9px; float:left;">
						</c:if>
							<ul>
								<li class="idmenu">
								<c:if test="${not empty user}">
									<a id = "loginIdbar" href="javascript:onClickidmenuBtn();">${user.m_nick}</a> 
								</c:if>
								<c:if test="${empty user}">
									<a id = "loginIdbar" href="javascript:onClickidmenuBtn();"></a> 
								</c:if>
										<ul id="hide" style="display:none; margin-top: 19px; position: relative; z-index: 99; margin-left: -105px; background-color:white; width:150px; font-size:medium;">
											<li><a href="#">개인 정보 수정</a></li>
											<li><a >작성 글 조회</a></li>
											<li><a>등록 스크랩 조회</a></li>
											<li><a>알림 조회</a></li>
											<li><a href="#" onclick="return logout()">로그아웃</a></li>
										</ul>
								</li>
							</ul>
						</div>
					<span class="linebar"> | </span>
				</div>
				<c:if test="${empty user}">
				<div id="alarmbtn" style= "position: absolute; display: none;">
				</c:if>
				<c:if test="${not empty user}">
				<div id="alarmbtn" style= "position: absolute; display: inline-block;">
				</c:if>
					<a href="javascript:onClickAlarmBtn();" title="알림"><img alt="alarm" src="img/mainheader/alarm.png" style="width: 40px; height: 40px;">
						<span id="alarmCount" style="position: absolute; margin-left: -13px; margin-top: 20px;">${alarmCount}</span>
					</a>
					<div id="alarmList" style="display: none; width: 300px; position: absolute; margin-top: 5px; margin-left: -200px; z-index: 80; background-color: white; font-size:smaller;">
						<ul id="ulList">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="secondline">
			 <div id = "secondcenter">
				[<div class="second" id="date">
					<span id= "eventstartdate"></span>~<span id="eventenddate"></span>
				</div>]  
				<div class="second" id="text_bar">|</div> 
				<div class="second" id="addr1" /></div>
			</div>
		</div>
		
	</header>