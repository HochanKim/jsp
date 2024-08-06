<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		margin-top : 20px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<form action="insert-result.jsp" name="board">
		<div>
			<label>제목 : <input type="text" name="title"></label>
		</div>
		<div>
			<label>내용 : <textarea cols="50", rows="10" name="contents"></textarea></label>
		</div>
		<div>
			<button type="button" onclick="fnClick()">저장</button>
		</div>
	</form>
</body>
</html>
<script>
	function fnClick() {
		var form = document.board;
		if(form.title.value == ""){
			alert("제목을 입력해주세요");
			form.title.focus();
			return;
		}
		
		if(form.contents.value == ""){
			alert("내용을 입력해주세요");
			form.contents.focus();
			return;
		} 
		
		alert("저장되었습니다.");
		form.submit();
	}
</script>