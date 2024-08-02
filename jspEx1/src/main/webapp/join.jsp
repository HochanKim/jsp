<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action="join_result.jsp" method="get"> <!-- 데이터를 처리할 페이지를 'form'태그의 'action'속성에 작성한다. -->
		<div>아이디 : <input type="text" name="userId"></div>	<!-- 'input'태그에 'name'속성을 명시하지 않으면 데이터 전송이 불가능하다 -->
		<div>비밀번호 : <input type="password" name="pwd"></div>
		<div>이름 : <input type="text" name="userName"></div>
		<div>
			<label><input type="radio" value="M" name="gender">남자</label>
			<label><input type="radio" value="F" name="gender">여자</label>
		</div>
		<!-- <button type="submit">회원 가입</button> -->
		<input type="submit" value="회원 가입"> <!-- 'input'태그의 'type'에 "submit"은 'action'에 링크된 데이터 처리 페이지로 보내주는 기능이 있다. -->
	</form>
</body>
</html>