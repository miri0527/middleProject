function deleteValue() {
    let valueArr = new Array()
    let list = $("input[name='chkList']")
    for(let i=0; i<list.length; i++) {
        if(list[i].checked) {
            valueArr.push(list[i].value)
        }
    }
    if(valueArr == 0) {
        alert("삭제하려는 회원을 선택하세요")
    }else {
        let check = confirm("정말 삭제하겠습니까?")

        if(check == true) {
             $.ajax ({
            url : "/manager/memberDelete",
            type : 'POST',
            traditional : true,
    
            data : {
                id : valueArr
            },

            success : function(jdata) {
                
                alert("회원이 삭제되었습니다")
                location.replace("/manager/memberList")
            }
    
        })
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
   



    
    

   
   
