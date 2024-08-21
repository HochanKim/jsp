<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/index.css">
<title>Insert title here</title>
</head>
<body>
<!-- 'header.jsp' or 'login.jsp'에서 이동 -->
	<form name="user" class="new-join" method="post">	
		<div>
			<label>아이디<span>*</span></label>
            <input type="text" name="userId">
			<button type="button" onclick="idCheck()">중복체크</button>	<!-- 클릭시 'idCheck.jsp'로 정보 전달 -->
		</div>
		<div>
			<label>비밀번호<span>*</span></label>
            <input type="password" name="pwd" id="pwd">
		</div>
		<div>
			<label>비밀번호 확인<span>*</span></label>
            <input type="password" name="pwdCheck" id="pwdCheck">
		</div>
        <div>
			<label>닉네임<span>*</span></label>
            <input type="text" name="nickName">
			<button type="button" onclick="nickCheck()">중복체크</button>	<!-- 클릭시 'idCheck.jsp'로 정보 전달 -->
		</div>
		<div>
			<label>이름<span>*</span></label>
            <input type="text" name="userName">
		</div>
		<div>
			<label>전화번호</label>
            <input type="text" name="phone">
		</div>
		<div>
			<label>가입목적</label>
            <textarea cols="60" rows="15" name="reason"></textarea>
		</div>
		<button type="button" onclick="fnInsert()" class="insert">가입하기</button>	<!-- 클릭시 'join-insert.jsp'로 정보 전달 -->
	</form>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	
	// 필수입력 메소드
    function fnInsert() {
        var form = document.user;
        var regId =  /^[a-zA-Z0-9]*$/;	// 아이디 정규표현식(영문, 숫자만 허용)
        // var password = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;	// 비밀번호 정규표현식 (영문, 숫자, 특수문자)

        // 아이디
        if(form.userId.value == ""){
            alert("아이디를 입력해주세요");
            form.userId.focus();
            return;
        } else if(!check2){
        	alert("아이디 중복체크 해주세요");
            return;
        } else if(form.userId.value.length <= 5 || form.userId.value.length > 12){
            alert("아이디는 최소 5글자 ~ 12글자 입니다");
            return;
        } else if(!regId.test(form.userId.value)){
        	alert("아이디는 영문, 숫자로만 생성이 가능합니다");
            form.userId.focus();
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