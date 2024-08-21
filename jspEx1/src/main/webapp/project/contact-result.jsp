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
<!-- 'contact.jsp'에서 이동 -->
<%@ include file="db.jsp" %>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String inquiry = request.getParameter("q_text");
	String classf = request.getParameter("classification");
	String purp = request.getParameter("purpose");

	Statement stmt = null;
	
	try {
		stmt = conn.createStatement();
		String sql 
		= "INSERT INTO HMW_CONTACT VALUES (null, '"+ name +"', '"+ phone +"', '"+ email +"', '"+ inquiry +"', '"+ classf +"', '"+ purp +"', NOW())"; 
		stmt.executeUpdate(sql);
		
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
%>
<script>
	alert("제안서 제출했습니다.");
	location.href = "index.jsp";
</script>
</body>
</html>