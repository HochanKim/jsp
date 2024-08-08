<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db2.jsp" %>	
	<%
		/* 스크립 틀릿 (자바 문법) */
		String id = request.getParameter("userId");		// join.jsp에서 name으로 보낸 값(파라미터)을 가져오기(get)
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		Statement stmt = null;	// Statement 객체
		try {
			stmt = conn.createStatement();	// 쿼리 호출 함수
			String sql
			= "INSERT INTO tbl_user(userId, pwd, name) VALUES ('"+ id +"', '"+ pwd+"', '"+ name +"')";			
			stmt.executeUpdate(sql);
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	<div>
		보냈다
	</div>
</body>
</html>