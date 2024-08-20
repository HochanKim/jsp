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
<!-- 'join.jsp'의 '중복체크' 버튼의 기능구현 (회원 닉네임) -->
<%@ include file="db.jsp" %>
<form name="check">
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String nick = request.getParameter("nickName");
	
	try{
		stmt = conn.createStatement();
		String sql 
		= "SELECT * FROM hmw_user WHERE nickName = '"+ nick +"'"; 
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.println("이미 존재하는 닉네임입니다. 다른 닉네임을 입력해주세요.");
		%>
			<input name="flag" value="N" hidden>
		<% 
		} else {
			out.println("사용 가능한 닉네임입니다.");
		%>
			<input name="flag" value="Y" hidden>
		<%
		}
		
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
%>
</form>
<input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flag.value);
		window.close();
	}
</script>