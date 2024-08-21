<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");%>
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
		// id와 pwd 값을 전달 받음
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
				// 로그인 팝업창 얼럿
				out.println("<script>alert('성공적으로 로그인 하였습니다.');");
				// 팝업창 닫기
				out.println("window.close();");
				// 팝업 띄운 부모창(header.jsp, 객체 opener 사용) 새로고침 
				out.println("opener.location.reload(true);</script>");
				
				
				if(rs.getInt("count") >= 5){
					// 비밀번호 불일치 5번 이상일 경우
					out.println("<script>alert('로그인 시도 회수를 초과했습니다.');");
					out.println("history.go(-1); </script>");
					return;
					
				} else {
					// 로그인 성공, 세션 저장
					session.setAttribute("userId", rs.getString("userId"));
					session.setAttribute("staffYN", rs.getString("staffYN"));
					// 세션 유지 기간 설정, 초 단위
					session.setMaxInactiveInterval(60); 	// 1분간 아이디 유지
					
					// 로그인 실패 카운트 누적 초기화
					sql = "UPDATE hmw_user SET count = '0' WHERE userId = '" + userId + "'";
					stmt.executeUpdate(sql);
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