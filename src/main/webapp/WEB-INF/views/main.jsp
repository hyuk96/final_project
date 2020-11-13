<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
   integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
   src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=a6023c843a9b88434db16e026e599e23"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가살기좋은동네</title>
<style>
button{
	display: inline-block;
}

#area {
   position: absolute;
   top: -10px;
}

#map {
   position: fixed;
   width: 101%;
}

.login {
   position: fixed;
   top: 33px;
   right: 60px;
}

a:link {
   color: rgb(0, 0, 0);
   text-decoration: none;
}

a:visited {
   color: black;
   text-decoration: none;
}

a:hover {
   color: rgb(0, 0, 0);
   text-decoration: underline;
   font-weight: bold;
}

.main-bar {
   position: fixed;
   width: 420px;
   height: 1265px;
   border-collapse: collapse;
   left: -10px;
   top: -10px;
   margin-left: 10px;
   margin-top: 10px;
   padding: 0;
}

.side-bar {
   right: 30px;
   top: 65px;
   border-radius: 15px;
   box-shadow: 0 0 5px 0 rgba(0, 0, 0, .2), 0px 0 15px 0 rgba(0, 0, 0, .1);
   width: 410px;
   height: 895px;
   border-collapse: collapse;
   margin: 0;
   padding: 0;
   position: fixed;
}

.logo {
   background-color: #a7cdda;
   width: 420px;
   height: 50px;
   text-align: center;
}

.search {
   position: relative;
   background-color: #a7cdda;
   width: 420px;
   height: 50px;
   text-align: center;
   
}

#srch {
   width: 340px;
   height: 46px;
   border: none;
   outline-style: none;
   border-radius: 5px;
   transition: 0.2s;
}

#srch:focus{
	border-radius: 7px;
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, .2), 0px 0 15px 0 rgba(0, 0, 0, .1);
}

#srch:hover: {
	border: none;
}

#srch_btn {
   position: absolute;
   width: 50px;
   right: 43px;
   height: 46px;
   background-color: transparent;
   border: none;
   color: #bbbbf9;
}

.recommend {
   position: relative;
   background-color: #a7cdda;
   width: 420px;
   height: 65px;
   text-align: center;
}

.rcmd_btn {
   margin-top: 12px;
   background-color: transparent;
   color: white;
   border: none;
   width: 64px;
	height: 40px;
   font-size: 14px;
   -webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	border-radius: 7px;
}

.rcmd_btn:focus {
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, .2), 0px 0 15px 0 rgba(0, 0, 0, .1);
}

.rcmd_btn:hover {
   background-color: #ffffff;
   color: #a7cdda;
}

.issues {
   position: relative;
   background-color: white;
   width: 420px;
   height: 620px;
   text-align: center;
}

.text-mining {
   position: relative;
   background-color: white;
   padding: 10px;
   width: 420px;
   height: 200px;
   text-align: center;
}

.detail {
   position: relative;
   background-color: white;
   border-radius: 15px 15px 0px 0px;
   padding: 10px 5px 0px 5px;
   width: 410px;
   height: 200px;
   text-align: center;
   border-bottom: 1px solid #f2f2f2;
}

.comment {
   position: relative;
   background-color: white;
   border-radius: 0px 0px 15px 15px;
   width: 410px;
   height: 665px;
   padding: 0px 5px 10px 5px;
   text-align: center;
}

.ranking {
   z-index: -1;
   position: fixed;
   background-color: #e8e8e8;
   border-radius: 15px;
   width: 410px;
   height: 315px;
   right: 30px;
   bottom: 9px;
   text-align: center;
   padding: 10px 5px 10px 5px;
   position: fixed;
}

#rank {
   width: 40%;
   height: 500px;
   margin-left: 20%
}

#Grank {
   width: 40%;
   height: 500px;
   margin-left: 20%;
}

.rankTitle {
   border: 1px solid black;
   margin-left: 20%;
   width: 40%;
   height: 50px;
   font-size: 30px;
   background-color: gray;
   color: white;
   text-align: center;
}

#score {
   width: 20%;
   border-radius: 5px;
   margin-left: 20%;
}

#Iscore {
   width: 20%;
   border-radius: 5px;
}

#reply {
   	width: -webkit-fill-available;
   	height: 50px;
   	outline-style: none;
   	border: none;
}

