

function deleteValue() {
    let check = [];
    $(".chkList").each(function(i, v){
        if($(v).is(":checked")){
            check.push($(v).attr("data-productNum"));
        }
    })


    if (check.length == 0) { // 삭제할 상품이 선택되지 않았으면
        alert("삭제하려는 상품을 선택하세요") // 알림창 띄움
    } else {
        let check2 = confirm("정말 삭제하시겠습니까?") // 삭제 여부를 묻는 confirm 창 띄움

        $.ajax({ // ajax를 이용해 서버에 삭제 요청을 보냄
            url: "./delete", // 요청을 보낼 URL
            type: 'POST', // POST 방식으로 요청을 보냄
            traditional: true, // 배열 형태의 데이터를 전송할 때 사용하는 옵션
            data: {
                chkList : check, // 삭제할 상품 번호를 담은 배열을 서버에 전송
            },
            success: function () { // 요청이 성공하면 실행될 함수
                    alert("상품이 삭제되었습니다") // 알림창 띄움
                    location.replace("./memberProductList") // 상품 목록 페이지로 이동
                
                
            }
        })

    }

}
