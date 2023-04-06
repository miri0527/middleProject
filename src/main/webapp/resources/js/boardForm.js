//BoardForm.js
// update버튼을 누르면 전송하면 되고(submit) , delete버튼을 누르면 type="액션의주소를바꾸고 메서드형식을 post로"

const del = document.getElementById("delete");
const frmde = document.getElementById("frmde");



del.addEventListener("click", function(e){
    //attr = document.createAttribute("type")
    //attr.value=""
    let check = window.confirm("정말 삭제하시겠습니까?");
    if(check){
    frmde.setAttribute("action","./delete");
    frmde.setAttribute("method","post");
    frmde.submit();
    }
});





