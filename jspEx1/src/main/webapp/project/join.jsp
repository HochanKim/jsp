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
	<form name="user" class="new-join" method="post">	
		<div>
			<label>아이디</label>
            <input type="text" name="userId">
			<button type="button" onclick="idCheck()">중복체크</button>
		</div>
		<div>
			<label>비밀번호</label>
            <input type="password" name="pwd" id="pwd">
		</div>
		<div>
			<label>비밀번호 확인</label>
            <input type="password" name="pwdCheck" id="pwdCheck">
		</div>
        <div>
			<label>닉네임</label>
            <input type="text" name="nickName">
			<button type="button" onclick="nickCheck()">중복체크</button>
		</div>
		<div>
			<label>이름</label>
            <input type="text" name="userName">
		</div>
		<div>
			<label>전화번호</label>
            <input type="text" name="phone">
		</div>
		<div>
			<label>가입목적</label>
            <textarea cols="100" rows="20" name="reason"></textarea>
		</div>
		<button type="button" onclick="fnInsert()">가입하기</button>
	</form>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	
	// 필수입력 메소드
    function fnInsert() {
        var form = document.user;

        // 아이디
        if(form.userId.value == ""){
            alert("아이디를 입력해주세요");
            form.userId.focus();
            return;
        } else if(form.userId.value.length <= 7 || form.userId.value.length > 12){
            alert("아이디는 최소 8글자 ~ 12글자 입니다.");
            return;
        } else if(!check2){
        	alert("아이디 중복체크 해주세요");
            return;
        }
        
        // 비밀번호
        if(form.pwd.value == ""){
            alert("비밀번호를 입력해주세요");
            form.pwd.focus();
            return;
        } else if(form.pwd.value.length < 8){
            alert("비밀번호는 최소 8글자 입니다.");
            return;
        } else if(form.pwdCheck.value == ""){
            alert("비밀번호 일치여부 확인바랍니다.");
            return;
        } else if(form.pwd.value != form.pwdCheck.value){
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }
        
        // 닉네임
        if(form.nickName.value == ""){
            alert("닉네임을 설정해주세요");
            form.nickName.focus();
            return;
        } else if(form.nickName.value.length < 2){
            alert("닉네임은 최소 2글자 이상입니다.");
            return;
        } 
        
        // 회원이름
        if(form.userName.value == ""){
            alert("성함을 입력해주세요");
            form.userName.focus();
            return;
        }

        form.action = "join-insert.jsp";
        form.submit();
    }
	

	// 중복체크 확인 팝업
	function idCheck(){
		check1 = true;
		var form = document.user;
		if(form.userId.value == "" || form.userId.value.length < 0){
			alert("아이디를 먼저 입력해주세요")
			form.userId.focus();
		} else {
			window.open("idCheck.jsp?userId="+form.userId.value, "check", "width=500, height=300");
		}
	}
	function nickCheck(){
		check1 = true;
		var form = document.user;
		if(form.nickName.value == "" || form.nickName.value.length < 0){
			alert("닉네임을 먼저 입력해주세요")
			form.nickName.focus();
		} else {
			window.open("nickCheck.jsp?nickName="+form.nickName.value, "check", "width=500, height=300");
		}
	}
	
	// 중복체크 리턴 결과
	function getReturn(val){
		if(val == "Y"){
			check2 = true;
		} else {
			check2 = false;
		}
	}
</script>