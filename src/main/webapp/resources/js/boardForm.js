
//qna 답번
$(".delete").click("data-replynum", function() {
    let replyNum = $(this).data("replynum")
    let num = $(this).data("num")

    let check = confirm("정말 삭제하시겠습니까?")

    if(check) {
     $.ajax({
        type : 'POST',
        url : '/qnaReply/delete',
        data : {
            replyNum : replyNum,
            num : num
        },
        success: function (response) {
            alert("댓글이 삭제되었습니다.")
            location.reload();
        }
     })
    
    }else {
        return;
    }
   	
})

//qna
$(".delete2").click("data-num", function() {
    let num = $(this).data("num")

    let check = confirm("정말 삭제하시겠습니까?")

    if(check) {
     $.ajax({
        type : 'POST',
        url : '/qna/delete',
        data : {
            num : num
        },
        success: function (response) {
            alert("댓글이 삭제되었습니다.")
            location.reload();
        }
     })
    
    }else {
        return;
    }
})

//review
$(".delete3").click("data-num", function() {
    let num = $(this).data("num")

    let check = confirm("정말 삭제하시겠습니까?")

    if(check) {
     $.ajax({
        type : 'POST',
        url : '/review/delete',
        data : {
            num : num
        },
        success: function (response) {
            alert("댓글이 삭제되었습니다.")
            location.reload();
        }
     })
    
    }else {
        return;
    }
})



