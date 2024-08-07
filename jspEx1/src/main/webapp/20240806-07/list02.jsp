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
	<div>
		<button onclick="location.href='NewLogin.jsp'">로그아웃</button>
	</div>
	<%@include file="db2.jsp"%>	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	System.out.println(session.getAttribute("userID"));
	
	try{
		stmt = conn.createStatement();
		String querytext =  "SELECT * FROM tbl_board b INNER JOIN tbl_user u ON b.userId = u.userId";
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
				<td> <!-- 번호 -->
					<%= rs.getString("b.boardNo") %>
				</td>
				<td> <!-- 제목 -->
					<a href='#' onclick="fnClick('<%= rs.getString("b.boardNo") %>')">	<!-- 함수 파라미터에 값 넣기(테이블의 해당 pk값)  -->
						<%= rs.getString("b.title") %>
					</a>
				</td>
				<td> <!-- 작성자 -->
					<%= rs.getString("u.name") %>
				</td>
				<td> <!-- 조회수 -->
					<%= rs.getString("b.cnt") %>
				</td>
				<td> <!-- 작성일 -->
					<%= rs.getString("b.cdatetime") %>
				</td>
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