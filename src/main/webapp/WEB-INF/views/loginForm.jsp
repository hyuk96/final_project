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
		<form action="login" method="post">
			id : <input type="text" name="id"/><br/>
			pw : <input type="text" name="pw"/><br/>
			<input type="submit" value="login"/>
			<!--<input type="button"  onclick="location.href='join'" value="회원가입"/>-->
		</form>
		<a href="find">찾기</a>
		<a href="adminP">관리자</a>
	</body>
	<script>
	</script>
</html>
