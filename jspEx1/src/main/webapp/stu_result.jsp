<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="database.jsp"%>	
	<%	
		String stuNo = request.getParameter("stuNo");
		// (???) stu_info.jsp에 있는 stuNo를 어떻게 가져오는가? => 'String 객체명 = request.getParameter("stuNo");' 객체를 생성해서 가져온다
		ResultSet rs = null;
		Statement stmt = null;	/* 쿼리를 호출하는 객체 */
		
		try{
			stmt = conn.createStatement();
			String querytext 
			= "select * from student where stu_no = '" + stuNo + "'"; 
			rs = stmt.executeQuery(querytext);	// 쿼리를 담아서 보내는 역할
			
			if(rs.next()){
				out.println(rs.getString("stu_no") + "<br>" 
				+ rs.getString("stu_name") + "<br>" 
				+ rs.getString("stu_dept") + "<br>" 
				+ rs.getString("stu_gender"));
			} else {
				out.println("해당 학생이 존재하지 않습니다.");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>