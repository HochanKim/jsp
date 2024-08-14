<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="db.jsp" %>
<%
	ResultSet rs = null;
	Statement stmt = null;
	String userId = request.getParameter("userId");
	
	try{
		stmt = conn.createStatement();
		String sql 
		= "SELECT * FROM hmw_user WHERE userId = '"+ userId +"'"; 
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.println("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
		%>
			<input name="flg" value="N" hidden>
		<% 
		} else {
			out.println("사용 가능한 아이디입니다.");
		%>
			<input name="flg" value="Y" hidden>
		<%
		}
		
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
%>
<input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
</script>