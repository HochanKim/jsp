<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halfmedia Works</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/common.css">
</head>
<body>
    <!-- 헤더 영역 -->
    <header id="header">
        <div class="wrap">
            <div class="logo-img">
                <a href="javascript::">
                    <img src="image/logo_colorchange.png" rel="로고">
                </a>
            </div>
            <div class="float-right">
            	<div class="login">
            		<a href="javascript::">
            			<span>로그인</span>
            		</a>
            	</div>
            	<div class="hmw-menu-btn">
                	<span class="line"></span>
                	<span class="line"></span>
                	<span class="line"></span>
            	</div>
            </div>
        </div>
    </header>

    <!-- 서브 메뉴 -->
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
                <p>경기도 시흥시 서울대학로264번길35, 425호</p>
            </div>
        </address>
    </nav>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script>
	//서브메뉴
		var menu = document.querySelector(".hmw-menu-btn");
		var hide = document.querySelector(".sub-menu");
		$(menu).on("click", () => {
		    if(menu.classList.contains('open')){
		        menu.classList.remove('open');
		        $(hide).on("click").css("top", "-100vh");
				document.querySelector("#header").style.zIndex=0;
				document.querySelector("#cont").style.zIndex=0;
		    } else {
		        menu.classList.add('open');
		        $(hide).on("click").css("top", "0");
				document.querySelector("#header").style.zIndex=1;
				document.querySelector("#cont").style.zIndex=-1;
		    };
		});
		
	// 로그인
	var login = document.querySelector(".login");
	$(login).on("click", () => {
		window.open("login.jsp", "PopupWin", "width=600, height=600");
	});
	</script>
</body>
</html>