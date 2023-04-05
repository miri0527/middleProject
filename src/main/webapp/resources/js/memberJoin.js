const memberId = document.getElementById("memberID");
const divId =document.getElementById("divId");
const memberPw = document.getElementById("memberPw");
const memberPw1 = document.getElementById("memberPw1");
const dup = document.getElementById("dup");

let checks=[false,false,false,false,false,false,false];





// email 발송 버튼 클릭 시
$('#mail-Check-Btn').click(function() {
    const email = $('#memberEmail').val() + $('#emaildomain').val();
    const checkInput = $('.mail-check-input');

	$.ajax({
	    type : 'get',
	    url : '/mailCheck?email=' + email,
	    success : function (data) {
	        console.log("data : " +  data);
	        checkInput.prop('disabled', false);
	        code = data;
	        alert('인증번호가 전송되었습니다.');
	        $('#mail-Check-Btn').addClass('d-none'); // 발송 버튼 숨기기
	        $('#mail-Confirm-Btn').removeClass('d-none'); // 확인 버튼 보이기
	    }           
	}); // end ajax
}); // end send email

// 인증번호 확인 버튼 클릭 시
$('#mail-Confirm-Btn').click(function() {
	const inputCode = $('.mail-check-input').val();
	const $resultMsg = $('#mail-check-warn');

	if (inputCode === code) {
	    $resultMsg.html('인증번호가 일치합니다.');
	    $resultMsg.css('color', 'green');
	    $('.mail-check-input').prop('disabled', true);
	    $('#memberEmail, #emaildomain').prop('readonly', true);
	    $('#mail-Check-Btn, #mail-Confirm-Btn').prop('disabled', true); // 버튼 모두 비활성화
	} else {
	    $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
	    $resultMsg.css('color', 'red');
	}
});


memberId.addEventListener("blur",function(){
    if(memberId.value==""){
        memberId.classList.add("is-invalid");
        $("#com").attr("class","invalid-feedback");
        $("#com").text("ID는 필수 입력사항입니다");
        checks[0]=false;
    }
})
memberId.addEventListener("change",function(){
    memberId.classList.add("is-invalid");
    memberId.classList.remove("is-valid");
    $("#com").attr("class","invalid-feedback");
    $("#com").text("중복검사를 해주세요");
    checks[0]=false;
});

dup.addEventListener("click",function(){
    
    
    
    fetch("./memberCheck",{
        method:"POST",
        headers:{"Content-type": "application/x-www-form-urlencoded"},
        body:"id="+memberId.value
    }).then((reponse)=>reponse.text()).then((res)=>{
        
        if(res.trim()=="true"){
            memberId.classList.add("is-valid");
            memberId.classList.remove("is-invalid");
            $("#com").attr("class","valid-feedback");
            $("#com").text("ID를 사용할수 있습니다");
            checks[0]=true;
           
        }else{
            memberId.classList.add("is-invalid");
            memberId.classList.remove("is-valid");
            $("#com").attr("class","invalid-feedback");
            $("#com").text("ID가 중복됩니다");
            checks[0]=false;
        }
    
    })
    
})
memberPw.addEventListener("blur",function(){
    if(memberPw.value.length<4 || memberPw.value.length>12){
        memberPw.classList.add("is-invalid");
        memberPw.classList.remove("is-valid");
        $("#pwCom").attr("class","invalid-feedback");
        $("#pwCom").text("PW는 4~12글자 이내로작성 가능합니다");
        checks[1]=false;
        
    }else{
        
        memberPw.classList.add("is-valid");
        memberPw.classList.remove("is-invalid");
        $("#pwCom").attr("class","valid-feedback");
        $("#pwCom").text("PW를 사용할수 있습니다");
        checks[1]=true;
        
    }
})
memberPw.addEventListener("change",function(){
    memberPw1.classList.add("is-invalid");
    memberPw1.classList.remove("is-valid");
    memberPw1.value="";
    $("#pwCom1").attr("class","invalid-feedback");
    $("#pwCom1").text("PW를 다시 입력하세요");
    checks[2]=false;
});
memberPw1.addEventListener("blur",function(){
    if(memberPw.value == memberPw1.value){
        memberPw1.classList.add("is-valid");
        memberPw1.classList.remove("is-invalid");
        $("#pwCom1").attr("class","valid-feedback");
        $("#pwCom1").text("PW가 일치합니다");
        checks[2]=true;
    }else{
        memberPw1.classList.add("is-invalid");
        memberPw1.classList.remove("is-valid");
        $("#pwCom1").attr("class","invalid-feedback");
        $("#pwCom1").text("PW가 일치하지않습니다");
        checks[2]=false;
    }
})
$("#memberName").blur(function(){
    if($("#memberName").val().length>0){
        checks[3]=true;
    }
    else{
        checks[3]=false;
    }
})
$("#memberAddress1").blur(function(){
    if($("#memberAddress1").val().length>0){
        checks[4]=true;
    }
    else{
        checks[4]=false;
    }
})
$("#memberPhone").blur(function(){
    if($("#memberPhone").val().length>0){
        checks[5]=true;
    }
    else{
        checks[5]=false;
    }
})
$("#memberEmail").blur(function(){
    if($("#memberEmail").val().length>0){
        checks[6]=true;
    }
    else{
        checks[6]=false;
    }
})
$("#btn1").click(function(){
    console.log(checks.includes("false"));
    if(!checks.includes(false)){
        console.log("성공");
        $("#frm").submit();
    }
    else{
        console.log("실패");
        alert("모든 사항을 입력하세요");
    }
})



