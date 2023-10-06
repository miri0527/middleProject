
$("#button").click("data-filenum", function() {
    let fileNum = $(this).data("filenum")
    let num = $(this).data("num")

    let check = confirm("파일을 삭제하시겠습니까?")

    if(check) {
        $.ajax ({
            type : 'POST',
            url : '/notice/fileDelete',
            data : {
              fileNum : fileNum,
              num : num
            },
            success : function(response) {
                location.reload()
            }
           
        })
    }else {
        return
    }
})