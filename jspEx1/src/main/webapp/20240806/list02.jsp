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
</style>

</head>
<body>
	<%@include file="db2.jsp"%>	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM TBL_BOARD";
		rs = stmt.executeQuery(querytext);
	%>
		<table>
		<tr>
			<th> 번호 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 조회수 </th>
			<th> 작성일 </th>
		</tr>			
	<%
		while (rs.next()) {
	%>
			<tr>
				<td> <%= rs.getString("boardNo") %></td>
				<td>
					<a href='#' onclick="fnClick('<%= rs.getString("boardNo") %>')">	<!-- 함수 파라미터에 값 넣기(테이블의 해당 pk값)  -->
						<%= rs.getString("title") %>
					</a>
				</td>
				<td> <%= rs.getString("userId") %></td>
				<td> <%= rs.getString("cnt") %></td>
				<td> <%= rs.getString("cdatetime") %></td>
			</tr>
	<%
		}
	%>
	
	</table>
	<button onclick="location.href='insert.jsp'">글쓰기</button>	<!-- '글쓰기' 버튼 클릭 시, 'insert.jsp'로 이동 -->
	<%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>
</html>
<script>
	function fnClick(boardNo){
		location.href="board-view.jsp?boardNo=" + boardNo;
		
	}
</script>