$(".replyDelete").on("click", "[data-num]", function () {
    let replyNum = $(this).data("num");
    let reply = confirm("댓글을 삭제하시겠습니까?");
        
    if (reply) {
        $.ajax({
            type: 'POST',
            url: '/noticeReply/delete',
            data: {
                replyNum: replyNum
            },
            success: function (response) {
            	alert("댓글이 삭제되었습니다.")
                location.reload();
            }
        });
    } else {
        return;
    }
});

$("#replyUpdate").on("click", ".cancel", function() {
    let cancel = $(this).data("num")

    $(this).parents(".update").remove()

})
