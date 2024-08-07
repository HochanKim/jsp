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
		/* session.removeAttribute("userId"); */	// 세션 개별삭제 메소드
		session.invalidate();						// 세션 일괄삭제 메소드
	%>
	<form action="login-result.jsp">	<!-- 'login_result.jsp'로 정보를 넘기기  -->
		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		<input type="submit" value="로그인!">
	</form>
</body>
</html>