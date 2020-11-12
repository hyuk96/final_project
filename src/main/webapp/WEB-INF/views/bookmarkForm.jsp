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
	<style>
		table,th,td{
					border:1px solid black;
					border-collapse:collapse;
					padding:5px 10px;
					text-align: center;
				}
	</style>
<body>
	<form action="bookmark" method="get">
		<table>
			<tr>
				<td colspan="3">서울아산병원</td>
			</tr>
			<tr>
				<td><input type="submit" value="즐겨찾기"/></td>
				<td><input type="submit" value="댓글"/></td>
				<td><input type="submit" value="좋아요"/></td>
			</tr>
		</table>
	</form>
</body>
<script>
</script>
</html>