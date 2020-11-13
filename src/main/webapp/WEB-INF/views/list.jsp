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
				<td>${dto.HRIdx}</td>
				<td>${dto.HRContent}</td>
				<td><form action="bldelete">
				<input type="hidden" name="idx" value="${dto.MIdx}" readonly="readonly">
				<input type="hidden" name="ridx" value="${dto.HRIdx}" readonly="readonly">
				${dto.HRNickname}
				<input type="hidden" name="name" value="${dto.HRNickname}" readonly="readonly">
				<input type="submit" value="삭제">
				</form></td>
			</tr>
		</c:forEach>
	</table>
	</body>
	<script>
		
	</script>
</html>
