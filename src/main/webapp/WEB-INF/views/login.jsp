<!-- 담당: 창혁 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
            #login_box{
                width: 400px;
                height: 300px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 200px;
                text-align: center;
                border: 1px solid black;
                box-sizing: border-box;
            }
            #exit_button{
                margin-left: 360px;
                border: 1px solid transparent;
                background-color: transparent;
            }
			table, th, td{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 10px;
                margin-bottom: 50px;
                margin-top: 50px;
                margin-left: auto;
                margin-right: auto;
			}
            #login_button{
                width: 200px;
                height: 30px;
            }
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
        <div id="login_box">
            <button id="exit_button" onclick="exit()">X</button></br>
            <a href="#">(로고)</a>
            <table>
                <tr>
                    <th>아이디</th><td><input type="text" placeholder="아이디를 입력하세요."></td>
                </tr>
                <tr>
                    <th>비밀번호</th><td><input type="password" placeholder="비밀번호를 입력하세요."></td>
                </tr>
            </table>
            <button id="login_button">로그인</button>
            <div>
                <a href="#">아이디/비밀번호 찾기</a>|<a href="#">회원가입</a>
            </div>
        </div>
	</body>
	<script>
        function exit(){
            $("#login_box").hide();
        }
	</script>
</html>