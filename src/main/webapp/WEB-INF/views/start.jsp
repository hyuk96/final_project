<!-- 담당: 창혁 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>시작페이지</title>
        <script></script>
        <style>
            * {box-sizing: border-box}
            body {font-family: Verdana, sans-serif; margin:0}
            .mySlides {display: none}
            img {vertical-align: middle;}

            /* Slideshow container */
            .slideshow-container {
            min-width: 1080px;
            position: relative;
            margin: auto;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
            }

            /* Caption text */
            .text {
              color: #f2f2f2;
              font-size: 30px;
              padding: 8px 12px;
              position: absolute;
              top: 24px;
              right: 120px;
              width: 100%;
              text-align: right;
            }

            .text2 {
            color: #000000;
            font-size: 15px;
            position: absolute;
            width: 100%;
            text-align: center;
            }

            /* The dots/bullets/indicators */
            .dot {
            cursor: pointer;
            height: 20px;
            width: 20px;
            margin: 0 7px;
            background-color: rgb(255, 255, 255);
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
            }

            .active, .dot:hover {
            background-color: #397f96;
            }

            /* Fading animation */
            .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
            }

            @-webkit-keyframes fade {
            from {opacity: .4} 
            to {opacity: 1}
            }

            @keyframes fade {
            from {opacity: .4} 
            to {opacity: 1}
            }

            /* On smaller screens, decrease text size */
            @media only screen and (min-width: 100%) {
            .prev, .next,.text {font-size: 11px}
            }
        </style>
    </head>
    <body style="background-color: #a7cdda;">
      
        <!-- 슬라이드 쇼-->
        <div class="slideshow-container">

            <div class="mySlides fade">
              <img src="images/town.jpg" style="width: 100%; height: 100%;" >
              <div class="text">
                <h3>오로지 나를 위한 동네</h3>
                <h1>내가 살기 좋은 동네</h1>
              </div>
            </div>
            
            <div class="mySlides fade">
              <div class="text2">
              </br></br></br></br></br>
                <img src="images/logo.png"></br></br>
                <img src="images/travler.png" style="width: 150px;">
              </br></br></br></br></br>
                <div style="background-color: #ffffff; width: 1500px; height: 800px; height: 500px; margin: auto;">
                  </br></br></br></br>
                  <h2>나에게 맞는 조건의 동네 어디 없을까?</h2>
                  </br></br></br></br>
                  <p>영민 씨는 산책 가능한 공원이 가까운 동네가,</br>
                    준호 씨는 근조직을 조질 수 있는 헬스장이,</br>
                    창혁 씨는 매달릴 수 있는 클라밍장이 필요하다고 합니다.</br>
                    이와 같은 여러분들의 조건에 맞는 동네를 찾아드립니다.                    
                  </p>
                  </br></br></br>
                  <a href="main">내게 맞는 동네 찾아보기 ></a>
              </div>
            </div>
            
            <!-- 3번째 슬라이드 사용 미정.
            <div class="mySlides fade">
              <img src="http://placehold.it/300x100" style="width:100%">
              <div class="text">Caption Three</div>
            </div>
            -->
            
            
            </div>
            <br>
            
            <div style="text-align:center;position: fixed;width: -webkit-fill-available;bottom: 35px;">
              <span class="dot" onclick="currentSlide(1)"></span> 
              <span class="dot" onclick="currentSlide(2)"></span> 
              <!-- 3번째 슬라이드 사용 미정.
              <span class="dot" onclick="currentSlide(3)"></span> 
              -->
            </div>

    </body>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
        showSlides(slideIndex += n);
        }

        function currentSlide(n) {
        showSlides(slideIndex = n);
        }

        function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {slideIndex = 1}    
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
        }
    </script>
</html>