<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td {
		border : 1px solid black;
		border-collapse : collapse;
		padding: 10px;
	}
</style>
</head>
<body>
	<%@ include file="db2.jsp" %>
	<%
		/* 쿼리를 호출하는 객체 */
		ResultSet rs = null;
		Statement stmt = null;
		
		/* tbl_board 내용 불러와서 화면에 출력 */
		try {
			/* 쿼리 가져와서 담기 */
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM tbl_board");
			
			/* 테이블 헤더(th) 생성 */
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>번호</th>");
			out.println("<th>제목</th>");
			out.println("<th>작성자</th>");
			out.println("<th>조회수</th>");
			out.println("<th>작성일</th>");
			out.println("</tr>");
			
			/* 테이블 내용 가져오기 */
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>"+ rs.getString("boardNo") +"</td>");
				out.println("<td>"+ rs.getString("title") +"</td>");
				out.println("<td>"+ rs.getString("userId")+ "</td>");
				out.println("<td>"+ rs.getString("cnt") + "</td>");
				out.println("<td>"+ rs.getString("cdatetime") + "</td>");
				out.println("</tr>");	
			}
		} catch (SQLException ex) {
				out.println("SQLException : " + ex.getMessage());

		}
		
	
	%>
</body>
</html>