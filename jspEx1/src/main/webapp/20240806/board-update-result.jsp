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
		PreparedStatement pstmt = null;
		String boardNo = request.getParameter("boardNo");
		String newTitle = request.getParameter("title");
		String newContents = request.getParameter("contents"); 
		/* String boardNo = (String)session.getAttribute("boardNo");
		String newTitle = (String)session.getAttribute("title");
		String newContents = (String)session.getAttribute("contents"); */
		
		try {
			String querytext = "SELECT * FROM TBL_BOARD WHERE boardNo=? and title=? and contents=?";
			pstmt = conn.prepareStatement(querytext);
			
			pstmt.setString(1, boardNo);
			pstmt.setString(2, newTitle);
			pstmt.setString(3, newContents);
			
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()){
	%>	
				<input  type="hidden" 
						value="<%= rs.getString("boardNo") %>" 
						name="boardNo"> 
				<div>제목 : <input value="<%= rs.getString("title") %>" name="title"></div>
				<div>내용 : 
					<textarea cols="50" rows="10" name="contents"><%= rs.getString("contents") %></textarea>
				</div>
				<button type="submit">저장</button>
	<%			
			} else {
				out.println("삭제된 게시글 입니다.");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage() + " System.out.println("+newTitle+") " + " System.out.println("+newContents+")");
		}
	%>
</form>
</body>
</html>
