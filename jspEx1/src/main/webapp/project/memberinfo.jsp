<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/subpage.css">
</head>
<body>
	<!-- 'header.jsp'에서 이동 -->
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String userId = request.getParameter("userId");
		String sql = "Select * from hmw_user Where userId = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);  // SQL 인젝션 방지
			rs = pstmt.executeQuery();
			
			if(rs.next()){
	%> 
		<form name="member">
			<h2>회원정보</h2>
			<div>
				<span>아이디</span><%= rs.getString("userId") %>
			</div>
			<div>
				<span>이름</span><%= rs.getString("userName") %>
			</div>
			<div>
				<span>닉네임</span><%= rs.getString("nickName") %>
			</div>
			<div>
				<span>전화번호</span><%= rs.getString("p_number") %>
			</div>
			<button type="button" onclick="fnUpdate()" class="update">정보수정</button>
			<button type="button" onclick="meberExit()" class="exit">회원탈퇴</button>
		</form>
		<% 
			} else {
				out.println("삭제된 아이디 입니다.");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
			
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
		}
	%>
</body>
</html>
<script>
function fnUpdate(){
	var form = document.member;
	form.action = "member-update.jsp";
	form.submit();
}
</script>