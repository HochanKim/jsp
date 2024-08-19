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
		session.removeAttribute("userId");
		session.removeAttribute("staffYN");
		response.sendRedirect("index.jsp");
		session.invalidate();					// 세션 일괄삭제 메소드
%>
</body>
</html>