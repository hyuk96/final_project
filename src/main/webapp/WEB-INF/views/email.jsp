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
            .logo{
                position: fixed;
            }
            #entire_box{
                width: 702px;
                height: 702px;
                border: 1px solid transparent;
                margin-left: auto;
                margin-right: auto;
                margin-top: 100px;
                box-sizing: border-box;
                text-align: cenc;
            }
            #report_sending{
                width: 700px;
                height: 350px;
                border: 1px solid transparent;
            }
            #report_check{
                width: 700px;
                height: 350px;
                text-align: center;
                border: 1px solid transparent;
                background-color: rgb(240, 239, 239);
            }
            #mail_image{
                width: 100px;
                height: 50px;
                border: 1px solid black;
                margin-left: auto;
                margin-right: auto;
                margin-top: 50px;
                margin-bottom: 50px;
            }
            h2, h3, p{
                text-align: center;
                margin-top: 30px;
            }
            table, td{
                margin: 20px;
                padding: 10px;
                text-align: left;
            }
            #resending_button{
                border: 1px solid blue;
                color: cornflowerblue;
                background-color: transparent;
                font-size: 20px;
                width: 200px;
                height: 50px;
            }
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
        <!--* 상단 로고 *-->
        <div class="logo" style="width:-webkit-fill-available; text-align:center;">
            <a href="Main.html"><img src="logo.png"></a>
        </div>
        
        <div id="entire_box">
            <div id="report_sending">
                <div id="mail_image">메일 이미지</div>
                <h2>인증 코드가 발송되었습니다.</h2>
                <p>메일함에서 인증 메일을 확인바랍니다.</br>이메일의 인증버튼을 선택하면 회원가입이 완료됩니다.</p>
            </div>
            <div id="report_check">
                <h3>유의사항</h3>
                <table>
                    <tr>
                        <td>1. </td><td>인증코드는 발송 시점으로부터 5분 동안만 유효하며, 재발송 시 기존 인증코드는 만료됩니다. 반드시 마지막에 수신된 메일을 확인 바랍니다.</td>
                    </tr>
                    <tr>
                        <td>2. </td><td>메일이 도착하지 않았다면 스팸함을 확인해주시기 바랍니다.</td>
                    </tr>
                </table>
                <button id="resending_button">인증코드 재발송</button>
            </div>
        </div>
	</body>
	<script>
        function exit(){
            $("#login_box").hide();
        }
	</script>
</html>