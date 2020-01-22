<%@page import="trip.dto.LocationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커에 이벤트 등록하기2</title>
    
</head>
<body>
<h1>일정 등록</h1>
    <h2>3단계 : 숙소 정하기</h2><button onclick="location.href='TeamMemberController?command=setRoom_vote_res'">루트정하기▶</button>
 마커 클릭 시 상세 보기 페이지가 열립니다!  
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=546aea18ae9a6bd31c67526ce6764169"></script>
<script>
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new kakao.maps.LatLng(37.5401065310004, 127.213179314442), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
	 <%
	 	String days=(String)request.getAttribute("days");
		
	    List<LocationDto> loc_rooms_list=(List<LocationDto>)request.getAttribute("loc_rooms_list");
	   for(int i=0;i<loc_rooms_list.size();i++){
	   %>
	   {
		   id: '<%=loc_rooms_list.get(i).getLoc_id()%>',
	       title: '<%=loc_rooms_list.get(i).getLoc_name()%>', 
	       url:'<%=loc_rooms_list.get(i).getLoc_url()%>', 
	       latlng: new kakao.maps.LatLng(<%=loc_rooms_list.get(i).getLoc_y()%>, <%=loc_rooms_list.get(i).getLoc_x()%>)
	   },
	   <%
	   }
	   %>
];
// 지도 위에 마커를 표시합니다
for (var i = 0;i < positions.length; i++) {
 // 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(24, 35); 
	// 마커 이미지를 생성합니다    
	var normalImage = new kakao.maps.MarkerImage("http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", imageSize);  

    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: positions[i].latlng,
        image: normalImage
    });
    markers.push(marker); // 배열에 생성된 마커를 추가합니다
    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
    	content: positions[i].title // 인포윈도우에 표시할 내용
    });
 // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    kakao.maps.event.addListener(marker, 'click',makeClickistener(positions[i].url));
}


function makeClickistener(url) {
    return function() {
    	 window.open(url);
    };
}
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}
// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}


function change_day(day){	
	$.ajax({
		url : "TeamMemberController?command=setRooms_bnt",
		type : 'post',
		data : {"loc_day":day},
		dataType: "json",
		success : function(data) {
			console.log(data);
			
			removeMarker();
			var positions = [];
			for(var i=0;i<Object.keys(data).length;i++){
			var room={
					 id:data['room'+i].id,
				       title:data['room'+i].title, 
				       url:data['room'+i].url, 
				       latlng: new kakao.maps.LatLng(data['room'+i].y, data['room'+i].x)
				  
			};
			positions.push(room);
			}
			// 지도 위에 마커를 표시합니다
			for (var i = 0;i < positions.length; i++) {
			 // 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(24, 35); 
				// 마커 이미지를 생성합니다    
				var normalImage = new kakao.maps.MarkerImage("http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", imageSize);  

			    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: positions[i].latlng,
			        image: normalImage
			    });
			    markers.push(marker); // 배열에 생성된 마커를 추가합니다
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			    	content: positions[i].title // 인포윈도우에 표시할 내용
			    });
			
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    kakao.maps.event.addListener(marker, 'click',makeClickistener(positions[i].url));
			}
			 var poll = document.querySelector('#poll');
			 
			 html = '';
		        for (var i = 0; i < Object.keys(data).length; i++) {
		            html += '<tr><td>';
		            if(data['room'+i].id==data['room'+i].vote){
		            html+='<input type="radio"  checked="checked" onchange="handleChange('+day+',this.value);" name="poll_'+day+'" value="'+data['room'+i].id+'">';
		            }else{
		            html+='<input type="radio" onchange="handleChange('+day+',this.value);" name="poll_'+day+'" value="'+data['room'+i].id+'">';    	
		            }
		            html+=data['room'+i].title+
		            '</td><td>';
		        }       
		        poll.innerHTML = html;
		},
		error : function() {
			alert("통신오류");
		}
	});
}


// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
   for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
   }
   markers = [];
}
function handleChange(day,id){
	$.ajax({
		url : "TeamMemberController?command=setRooms_vote",
		type : 'post',
		data : {"loc_day":day,
				"loc_id":id,
				"loc_tid":1
				},
		success : function(data) {
			alert("투표 완료!");
		},
		error : function() {
			alert("통신오류");
		}
	});
}
</script>
<%
		int vote_id=(int)request.getAttribute("vote_id");
		for (int i = 1; i <= Integer.parseInt(days); i++) {
	%>
	<button id="bnt_<%=i %>" onclick='change_day(this.value);' value=<%=i %>>
	<%=i%>일차
	</button>
	<%
		}
	%>

		<table  id="poll">
			<%
				for (int i = 0; i < loc_rooms_list.size(); i++) {
			%>
			<tr>
				<td>
				<%
				if(vote_id==loc_rooms_list.get(i).getLoc_id()){ 
					%>
					<input type="radio" checked="checked" onchange="handleChange(1,this.value);" name="poll_1" value="<%=loc_rooms_list.get(i).getLoc_id()%>">
					<%=loc_rooms_list.get(i).getLoc_name()%>
					<%
					}else{
					%>
					<input type="radio" onchange="handleChange(1,this.value);" name="poll_1" value="<%=loc_rooms_list.get(i).getLoc_id()%>">
					<%=loc_rooms_list.get(i).getLoc_name()%>	
					<%	
					}
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	
</body>
