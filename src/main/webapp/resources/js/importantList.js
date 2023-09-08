$(document).ready(function(){

    $.ajax({
        url: "/notice/importantList",
        type: "GET",
        data : {
            important : 1
        },
        success: function(result) {
            $(".importantList").prepend(result);
        }
    })

})
