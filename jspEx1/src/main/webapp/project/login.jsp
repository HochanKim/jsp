<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();						// 세션 일괄삭제 메소드
	%>
	<form name="login" class="login">	
		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		<input type="button" onclick="fnLogin()" value="로그인!">
		<input type="button" onclick="fnJoin()" value="회원가입!">		<!-- 'join.jsp'로 이동 -->
	</form>
</body>
</html>
<script>
    function fnJoin() {
        location.href = "join.jsp";
    }
    
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

        form.action = "login-result.jsp"; // 'login-result.jsp'로 이동
        form.submit();	// 제출
    }	
</script>