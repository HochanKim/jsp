<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/project/css/index.css">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<!-- 'index.jsp'와 연동  -->
<section class="contact-sec">
        <div class="wrap">
            <form name="contact" class="contact">
                <div>
                    <h2>Contacts</h2>
                    <label>
                        <p>성함(법인명)<span>*</span></p> 
                        <input type="text" name="name" class="input-text">
                    </label>
                </div>
                <div>
                    <label>
                        <p>연락처<span>*</span></p> 
                        <input type="text" name="phone" placeholder="010xxxxxxxx or 031-xxx-xxxx" class="input-text">
                    </label>
                </div>
                <div>
                    <label>
                        <p>대표메일<span>*</span></p> 
                        <input type="text" name="email" placeholder="abc@example.com" class="input-text">
                    </label>
                </div>
                <div>
                    <label>
                        <p>상세내용</p> 
                        <textarea cols="80" rows="15" name="q_text" class="q_text"></textarea>
                    </label>
                </div>
                <div>
                    <p>제작방식<span>*</span></p>  
                    <label><input class="radio" type="radio" name="classification" value="picture">사진촬영</label>
                    <label><input class="radio" type="radio" name="classification" value="allround">영상제작(종합)</label>
                    <label><input class="radio" type="radio" name="classification" value="shot">영상촬영</label>
                    <label><input class="radio" type="radio" name="classification" value="planning">영상기획</label>
                    <label><input class="radio" type="radio" name="classification" value="edit">영상편집</label>
                    <label><input class="radio" type="radio" name="classification" value="droneshot">드론촬영</label>
                </div>
                <div>
                    <p>제작목적<span>*</span></p>
                    <label><input class="radio" type="radio" name="purpose" value="pr">제품/회사 홍보</label>
                    <label><input class="radio" type="radio" name="purpose" value="mv">뮤직비디오</label>
                    <label><input class="radio" type="radio" name="purpose" value="recode">행사기록</label>
                    <label><input class="radio" type="radio" name="purpose" value="conts">영화/예능 콘텐츠</label>
                    <label><input class="radio" type="radio" name="purpose" value="viral">유튜브/SNS 바이럴</label>
                    <label><input class="radio" type="radio" name="purpose" value="sky">항공샷</label>
                    <label><input class="radio" type="radio" name="purpose" value="etc">기타</label>
                </div>
                <div>
                    <button type="button" onclick="fnContact()" class="submit">제출하기</button>
                </div>
            </form>
        </div>
</section>
</body>
</html>
<script>
    function fnContact() {
        // js 변수 설정
        var form = document.contact;
        var regPhone = /^(01[016789]|02|0[3-9]{1}[0-9]{1})[-]?\d{3,4}[-]?\d{4}$/; 	// 전화번호 정규표현식 (하이픈 선택적용)
        var regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 			// 이메일 정규표현식

        // 필수입력 유도 (text)\
        // 이름
        if(form.name.value == ""){
            alert("이름을 입력해주세요");
            form.name.focus();
            return;
        }
        
        // 전화번호
        if(form.phone.value == ""){
            alert("전화번호를 입력해주세요");
            form.phone.focus();
            return;
        } else if(!regPhone.test(form.phone.value)) {
        	alert("잘못된 전화번호를 입력했습니다. \n해외 거주자는 이메일 주소 혹은 상세내용란에 메신저, SNS 아이디를 남겨주세요");
            form.phone.focus();
            return;
        }
        
        // 이메일
        if(form.email.value == ""){
            alert("이메일을 입력해주세요");
            form.email.focus();
            return;
        } else if(!regEmail.test(form.email.value)) { 	
        	alert('형식에 맞지 않는 이메일입니다. 다시 입력해 주세요');     
        	return;
        }

        // 필수입력 유도 (체크)
        var classf = $("input[name='classification']").is(':checked')
        var purp = $("input[name='purpose']").is(':checked')
        if(!classf || !purp) {
            alert("제작방식 및 목적을 선택해주세요");
            return;
        }

        form.action = "contact-result.jsp";
		form.submit();
    }
</script>