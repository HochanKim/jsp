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
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		String p_number = request.getParameter("phone");
		String gender = request.getParameter("gender");
	%>
	<p>아이디 : <%= id %></p>
	<p>비번 : <%= pwd %></p>
	<p>이름 : <%= name %></p>
	<p>폰번호 : <%= p_number %></p>
	<p>성별 : <%= gender %></p>
</body>
</html>