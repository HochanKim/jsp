<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body>
	<%!
	// 선언문
		int i = 0;
		String name = "홍길동";
	%>
	<!-- html 주석 -->
	<%-- jsp 주석 --%>
	<%
	// 스크립틀릿
		for(i=1; i<=10; i++){
			/* System.out.println(i); */
			out.println("<h2>" + i + "</h2>");
		}	
	%>
	<h1>
		<%= /* 표현문 */ name %>
	</h1>
</body>
</html>