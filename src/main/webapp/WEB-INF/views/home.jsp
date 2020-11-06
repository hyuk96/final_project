<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<style>
		</style>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
</head>
	<body>
		<a href="memberdelect" >회원탈퇴</a><br/>
		<a href="memberPreference" >선호도변경</a><br/>
		<a href="logout">logout</a><br/>
		${sc[0].SSum}
	</body>
</html>