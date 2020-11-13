<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style></style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
<body>

	<fieldset>
		<input id ='keyword' type="text" name="keyword" placeholder="아파트 검색"/>
		<button onclick="listCall()">search</button>
	</fieldset>
		<table>
			<tr id="ml"></tr>		
		</table>
   			  
</body>
<script>
	var x = new Array();
	var y = new Array();
	function listCall(){
		var keyword = $('#keyword').val();
		console.log(keyword);
		$.ajax({
			url:'listCall',
			type:'GET',
			dataType:'JSON',
			data:{"keyword":keyword},
			success:function(d){
				console.log(d);
				console.log("아작스 된다");
				//alert("아작스 성공");
				//drawlist(d.list);
				//$("#boardList").html(d.list);
				//console.log(d.list[1].ID);
				if(d.list[0]==null){
					alert('검색결과가 없습니다');
				}else{
				console.log(d.coordinate[0]);
                var str = "";
	                for(var i=0; i < d.list.length; i++){
	                	//console.log(d.list[i].HX);
	                	//console.log(d.list[i].HY);
	                	console.log(d.list[i].HNAME);
	                	//console.log(d.sublist[i].SUBNAME);
	                	//console.log(d.list[i]);
	                   	str += '<tr><td onclick="xy(&#34;'+i+'&#34;)">'+d.list[i].HNAME+'</td></tr>';
	 	               x[i] = d.coordinate[i].HX;
	 	               y[i] = d.coordinate[i].HY;
	              	}
	                
	                /* for(var i=0; i < d.sublist.length; i++){
	                	//console.log(d.list[i].HX);
	                	//console.log(d.list[i].HY);
	                	//console.log(d.list[i].HNAME);
	                	console.log(d.sublist[i].SUBNAME);
	 
	                   	str += '<tr><td>'+"지하철  "+d.sublist[i].SUBNAME+"역"+'</td></tr>';
	              	} */
	                	        
	              $('#ml').empty();
	              $('#ml').append(str);
	              str = "";
				}

			}
			,error:function(e){
				console.log(e);
				console.log('실패');
			}
		});
	}
     function xy(e){
    	 	console.log(x[e]);
     		console.log(y[e]);
     	}

</script>
</html>

