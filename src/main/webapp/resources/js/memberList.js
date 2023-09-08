let allRole = document.getElementById("allRole")
let memberRole = document.getElementById("memberRole")
let sellerRole = document.getElementById("sellerRole")
let adminRole = document.getElementById("adminRole")


function deleteValue() {
    let check = [];
    $(".chkList").each(function(i, v){
        if($(v).is(":checked")){
            check.push($(v).attr("data-id"));
        }
    })

    if(check.length == 0) {
        alert("삭제하려는 회원을 선택하세요")
    }else {
        let check2 = confirm("정말 삭제하겠습니까?")

        if(check2) {
             $.ajax ({
            url : "/manager/memberDelete",
            type : 'POST',
            traditional : true,
    
            data : {
                chkList : check
            },

            success : function(jdata) {
                
                alert("회원이 삭제되었습니다")
                location.replace("/manager/memberList")
            }
    
        })
        }else {
            return false;
        }

       
    }
   
}



$(document).ready(() => {
    let checkArr = []

    $('input:checkbox[class="check"]').click(() => {
        allRole.checked = false
        $('input:checkbox[name="roleName"]:checked').each(function(i) {
            checkArr.push($(this).val())
        }) 
            
        location.href = "memberList?roleName=" + checkArr
      
    })
   
})






$("#refuse").click(() => {
    let check3 =  window.confirm("정말 거절하시겠습니까?");

    if(check3) {
        $("#application").attr("action", "../member/sellerRefuse")
        $("#application").attr("method","post")
        
    }else {
        return false
    }
})
    
    

   
   
