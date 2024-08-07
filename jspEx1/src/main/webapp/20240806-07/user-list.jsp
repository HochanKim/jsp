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
	<div>
		<button onclick="location.href='list02.jsp'">게시판으로 이동하겠습니다.</button>
		<table style="margin-top : 10px;">
			<tr>
				<th>아이디</th>
				<th>회원명</th>
				<th>권한</th>
				<th>비밀번호</th>
			</tr>
			<%@ include file="db2.jsp" %>
			<%
				/* 쿼리를 호출하는 객체 */
				ResultSet rs = null;
				Statement stmt = null;
			
				/* tbl_board 내용 불러와서 화면에 출력 */
				try {
					/* 쿼리 가져와서 담기 */
					stmt = conn.createStatement();
					rs = stmt.executeQuery("SELECT * FROM tbl_user");
				
					while(rs.next()){
						String status =
								rs.getString("status").equals("A") ? "관리자" : "일반회원";
			%>
					<tr>
						<td><%= rs.getString("userId") %></td>
						<td><%= rs.getString("name") %></td>
						<td><%= status %></td>
						<td>
							<%
								// 비밀번호 5번 이상 실패된 유저의 비밀번호 초기화
								if(rs.getInt("cnt") >= 5){
							%>
									<button onclick="fnReset('<%= rs.getString("userId") %>')">초기화</button>
							<% 
								};
						    %>
						</td>
					</tr>
			<% 
					}
				
				} catch (SQLException ex) {
					out.println("SQLException : " + ex.getMessage());
	
				}
			%>
		</table>
	</div>
</body>
</html>
<script>
	function fnReset(userId){
		/* location.href="pwd-reset.jsp?userId="+userId; */
		window.open("pwd-reset.jsp?userId="+userId, "reset", "width=500, height=500");
	}
	
	function fnReload(){
		location.reload();
	}
</script>