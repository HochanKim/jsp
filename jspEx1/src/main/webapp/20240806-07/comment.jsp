<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}

}
	
</style>

</head>
<body>
	<%@include file="db2.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String cmntNo = request.getParameter("commentNo + 1");
		String boardNo = request.getParameter("boardNo");
		String userId = request.getParameter("userId");
		String cmnt = request.getParameter("comment");
		
		try{
			stmt = conn.createStatement();
			String querytext = "INSERT INTO tbl_comment VALUES ('"+ cmntNo +"', '"+ boardNo +"', '"+ userId +"', '"+ cmnt +")";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>