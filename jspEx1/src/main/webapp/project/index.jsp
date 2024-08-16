<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halfmedia Works</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/index.css">
    <!-- js 파일 include -->
    <script type="text/javascript"><%@ include file = "/project/js/halfmedia.js" %></script>
    <script type="text/javascript"><%@ include file = "/project/js/jquery-3.7.1.min.js" %></script>
</head>
<body>
    <header></header>
    <section class="video-sec">
        <video src="./image/Rogito-Freedumb_3.mp4" autoplay muted loop></video>
    </section>
    <section class="contact-sec" id="cont"></section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script>
$(document).ready(function() {
    $("header").load("header.jsp");
    $("#cont").load("contact.jsp");
});
</script>