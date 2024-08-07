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
	div {
		margin-top : 5px;
	}
}
	
</style>

</head>
<body>
<form action="board-view.jsp" method="post">
	<%@include file="db2.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");
		String newTitle = request.getParameter("title");
		String newContents = request.getParameter("contents"); 
		
		try {
			stmt = conn.createStatement();
			String querytext = "UPDATE tbl_board SET title = '"+ newTitle+ "', contents = '"+ newContents + "' WHERE boardNo = '" + boardNo +"'";
			stmt.executeUpdate(querytext);
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage() + " System.out.println("+newTitle+") " + " System.out.println("+newContents+")");
		}
	%>
</form>
</body>
</html>
<script>
	alert("수정하였습니다.");
	location.href = "list02.jsp";
</script>
