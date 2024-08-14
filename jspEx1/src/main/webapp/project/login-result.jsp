<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		try{
			stmt = conn.createStatement();
			String sql 
			= "SELECT * FROM hmw_user WHERE userId = '"+ userId +"' AND pwd = '"+ userPwd +"'"; 
			rs = stmt.executeQuery(sql);
			
			/* 아이디, 비밀번호 일치 여부 */
			if(rs.next()) {
				// 아이디, 비밀번호 모두 정상적인 로그인
				out.println("정상적인 로그인");
				if(rs.getInt("count") >= 5){
					// 비밀번호 불일치 5번 이상일 경우
					out.println("<script>alert('로그인 시도 회수를 초과했습니다.');");
					out.println("history.go(-1); </script>");
					return;
				} else {
					// 로그인 성공, 세션 저장
					session.setAttribute("userId", rs.getString("userId"));
					session.setAttribute("staffYN", rs.getString("staffYN"));
					/* response.sendRedirect(); */
				}
				
			} else {
				
				String sqlId = "SELECT * FROM hmw_user WHERE userId = '"+ userId +"'";
				rs = stmt.executeQuery(sqlId);
				
				if(rs.next()){
					/* 아이디, 비밀번호가 모두 데이터에 존재 */
					// 아이디는 존재하지만 비밀번호가 틀릴 경우
					if(rs.getInt("count") >= 5){
						// 비밀번호 불일치 5번 이상일 경우
						out.println("<script>alert('로그인 시도 회수를 초과했습니다.');");
						out.println("history.go(-1); </script>");
						return;
					} else {
						// 비밀번호 불일치
						out.println("<script>alert('비밀번호를 확인해주세요.');");
						out.println("history.go(-1); </script>");
						sqlId = "UPDATE hmw_user SET count = count + 1 WHERE userId = '" + userId + "'";
						stmt.executeUpdate(sqlId);
					}
					
				} else {
					// 아이디가 존재하지 않을 경우
					out.println("<script>alert('아이디가 존재하지 않습니다.');");
					out.println("history.go(-1); </script>");
					return;
				}
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}			
	%>
</body>
</html>