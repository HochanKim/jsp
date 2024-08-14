<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halfmedia Works</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
    <!-- í¤ë ìì­ -->
    <header>
        <div class="wrap">
            <div class="logo-img">
                <a href="javascript::">
                    <img src="image/logo_colorchange.png" rel="ë¡ê³ ">
                </a>
            </div>
            <div class="hmw-menu-btn">
                <span class="line"></span>
                <span class="line"></span>
                <span class="line"></span>
            </div>
        </div>
    </header>

    <!-- ìë¸ë©ë´ ìì­ -->
    <nav class="sub-menu">
        <ul>
            <li><a href="#">about us</a></li>
            <li><a href="#">our works</a></li>
            <li><a href="#cont">contacts</a></li>
            <li><a href="#">notice</a></li>
        </ul>
        <p class="kind">photo, promotion video, music video, drone shot</p>
        <address>
            <div class="fowd">
                <p>Tel</p>
                <p>Email</p>
                <p>Address</p>
            </div>
            <div class="behind">
                <p>070-7700-9308</p>
                <p>halfmediaworks@naver.com</p>       
                <p>ê²½ê¸°ë ìí¥ì ìì¸ëíë¡264ë²ê¸¸35 4ì¸µ 425í¸</p>
            </div>
        </address>
    </nav>
    <script src="js/halfmedia.js"></script>
</body>
</html>