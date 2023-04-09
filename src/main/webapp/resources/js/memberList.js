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
    // const frm = new FormData();

    // frm.append

    
   $("#allRole").change(() => {

    
    $('input:checkbox[name="roleName"]:checked').each(function(i) {
        checkArr.push($(this).val())
    }) 
        
    
    location.href = "memberList?roleName=" + checkArr
        
   })


   $("#memberRole").change(() => {
        if($("#memberRole").is(":checked")) {
          

        }
   })

   $("#sellerRole").change(() => {
        if($("#sellerRole").is(":checked")) {
            console.log("seller")
        }
   })

   $("#adminRole").change(() => {
        if($("#adminRole").is(":checked")) {
            console.log("admin")
        }
   })

   
}) 
   

$("#refuse").click(() => {
    let check =  window.confirm("정말 거절하시겠습니까?");

    if(check) {
        $("#application").attr("action", "../member/sellerRefuse")
        $("#application").attr("method","post")
        
    }else {
        return false
    }
})
    
    

   
   
