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
            #join_box{
                text-align: center;
            }
            table{
                width: 500px;
                height: 600px;
                border: 1px solid black;
                margin-left: auto;
                margin-right: auto;
                margin-top: 100px;
                text-align: left;
                padding: 10px;
            }
            input[type="text"], input[type="password"]{
                width: 250px;
                height: 30px;
            }
            #join_button{
                margin-top: 30px;
                width: 200px;
                height: 30px;
            }
            #check_id, #check_pw, #check_email, #check_nickname{
                height: 5px;
                font-size: 2px;
            }
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>        
        <div id="join_box">
            <table>
                <tr>
                    <th>아이디</th><td><input type="text" placeholder="아이디(최대 8글자)"></td><td><button>중복 확인</button></td>
                </tr>
                <tr>
                    <th></th><td colspan="2" id="check_id">아이디 중복 확인 메시지</td>
                </tr>
                <tr>
                    <th>비밀번호</th><td colspan="2"><input type="password" placeholder="비밀번호(최대 12글자)"></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th><td colspan="2"><input type="password" placeholder="비밀번호 확인"></td>
                </tr>
                <tr>
                    <th></th><td colspan="2" id="check_pw">비밀번호 확인 메시지</td>
                </tr>
                <tr>
                    <th>이메일</th><td><input type="text" placeholder="이메일"></td><td><button>인증번호 발송</button></td>
                </tr>
                <tr>
                    <th></th><td colspan="2" id="check_email">이메일 중복 확인 메시지</td>
                </tr>
                <tr>
                    <th>인증번호</th><td><input type="text" placeholder="이메일 인증번호"></td><td><button>인증번호 확인</button></td>
                </tr>
                <tr>
                    <th>닉네임</th><td><input type="password" placeholder="닉네임(최대 8글자)"></td><td><button>중복 확인</button></td>
                </tr>
                <tr>
                    <th></th><td colspan="2" id="check_nickname">닉네임 중복 확인 메시지</td>
                </tr>
                <tr>
                    <th>생년월일</th><td colspan="2"><input type="date"></td>
                </tr>
                <tr>
                    <th>이름</th><td colspan="2"><input type="text" placeholder="이름"></td>
                </tr>
                <tr>
                    <th>성별</th><td colspan="2"><select name=""><option value="F">여자</option><option value="M">남자</option></select></td>
                </tr>
                <tr>
                    <th>선호도</th>
                    <td colspan="3">1순위 <select name=""><option value="지하철">지하철</option><option value="공원">공원</option><option value="병원">병원</option></select>
                    2순위 <select name=""><option value="지하철">지하철</option><option value="공원">공원</option><option value="병원">병원</option></select>
                    3순위 <select name=""><option value="지하철">지하철</option><option value="공원">공원</option><option value="병원">병원</option></select></td>
                </tr>
            </table><!--성별, 선호도 name, value 값 변경. 현재는 임시-->
            <button id="join_button" onclick="join()">회원가입</button>
        </div>
	</body>
	<script>
//        var msg="";
//        if(msg != ""){}; 수정 필요
        function join(){
            alert("회원가입 성공.")
        }
//      확인 메시지 색 변화: ajax
	</script>
</html>