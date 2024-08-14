<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halfmedia Works</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <header></header>
    <section class="video-sec">
        <video src="./image/Rogito-Freedumb_3.mp4" autoplay muted loop></video>
    </section>
    <section class="contact-sec" id="cont">
        <div class="wrap">
            <form name="contact" class="contact"></form>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/halfmedia.js"></script>
    <script>
        $(document).ready(function() {
        	$("header").load("header.jsp");
        });   
    </script>
</body>
</html>