<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int a = sum(2, 3);	// 리턴타입 있는 함수
		message();			// 리턴타입 없는 함수
	%>
	<%!
		public int sum(int x, int y){
			// 리턴타입 있는 메소드(return, 파라미터값 필수)
			return x+y;
		}
		
		void message(){
			// 리턴타입 없는 메소드(void형)
			System.out.print("안녕!");
		}
	%>
</body>
</html>