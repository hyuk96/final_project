<!-- 담당: 창혁 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>menu</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        /* 네비게이션 바 */
        .menu{
            border: 1px solid black;
            position: absolute;
        }

        .answer{
            margin-top: 5%;
            position: absolute;
            border: 1px solid black;
            width: 9%;
        }

        h3{
            text-align: center;
        }
    </style>
</head>
<body>
    <button id="remove">닫기</button>
        <div class="menu">
            <div class="name">${location.name}</div>
            <div class="location">${location.address}</div><hr/>
            <button id="favor">즐겨찾기</button><button id="answer">댓글</button><button id="like">좋아용</button><br/>
        </div>

        <div class="answer">
            <h3>댓글</h3>
            <div class="world"></div>
            <input id="chatting" type="text" placeholder="${Member.id}(으)로 댓글달기">
            <button>게시</button>
        </div>
</body>

<script>
    $("#remove").click(function(){
            console.log("삭제요청");
            $(".menu").remove();
        });

    $("#remove").click(function(){
        console.log("삭제요청");
        $(".answer").remove();
    });

    
    //1.버튼을 클릭하면
    $("button").click(function(){
            var chat = $("#chat").val();
            var txt = chat
            // var no = $("#no").val();
            // var name = $("#name").val();
            // var sub = $("#sub").val();
            // var score = $("#score").val();
            // var txt ="<tr><th>"+no+"</tr></th>"+name+"</tr></th>"+sub+"</tr></th>"+score+"</tr></th>";

            $(".world").append(txt);

         $(".world").append("<tr><th>"+"${user.nickname}"+"<br>"+"${date}"+"<br>"+$("#chatting").val()+"</tr></th>"+"<hr/>");
        });
    
</script>
</html>