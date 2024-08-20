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
	a:visited, a:link{
		color : black;
		text-decoration: none;
		font-weight : bold;
	}
}
	
</style>

</head>
<body>
	<div><button onclick="location.href='login.jsp'">로그아웃</button></div>
	<%@include file="db2.jsp"%>	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	System.out.println(session.getAttribute("userId"));
	try{
		stmt = conn.createStatement();
		String querytext = 
				  "SELECT B.boardNo, title, B.cnt, cdatetime, NAME, commentCnt, B.userId "
				+ "FROM tbl_board B "
				+ "INNER JOIN tbl_user U ON B.userId = U.userId "
				+ "LEFT JOIN ( "
				+ 	"SELECT COUNT(*) AS commentCnt, boardNo "
				+	"FROM tbl_comment "
				+	"GROUP BY boardNo "
				+ ") C ON B.boardNo = C.boardNo";
;
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
		String commentCnt = "";
		if(rs.getString("commentCnt") != null){
			commentCnt = "(" + rs.getString("commentCnt") + ")";
		} 
	%>
		<tr>
			<td> <%= rs.getString("boardNo") %></td>
			<td> 
				<a href="#" onclick="fnView('<%= rs.getString("boardNo") %>')">
					<%= rs.getString("title") %> <%= commentCnt %>
				</a>
			</td>
			<td> <a href="javascript:;" onclick="fnInfo('<%= rs.getString("userId") %>')"> <%= rs.getString("name") %></a></td>
			<td> <%= rs.getString("cnt") %></td>
			<td> <%= rs.getString("cdatetime") %></td>
		</tr>
	<%
	}
	%>
	
	</table>
	<button onclick="location.href='insert.jsp'">글쓰기</button>
	<%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>
</html>

<script>
	function fnView(boardNo){	/* board-view.jsp로 이동 */
		location.href="board-view.jsp?boardNo="+boardNo;
	}
	
	function fnInfo(userId){	/* user-info.jsp로 이동 */
		location.href="user-info.jsp?userId="+userId;
	}
	
	
</script>