<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="db.jsp" %>
	<%
		Statement stmt = null;
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nickName");
		String name = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String reason = request.getParameter("reason");
		
		try{
			stmt = conn.createStatement();
			String sql 
			= "INSERT INTO hmw_user VALUES ('"+ id +"','"+ pwd +"','N','"+ nick +"', '"+ name +"', '"+ phone +"', '0', '"+ reason +"')"; 
			stmt.executeUpdate(sql);
	%>
			<script>
				alert("가입이 완료되었습니다.");
				location.href="join.jsp";
			</script>		
	<%
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}			
	%>
</body>
</html>