
// 제안서 제출
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
    alert("제안서 제출됐습니다.");
    location.href="index.html";

}

