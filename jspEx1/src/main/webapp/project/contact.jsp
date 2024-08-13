<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<section class="contact-sec">
        <div class="wrap">
            <form name="contact" class="contact">
                <div>
                    <h2>Contacts</h2>
                    <label>
                        <p>성함(법인명)</p> 
                        <input type="text" name="name" class="input-text">
                    </label>
                </div>
                <div>
                    <label>
                        <p>연락처</p> 
                        <input type="text" name="phone" placeholder="010-xxxx-xxxx or 02-xxxx-xxxx" class="input-text">
                    </label>
                </div>
                <div>
                    <label>
                        <p>대표메일</p> 
                        <input type="text" name="email" placeholder="abc@example.com" class="input-text">
                    </label>
                </div>
                <div>
                    <label>
                        <p>상세내용</p> 
                        <textarea cols="100" rows="20" name="q_text"></textarea>
                    </label>
                </div>
                <div>
                    <label>
                        <p>제작방식</p>  
                        <input type="radio" name="classification" value="picture">사진촬영
                        <input type="radio" name="classification" value="allround">영상제작(종합)
                        <input type="radio" name="classification" value="shot">영상촬영
                        <input type="radio" name="classification" value="planning">영상기획
                        <input type="radio" name="classification" value="edit">영상편집
                        <input type="radio" name="classification" value="droneshot">드론촬영
                    </label>
                </div>
                <div>
                    <label>
                        <p>제작목적</p>
                        <input type="radio" name="purpose" value="pr">제품/회사 홍보
                        <input type="radio" name="purpose" value="mv">뮤직비디오
                        <input type="radio" name="purpose" value="recode">행사기록
                        <input type="radio" name="purpose" value="conts">영화/예능 콘텐츠
                        <input type="radio" name="purpose" value="viral">유튜브/SNS 바이럴
                        <input type="radio" name="purpose" value="sky">항공샷
                        <input type="radio" name="purpose" value="etc">기타
                    </label>
                </div>
                <div>
                    <button type="button" onclick="fnContact()">제출하기</button>
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

        // 필수입력 유도 (text)
        if(form.name.value == ""){
            alert("이름을 입력해주세요");
            form.name.focus();
            return;
        }
        if(form.phone.value == ""){
            alert("전화번호를 입력해주세요");
            form.phone.focus();
            return;
        }
        if(form.email.value == ""){
            alert("이메일을 입력해주세요");
            form.email.focus();
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