#reply_btn {
   position: absolute;
   width: 50px;
   right: 8px;
   height: 39px;
   background-color: transparent;
   border: none;
   color: #bbbbf9;
}

#del_btn{
   background-color: transparent;
   border: none;
   color: #d84f4f;
   font-size: 8pt;
}

#reply_area {
   position: absolute;
   top: 0px;
   background-color: smokewhite;
   width:400px; 
   height:555px;
}

.reply_table{
	width: 363px;
}

::-webkit-scrollbar {
	width: 7px;  /* 세로축 스크롤바 길이 */
}

::-webkit-scrollbar-thumb {
    background-color: #a7cdda;
    border-radius: 3px;
}


</style>
</head>
<body>
   <div id="area">
      <!--* 지도 API *-->
      <div id="map" style="width: 100%; height: 101.5%; left: 0px;"></div>
   </div>

   <!--* 로그인, 회원가입 *-->
   <div class="login"
      style="width: -webkit-fill-available; text-align: right; font-size: 14px;">
      <a href="loginform"  class = "lf" style="display:block">로그인</a>&nbsp; <a href="mypage"  id ="mp" style="display:none">마이페이지</a>&nbsp; <a href="join" class = "lf" style="display:block">회원가입</a>
   </div>

   <!--* 메인 정보바 *-->
   <div class="main-bar">
      <!--* 상단 로고 *-->
      <div class="logo">
         <a href="main"><img src="resources/img/logo.png"
            style="height: 50%;"></a>
      </div>

      <!--검색-->
      <div class="search">
         <!-- 엔터시 검색 기능 구현 예정* -->
         <input id="srch" name="srch" type="text"
            placeholder="병원, 공원, 아파트, 지하철" name="#"
            onkeypress="if( event.keyCode == 13 ){searchData();}" autofocus>
         <button id="srch_btn" value="게시" name = "">게시</button>
      </div>


      <!--주변 추천 바-->
      <div class="recommend">
         <button class="rcmd_btn">집</button>
         <button class="rcmd_btn">공원</button>
         <button class="rcmd_btn">지하철</button>
         <button class="rcmd_btn">버스</button>
         <button class="rcmd_btn">병원</button>
      </div>

      <!--이슈 바
      <div class="issues">
         이슈 바<br>
      </div>
      -->

      <!--텍스트마이닝
      <div class="text-mining">
         텍스트마이닝<br> - 담당: 영민
      </div>
      -->
   </div>

   <!--* 사이드 바 *-->
   <div class="side-bar">
		<!-- 상세정보 -->
		<div class="detail">
			상세정보<br> - 담당: 현일<br> - 숨겨놓기
		</div>

		<!-- 상세정보 -->
		<div class="comment">
	      	<div style="height:50px; border-bottom: 1px solid #f2f2f2; font-size: 14pt; font-weight: bold; padding-top: 10px; width: -webkit-fill-available;">댓글</div>
	      	
	      	<div class="reply_area">
	      		<div id="" style="overflow-y: scroll; width: 400px; height: 535px; text-align: left; padding: 20px 15px 10px;">
		      		<c:forEach items="${replylist}" var="dto">
			      		<table class = "reviewp" style="border-bottom: 1px solid #f2f2f2; min-height: 150px">
			      			<tbody id = "newlist">
			      			<tr class="reply_table">
			      				<td style="width: 333px; height: 30px;">
			      					<b>${dto.hrnickname}</b>
			      				</td>
			      				<td style="width: 30px;">
			      					<input id="del_btn" type="button" onclick="replydel()" value="삭제"/>
			      				</td>
			      			</tr>
							<tr class="reply_table">
			      				<td colspan="2" style="font-size: 8pt; height: 20px;">
			      					${dto.hrdate}
			      				</td>
			      			</tr>
			      			<tr class="reply_table">
			      				<td colspan="2" style="vertical-align:top; padding-top: 10px;">
			      					${dto.hrcontent}
			      				</td>
			      			</tr>
							</tbody>
						</table>
					</c:forEach>
				</div>
	      	</div>
	      	
	      	<div style="height:30px; border-bottom: 1px solid #f2f2f2; border-top: 1px solid #f2f2f2;">
    			<button onclick="page('-')"><</button><button onclick="page('+')">></button>
	      	</div>
	      	
	      	<div style="height:50px;">
	      		<form action="replyadd">
				<input id="reply" type="text" placeholder="${name} (으)로 댓글 달기..." name="text">
					<button id="reply_btn" value="게시" name="writer"">게시</button>
				</form>
	      	</div>
      </div>

      <!--구별 랭킹-->
      <div class="ranking">
         <table class="rankMain">
            <thead>
               <tr>
                  <div class="rankTitle">랭킹</div>
               </tr>
               <tr>
                  <button id="score">아파트 가격</button>
                  <button id="Iscore">구별 점수</button>
               </tr>
            </thead>
            <tbody>
               <table class="table table-dark" id="rank">
                  <thead>
                     <tr>
                        <th scope="col">등수</th>
                        <th scope="col">아파트</th>
                        <th scope="col">점수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                     </tr>
                     <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                     </tr>
                     <tr>
                        <th scope="row">3</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                     </tr>
                     <tr>
                        <th scope="row">4</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                     </tr>
                     <tr>
                        <th scope="row">5</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                     </tr>
                  </tbody>
               </table>

               <table class="table table-dark" id="Grank">
                  <thead>
                     <tr>
                        <th scope="col">구 이름</th>
                        <th scope="col">점수</th>
                        <th scope="col">rank</th>
                     </tr>
                  </thead>

                  <tbody>
                     <c:forEach items="${ranker}" var="dto">
                        <tr>
                           <td>${dto.sname}</td>
                           <td>${dto.total}</td>
                           <td id="score">1</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </tbody>
         </table>
      </div>
   </div>
