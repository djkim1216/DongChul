<%@page import="trip.dto.LocationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여러개 마커 표시하기</title>

</head>
<body>
	<h1>일정 등록</h1>
	<h2>4단계 : 루트 정하기</h2>
	<button onclick="location.href='TeamMemberController?command=payment'">입금하기▶</button>

	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=546aea18ae9a6bd31c67526ce6764169"></script>
	<script>
var markers = [];
var polyline;
var selected_latlng=[];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
<%String days=(String)request.getAttribute("days");
System.out.println(days);
List<LocationDto> loc_list = (List<LocationDto>) request.getAttribute("loc_list");%>
// 마커를 표시할 위치와 title 객체 배열입니다 
var res_positions=[],att_positions=[];
	
	<%for (int i = 0; i < loc_list.size(); i++) {%>
	var positions= {
		   id: '<%=loc_list.get(i).getLoc_id()%>',
	       url: '<%=loc_list.get(i).getLoc_url()%>', 
	       title: '<%=loc_list.get(i).getLoc_name()%>', 
	       latlng: new kakao.maps.LatLng(<%=loc_list.get(i).getLoc_y()%>, <%=loc_list.get(i).getLoc_x()%>)
	   };
	<%if (loc_list.get(i).getLoc_cate() == 2) {%>
	   res_positions.push(positions);
	   <%} else if (loc_list.get(i).getLoc_cate() == 3) {%>
	   att_positions.push(positions);
		<%}
			}%>


// 마커 이미지의 이미지 주소입니다
var res_imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
var att_imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png"; 

display(res_positions,res_imageSrc);
display(att_positions,att_imageSrc);

function display(positions,imgSrc){	
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imgSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    markers.push(marker);
    var infowindow = new kakao.maps.InfoWindow({
    	content: positions[i].title // 인포윈도우에 표시할 내용
    });
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    kakao.maps.event.addListener(marker, 'click', makeClickListener(positions[i],selected_latlng));
}
}

function makeClickListener(position,selected_latlng) {
	return function() {
		selected_latlng.push(position.latlng);
		
		if(selected_latlng[selected_latlng.length-1]==selected_latlng[selected_latlng.length-2]){
			selected_latlng.pop();
		}
		console.log('선택된 위치 배열='+selected_latlng);
		if(selected_latlng.length!=1){
		 polyline = new daum.maps.Polyline({
			map : map, //지도객체
			path : [selected_latlng], //좌표배열
			strokeOpacity: 0.8,
			strokeStyle: 'solid'
			});
		}
   };
}
//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
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
		url : "TeamMemberController?command=setRoute_bnt",
		type : 'post',
		data : {"loc_day":day},
		dataType: "json",
		success : function(data) {
			removeMarker();
			
			var res_positions = [],att_positions = [];
			
			for(var i=0;i<Object.keys(data).length;i++){
			var room={
					 id:data['room'+i].id,
				       title:data['room'+i].title, 
				       url:data['room'+i].url, 
				       latlng: new kakao.maps.LatLng(data['room'+i].y, data['room'+i].x)
			};
			
			if(data['room'+i].cate==2){
				res_positions.push(room);
			}else if(data['room'+i].cate==3){
				att_positions.push(room);
			}
			}
			// 마커 이미지의 이미지 주소입니다
			var res_imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			var att_imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png"; 
			 
			display(res_positions,res_imageSrc);
			display(att_positions,att_imageSrc);
		},
		error : function() {
			alert("통신오류");
		}
	});
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
for (var i = 0; i < markers.length; i++) {
   markers[i].setMap(null);
}
markers = []; 
}
</script>
	<%
		for (int i = 1; i <= Integer.parseInt(days); i++) {
	%>
	<button onclick='change_day(this.value);' value=<%=i%>>
	<%=i %>일차
	</button>
	<%
		}
	%>
</body>
</html>