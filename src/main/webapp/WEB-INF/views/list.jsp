<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table,th,td{
				border: 1px solid;
				border-collapse: collapse;
				padding: 5px 10px;
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>유저이름</th>
		</tr>
		<c:forEach items="${list}"  var ="dto">
			<tr>
				<td>${dto.idx}</td>
				<td>${dto.subject}</td>
				<td><form action="bldelete">
				<input type="text" name="idx" value="${dto.idx}" readonly="readonly">
				<input type="text" name="name" value="${dto.user_name}" readonly="readonly">
				<input type="submit" value="삭제">
				</form></td>
			</tr>
		</c:forEach>
	</table>
	</body>
	<script>
		
	</script>
</html>
