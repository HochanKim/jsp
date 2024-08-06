<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "db2.jsp" %>
		
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		ResultSet rs = null;
		Statement stmt = null;
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM tbl_user WHERE userId = '" + id + "' AND pwd = '" + pwd + "'";
		System.out.println(querytext);
		rs = stmt.executeQuery(querytext);
		
		if(rs.next()){
			out.println("로그인 성공!");
			session.setAttribute("userId", rs.getString("userId"));
			response.sendRedirect("list02.jsp");
		} else {
			out.println("로그인 실패!");
		}
	%>
</body>
</html>