</body>
<script>

	var idx = ${idx};
	console.log(idx);
	if(idx != null){
		$('.lf').hide();
		$('#mp').show();
	}
	
	var z = 1;
	function page(e) {
		var str ="";
		$('.reply_table').remove();
		console.log(e);
		var p = '+';
		if(e==p){
			z++;
			console.log(z);
		}else{
			z--;
			console.log("감소 : "+z);
			if(z==0){
				z++;
				console.log("확인 :" + z);
			}
		}
		$.ajax({
			type:'get',
			url:"replypage",
			dataType:'json',
			data:{"page":z},
			success:function(d){
				console.log("성공"+d);
				console.log(d);

				
				for(var i = 0; i <d.com.length; i++){
					console.log(d.com[i]);
					str += '<table style="border-bottom: 1px solid #f2f2f2; min-height: 150px">';
	      			str += ' <tr class="reply_table"><td style="width: 333px; height: 30px;"><b>'+d.com[i].hrnickname+'</b></td>';
	      			str += '<td style="width: 30px;"><input id="del_btn" type="button" onclick="replydel('+d.com[i].hridx+')" value="삭제"/></td></tr>';
	      			str += '<tr class="reply_table"><td colspan="2" style="font-size: 8pt; height: 20px;">'+d.com[i].hrdate+'</td></tr>';
	      			str += '<tr class="reply_table"><td colspan="2" style="vertical-align:top; padding-top: 10px;">'+d.com[i].hrcontent+'</td></tr>';
	      			str += '</table>';
	      			console.log(i);
				}
				$('#newlist').append(str);
				if(d.com.length != 5){
					z--;
				}
				
			},error:function(e){
				console.log("에러"+e);
			}
		});
		
	}
	
	
	// 글 등록
	function reply_btn(){
		console.log("이벤트 확인");	
		var z = $('#reply').val();
		console.log(z);
		$.ajax({
			type:'get',
			url:"replyadd",
			dataType:'json',
			data:{"key":z},
			success:function(d){
				console.log(d);
				$('#reply').val("");
			},error:function(e){
				console.log(e);
				$('#reply').val("");
			}
		});

		
	}
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = { 
           center: new kakao.maps.LatLng(37.566288, 126.977945), // 지도의 중심좌표
           level: 8 // 지도의 확대 레벨
       };
   
   // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
   var map = new kakao.maps.Map(mapContainer, mapOption);
   
   $.getJSON("resources/SJEO.geojson", function(geojson){
       var data = geojson.features;
       var coordinates = [];
       var name = '';
       $.each(data,function(index,val){
           coordinates = val.geometry.coordinates;
           name = val.properties.SIG_KOR_NM;
           displayArea(coordinates,name);
       });
   });
   
   var polygons = [];
   
   function displayArea(coordinates, name) {
       var path =[];
       var points =[];
   
   
       $.each(coordinates[0], function(index, coordinate) {
               var point = new Object();
           for (var i = 0; i < coordinate.length; i++) {
               point = {};
               point.x = coordinate[i][1];
               point.y = coordinate[i][0];
               points.push(point);
               path.push(new kakao.maps.LatLng(coordinate[i][1], coordinate[i][0]));
           }
           //customOverlay.setContent(name);
           //customOverlay.setPosition(centroid(points));
           //customOverlay.setMap(map);
       })
       var content = '<h4>'+name+'</h4>';
       var p = centroid(points); 
   
       var customOverlay = new kakao.maps.CustomOverlay({
           position: centroid(points),
           content: content
       }); 
       customOverlay.setMap(map)
   
       var polygon = new kakao.maps.Polygon({
           map: map,
           path: path,
           strokeWeight: 2,
           strokeColor: '#004c80',
           strokeOpacity: 0.8,
           fillColor: '#fff',
           fillOpacity: 0.7
       });
   
       polygons.push(polygon);
       
   
       kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent){
           polygon.setOptions({
               fillColor : '#09f'
           });
           //customOverlay.setPosition(mouseEvent.latLng);
           customOverlay.setMap(map);
       });
   
       kakao.maps.event.addListener(polygon,'mouseout',function(){
           polygon.setOptions({
               fillColor : '#fff'
           });
           customOverlay.setMap(map);
       });
   
       kakao.maps.event.addListener(polygon,'click',function(){
           var level = map.getLevel()-3;
   
           map.setLevel(level, {anchor: centroid(points), animate: {
               duration: 350
           }});
           $('.area').hide();
           deletePolygon(polygons);
       });
   }
   
   function centroid(ps){
       var i, j, len, p1, p2, f, area, x, y;
       area = x = y = 0;
   
       for(i=0, len=ps.length, j=len-1; i<len; j=i++){
           p1=ps[i];
           p2=ps[j];
           f=p1.y * p2.x-p2.y * p1.x;
           x += (p1.x + p2.x) * f;
           y += (p1.y + p2.y) * f;
           area += f * 3;
   
       }
       return new kakao.maps.LatLng(x/area, y/area);
   }
   
   function deletePolygon(polygons){
       for(var i = 0; i < polygons.length; i++){
           polygons[i].setMap(null);
       }
       polygons = [];
   }
   /* 검색 */
   $(function () {
   //Block Enter key events . 엔터키 이벤트 막기.
   $(document).keypress(function (e) {
      if (e.keyCode == 13) e.preventDefault();
   });
   //Click the Search button when you press Enter in the search TextBox. 검색 TextBox에서 Enter 키를 누를 때 검색 버튼을 클릭.
   $('#srch').keypress(function (e) {
      var key = e.which;
      if(key == 13){  // the enter key code
         $('input[name = srch]').click();
         return false;  
         }
      });
   });
   
   /* 댓글 
   function replyupdate(){
      location.href="updateForm?idx="+${content.idx};
   }
   
   
   function replydel(idx){
      location.href="replydelete?idx="+${content.idx};
   }
   */
   
   
   /* 랭킹 */
   $(document).ready(function(){
           $("#score").click(function(){
               $("#rank").toggle(500,function(){
                   //alert("toggle 완료");
                   console.log("score 완료");
                   console.log($("#score").html());
                   console.log($("#Grank").css("display"));
   
                   if($("#score").html() == "아파트 가격"){
                       $("#score").html("아파트 가격")
                   }else{
                       $("#score").html("아파트 가격")
                   }
               });
           });
   
           $("#Iscore").click(function(){
               $("#Grank").toggle(500,function(){
                   //alert("toggle 완료");
                   console.log("Iscore 완료");
                   console.log($("#Iscore").html());
                   console.log($("#Grank").css("display"));
   
                   if($("#Iscore").html() == "구별 점수"){
                       $("#Iscore").html("구별 점수")
                   }else{
                       $("#Iscore").html("구별 점수")
                   }
               });
           });
   
           $("#Iscore").click(function(){
               $("#rank").fadeOut("fast");
           });
   
           $("#score").click(function(){
               $("#Grank").fadeOut("fast");
           });
       });
</script>
</html>