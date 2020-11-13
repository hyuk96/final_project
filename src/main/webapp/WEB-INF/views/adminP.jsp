<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <!-- 다른 자바스크립트 파일 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            #head{
                text-align: center;
            }
            #body{
                position: relative;
                top: 20%;
                left: 30%;
                height: 700px;
                width: 700px;
            }

			#mdiv{
				border: 1px solid black;
                height: 50px;
                width: 100px;
                text-align: center;
			}
			
            #m{
                
                height: 50px;
                width: 100px;
                text-align: center;
                text-decoration: none;

            }
            #b{
                border: 1px solid black;
                height: 50px;
                width: 100px;
                text-align: center;
            }
            #list{
                position: absolute;
                background-color: yellow;
                height: 500px;
                width: 500px;
                top: 30px;
                left: 150px;
            }
            table,tr{
                text-align: center;
                border: 1px solid black;
                border-collapse: collapse;
                margin: 20px 30px;
                width: 800px;
            }
            td,th{
                padding: 10px 30px;
            }
            form{
            
            }
            
            #adminlogout{
            	float: right;
            }
        </style>
    </head>
    <body>
        <div id="head"><a href="#">홈바홈바</a></div><div id="adminlogout"><a href="logout">logout</a></div>
        
        <div id="body">
            <div id="mdiv"><a href="#" id="m" onclick="membershow()">memberlist<br/></a></div>
            <a href="#" onclick="blackshow()"><div id="b">blacklist</div><br/></a>
            <div id="list">
                    <table id="ml">
                        <tr>
                            <th>회원 아이디</th>
                            <th id="long">회원 가입일</th>
                            <th colspan="2">블랙리스트 <br/>추가</th>
                        </tr>
                            <tr>
                                <td>창혁몬</td>
                                <td>2020년 10월 27일</td>
                                <td><input type="checkbox" name="listadd" value="black1"></td>
                                <td><input type="checkbox" name="listadd" value="black1"></td>
                            </tr>
                            <tr>
                                <td>창혁몬</td>
                                <td>2020-10-27</td>
                                <td><input type="checkbox" name="listadd" value="black2"></td>
                                <td><input type="checkbox" name="listadd" value="black1"></td>
                            </tr>
                    </table>

                  <table id="bl">
                      <tr>
                          <th>회원 아이디</th>
                          <th id="long">추가일</th>
                          <th>블랙리스트<br/>사유 </th>
                          <th>블랙리스트<br/>해제</th>
                      </tr>

                  </table>
            </div>
        </div>
    </body>
    <script>

    	function bld() {
    		var list = "/";
    	    $("input[name=bd]:checked").each(function() {
    	    	var test = $(this).val();
    	    	list += test+"/";
    	    	console.log(test);
    			console.log(list);
    			$.ajax({
    				type:'get',
    				url:'blakb',
    				dataType:'json',
    				data:{'list':list},
    				success:function(d){
    					console.log(d);
    					blackshow();
    				},error:function(e){
    					console.log(e);
    					blackshow();
    				}
    			});
    	    });
		}
    
    
	    $('#bl').hide();
	    $('#ml').hide();
	    
		function membershow() {
			$('#bl').hide();
		    $('#ml').show();
			$('.mlf').remove();
			$.ajax({
				type:'get',
				url:'member',
				dataType:'json',
				success:function(d){

                    var str = "";
                    for(var i=0; i < d.length; i++){
    					console.log(d);
    					console.log(d[i].midx);
                    	str += '<tr class="mlf"><td><a href ="#" onclick="window.open(&#34;list?id='
                    	+d[i].midx+'&#34;, &#34;_blank&#34;, &#34;width=500px,height=500px&#34;)" id="'+d[i].mid+'">'
                    	+d[i].mid+d[i].midx+'</a></td>'
                    	+'<td>'+d[i].mdate+'</td>'
						+'<td>추가사유<select id = "'+d[i].midx+'"name = "Reason"><option value="null">사유선택</option>'
						+'<option value="욕설">욕설</option><option value="광고">광고</option>'
						+'<option value="성적댓글">성적댓글</option></td>'
						+'<td><button onclick="bladd(&#34;'+d[i].midx+'&#34;)">해제</button></td></tr>';
                    }
						$('#ml').append(str);
				},error:function(e){
					console.log(e);
				}
			});
		}
		function bladd(z){
			var sel = document.getElementById(z);
			var val = sel.options[sel.selectedIndex].value;
			console.log(z);
			console.log(val);
			var sum = z +","+ val
			location.href='./bladd?midx='+sum;
		}
		function blackshow() {
		    $('#ml').hide();
			$('#bl').show();
			$('.blf').remove();
			$.ajax({
				type:'get',
				url:'blaklist',
				dataType:'json',
				success:function(d){
					console.log(d);
                    var str = "";
                    for(var i=0; i < d.length; i++){
    					console.log(d[i]);
                    	str += '<tr class="blf"><td><a href ="#" onclick="window.open(&#34;list?id='+d[i].midx+'&#34;, &#34;_blank&#34;, &#34;width=500px,height=500px&#34;)" id="'+d[i].mid+'">'+d[i].mid+'</a></td><td>'+d[i].mbdate+'</td>'
						+'<td>'+d[i].mbreason+'</td><td><input type="checkbox" name="bd" value="'+d[i].midx+'"></td></tr>';
                    }
                    str +='<tr><td class="blf" colspan="4"><button onclick="bld()">해제</button></td></tr>'; 
						$('#bl').append(str);
				},error:function(e){
					console.log(e);
				}
			});
		}
		var checkArr=[];
		function bld() {
			$('input[type="checkbox"]:checked').each(function(idx,item){
				checkArr.push($(this).val());   
			 });
			console.log("재발!!"+checkArr);
			

			location.href='./bld?midx='+checkArr;
		}
    </script>
</html>