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
<!-- 'join.jsp'에서 전달받음 -->
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
			// 모든 조건 충족시 쿼리에 정보를 전달하고 join.jsp에 얼럿창 띄우기
				alert("가입이 완료되었습니다.");
				location.href="login.jsp";
			</script>		
	<%
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}			
	%>
</body>
</html>