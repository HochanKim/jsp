<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/index.css">
</head>
<body>
	<form name="login" class="login">	
		<div>
			<label>
                <p>아이디</p>
                <input type="text" name="id">
            </label>
		</div>
		<div>
			<label>
                <p>패스워드</p>
                <input type="password" name="pwd">
            </label>
		</div>
		<input class="logbutton" type="button" onclick="fnLogin()" value="로그인!">		<!-- 정상 로그인을 하면 창이 닫히고 'index.jsp'로 전환 -->
		<input class="logbutton" type="button" onclick="fnJoin()" value="회원가입!">
	</form>
</body>
</html>
<script>
	// 회원가입 버튼 클릭
    function fnJoin() {
        location.href = "join.jsp";		// 'join.jsp'로 이동
    }
    
	// 로그인 버튼 클릭
    function fnLogin() {
        var form = document.login;
        
        if(form.id.value == ""){
            alert("아이디를 입력해주세요");
            form.id.focus();
            return;
        }

        if(form.pwd.value == ""){
            alert("비밀번호를 입력해주세요");
            form.pwd.focus();
            return;
        }

        form.action = "login-result.jsp"; // 입력한 아이디, 비밀번호는 'login-result.jsp'로 이동
        form.submit();	// 제출
    }	
</script>