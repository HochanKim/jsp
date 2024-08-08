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
		String id = request.getParameter("userId");
		/* 입력한 아이디 중복체크를 위해 쿼리에 저장된 아이디를 호출 */
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			String sql
			= "SELECT * FROM tbl_user WHERE userId = '" + id + "'";			
			rs = stmt.executeQuery(sql);
			
			
			/* 중복체크를 위한 조건문 */
			if(rs.next()){
				out.println("이미 사용중인 아이디입니다.");
			} else {
				out.println("사용 가능한 아이디입니다.");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>