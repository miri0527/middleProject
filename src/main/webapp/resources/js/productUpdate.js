let idx=0
let param = 'pics'
let count=0
let max=1

// $("#addBtn2").click(() => {
//     if(count >=max) {
//         alert("파일은 최대" + max + "개 까지만 가능합니다")
//         return
//     }

//     count++;

//     let child = '<div class="input-group" id="f1'+idx+'">'
//     child = child + '<input type="file" class="form-control" id="file" aria-describedby="inputGroupFileAddon04" aria-label="Upload" name="'+param+'">'
//     child = child + '<button class="btn btn-outline-secondary del" type="button" data-del2-id="f'+idx+'">X</button>'

//     idx++

//     $('#fileUpdate').append(child)
// })

$('#fileUpdate').on('click', '.del', function(e) {
    $(this).parent().remove()
    count--
})

if($("#fileValue").val() != '') {
    $("#file").click(function() {
        alert("파일은 최대" + max + "개 까지만 가능합니다.")
        location.reload()
    })
    
}

$('#submit2').click(() => {
    if(confirm("상품을 수정하시겠습니까?") == true) {
      
    }else {
        return false
    }
})

$("#button").click("data-filenum", function() {
    let fileNum = $(this).data("filenum")
    let productNum = $(this).data("productnum")

    console.log(productNum)

    let check = confirm("파일을 삭제하시겠습니까?")

    if(check) {
        $.ajax ({
            type : 'POST',
            url : '/product/fileDelete',
            data : {
                fileNum : fileNum,
                productNum : productNum
            },
            success : function(response) {
                alert("파일이 삭제되었습니다.")
                location.reload()
            }
        })
    }
})
