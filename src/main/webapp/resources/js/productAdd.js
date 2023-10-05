let idx=0
let param='pics'
let count=0
let max=1

$("#addBtn").click(() => {
    if(count >=max) {
        alert("파일은 최대" + max + "개 까지만 가능합니다")
        return
    }

    count++;

    let child = '<div class="input-group" id="f'+idx+'">'
    child = child + '<input type="file" class="form-control" id="file" aria-describedby="inputGroupFileAddon04" aria-label="Upload" name="'+param+'">'
    child = child + '<button class="btn btn-outline-secondary del" type="button" data-del-id="f'+idx+'">X</button>'

    idx++

    $('#fileList').append(child)
})

$('#fileList').on('click', '.del', function(e) {
    $(this).parent().remove()
    count--
})

if($("#productName").blur(function() {
    if( $("#productName").val() ==  '') {
        $("#productNameResult").html("<p style='color : red;'>상품명은 필수 사항입니다.</p>")
    }else {
        $("#productNameResult").html("")
    }
}))

if($("#file").blur(function() {
    if($("#file").val() == '') {
        $("#fileResult").html("<p style='color : red;'>파일 첨부는 필수 사항입니다.</p>")
    }else {
        $("#fileResult").html("")
    }
}))

$('#submit').click((function() {
    if($("#productName").val() !='' && $("#file").val() !='') {
        let check =  confirm("상품을 등록하시겠습니까?")

        if(check == true) {
            console.log("test")
            $("#submit").attr('type','submit')
        }else {
            return;
        }
    } else {
        $("#productNameResult").html("<p style='color : red;'>상품명은 필수 사항입니다.</p>")
        $("#fileResult").html("<p style='color : red;'>파일 첨부는 필수 사항입니다.</p>")
      
    }
}))
   



