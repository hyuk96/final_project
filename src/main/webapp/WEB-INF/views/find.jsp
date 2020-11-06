<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<a href="#" onclick="idf()">아이디 찾기</a>
		
		<a href="#" onclick="pwf()">비밀번호 찾기</a>
		<div id="idfind" style="display: none">
			이메일 : <input type="text" id="id"/><br/>
			<button onclick="haw('id')">찾기</button>
		</div>
		
		<div id="pwfind" style="display: none">
			이메일 : <input type="text" id="mail"/><br/>
			아이디 : <input type="text" id="id"/><br/>
			<button onclick="haw('pw')">찾기</button>
		</div>
		<div id = "pwchange" style="display: none">
			<input type="text" id="type" >
			
			<form action="pwc" method="post">
				<input type="text" id="changid" name="id"><br/>
				비밀번호 : <input type="text" id="pw" name="pw"/><br/>
				비밀번호확인 : <input type="text" id="rpw" name="rpw"/><br/>
				<p></p>
				<input type="submit"  value="변경">
			</form>
			
		</div>
	</body>
	<script>
	$("#rpw").on("change keyup paste", function() {
	    var currentVal = $(this).val();
	    if(currentVal ==  $('#pw').val()) {
	    	console.log("같음");
	    	$('p').html('비밀번호가 서로 같습니다.');
	        return;
	    }
	 
	    // oldVal = currentVal;
	    // alert("changed!");
	    console.log("틀림");
	    $('p').html('비밀번호가 서로 같지 않습니다.');
	});

	
	function idf(){
		$('#idfind').show();
		$('#pwfind').hide();
	}
	
	function pwf(){
		$('#idfind').hide();
		$('#pwfind').show();
	}
	
	
	function haw(url) {
		var key = $('#mail').val();
		if(key==""){
			key = $('#id').val();
		}
		console.log(key)
		
		$.ajax({
			type:'get',
			url:url,
			dataType:'json',
			data:{'key':key},
			success:function(d){
				console.log(d);
				console.log(d.re);
				console.log(d.type);
				if(d.type == 'id'){
					console.log("나오는지 확인용");
					alert(d.re+"입니다.");
				}
				$('#type').val(d.type);
				$('#changid').val(d.re);
				var type = $('#type').val();
				if(type=="pw"){
					$('#pwchange').show();
				}
			},error:function(e){
				console.log(e);
			}
		});
	}
	</script>
</html>



