<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 이름, 아이디, 패스워드 입력 받아서 저장 -->
	<form action="join-insert.jsp" name="user">	<!-- 'form'태그의 자식요소 버튼을 클릭시, 'form'태그의 'action'속성이 실행 / 값을 다른 페이지로 전달하는 역할이 'action' 속성 -->
		<div>
			아이디 : <input type="text" name="userId">
			<button type="button" onclick="sameCheck()">중복체크</button>
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<div>
			이름 : <input type="text" name="userName">
		</div>
		<div>
			전화번호 : <input type="text" name="phone">
		</div>
		<div>
			성별 : 
			<label><input type="radio" name="gender" value="M">남</label>
			<label><input type="radio" name="gender" value="F">여</label>
		</div>
		<button>저장(form action을 이용)</button> <!-- 'button'태그의 기본타입(default)은 'submit' -->
		<button type="button" onclick="fnSave()">저장(함수를 이용)</button>
		<button type="button" onclick="fnSubmit()">저장(액션값 수정 후 submit)</button>
		<button type="button" onclick="fnInsert()">복습 !!</button>
	</form>
</body>
</html>
<script>
	/* 함수를 이용 */
	function fnSave() {
		var f = document.user;	// 'form'태그의 name 속성을 지정하여 가져오고 'form'태그 영역의 객체화
		location.href="join-insert.jsp?userId="+ f.userId.value +"&pwd="+ f.pwd.value +"&userName="+ f.userName.value;
		// (객체명 -> 객체화한 'form'태그).('input'의 name).('input'에 저장된 value)
	}
	
	/* 액션값 수정 후 submit */
	function fnSubmit() {
		var f = document.user;
		f.action = "join-insert2.jsp";
		f.submit(); // 함수 (submit()) 호출하여 'form'태그의 'input'에 저장한 모든 파라미터를 담아서 보낸다
	}
	
	/* 복습 */
	function fnInsert() {
		var form = document.user;
		form.action = "user-insert.jsp";
		form.submit();
	}
	
	/* 중복체크 */
	function sameCheck() {
		var form = document.user;
		form.action = "id-check.jsp";
		form.submit();
	}
</script>