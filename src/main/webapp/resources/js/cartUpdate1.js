
IMP.init(""); // 예: imp00000000a 값 들어가야함


$('.btnP').on("click", function () {
    // 장바구니에서 수량 증가 버튼을 클릭하면 실행되는 함수
    // 현재 수량을 가져와 1을 더한 후 input 태그에 적용
    let val = parseInt($(this).prev().val(), 10) + 1;
    $(this).prev().val(val);
    // 상품 가격을 가져와 현재 수량과 곱한 총 가격을 계산하고 총 가격을 표시
    let price = parseInt($(this).parent().parent().prev().html(), 10);
    let totalPrice = val * price;
    $(this).parent().parent().next().html(totalPrice);

    // 주문 번호와 총 가격, 상품 수량을 서버로 전송하여 업데이트
    let orderNum = parseInt($(this).parent().parent().prev().prev().children(".orderNum").html(), 10);
    $.ajax({
        type: "POST",
        url: "./cartUpdate",
        data: {
            orderNum: orderNum,
            totalPrice: totalPrice,
            productEa: val
        }
    })
})

$('.btnN').on("click", function(){
    let val = parseInt($(this).next().val(),10) - 1;
    if(val > 0){
        $(this).next().val(val);
        let price = parseInt($(this).parent().parent().prev().html(), 10);
        let totalPrice = val * price;
        $(this).parent().parent().next().html(totalPrice);
        
        let orderNum = parseInt($(this).parent().parent().prev().prev().children(".orderNum").html(), 10);
        $.ajax({
            type:"POST",
            url : "./cartUpdate",
            data:{
                orderNum : orderNum,
                totalPrice : totalPrice,
                productEa : val
            }
        })
    }
})

$('.cartDelete').on("click", function(){
    
    let orderNum = parseInt($(this).parent().prev().prev().prev().prev().children(".orderNum").html(), 10);
    $.ajax({
        type:"POST",
        url : "./cartDelete",
        data:{
            orderNum : orderNum
        }
        ,success : function(){
            location.href="/cart/cartList"
        }
    })
})


$('.cartPayment').on("click",function(){
    
    let ea = $(this).parent().prev().prev().children().children(".cart-plus-minus-box").val();
    let orderNum = parseInt($(this).parent().prev().prev().prev().prev().children(".orderNum").html(), 10);
    let optionNum = parseInt($(this).parent().prev().prev().prev().prev().children(".optionNum").html(), 10);
    console.log(orderNum);
    $.ajax({
        type:"POST",
        url : "./cartPayment",
        data:{
            orderNum : orderNum,
            productEa : ea,
            optionNum : optionNum
        }
        ,success : function(){
            location.href="/cart/cartList"
        }
    })
})

$('.cartPaymentCancel').on("click",function(){
    let ea = $(this).parent().prev().prev().html().trim();
    let orderNum = parseInt($(this).parent().prev().prev().prev().prev().children(".orderNum").html(), 10);
    let optionNum = parseInt($(this).parent().prev().prev().prev().prev().children(".optionNum").html(), 10);
    console.log(ea);
    $.ajax({
        type:"POST",
        url : "./cartPaymentCancel",
        data:{
            orderNum : orderNum,
            productEa : ea,
            optionNum : optionNum

        }
        ,success : function(){
            location.href="/cart/cartPaymentList"
        }
    })
})

$('.check').each(function(i,v){
    $(v).on('click', function(){
        if($(this).is(":checked")){
            let total = $(".order-total-price").html()*1;
            
            total = total + $(this).parent().next().next().next().next().html()*1;
    
            console.log($(this).parent().next().next().next().next());
    
            $(".order-total-price").html(total);
            
            let check;
            
            $('.check').each(function(i,v){
                if($(v).is(":checked")){
                    check = true;
                }else{
                    check = false;
                    return check;
                }

            })

            if(check){
                $('.checkAll').prop('checked', true);
            }
        }else{
            let total = $(".order-total-price").html()*1;
            
            total = total - $(this).parent().next().next().next().next().html()*1;
           
            $(".order-total-price").html(total);

            $('.checkAll').prop('checked', false);
        }
    })
})

$(".checkAll").on("click", function(){
    let check = $(this).is(":checked");
    let total = $(".order-total-price").html()*1;
    if(check){
        $(".check").each(function(i,v){
            $(v).prop("checked", true);
            total = total + $(v).parent().next().next().next().next().html()*1;
            $(".order-total-price").html(total);
        })
    }else{
        $(".check").each(function(i,v){
            $(v).prop("checked", false);
            total = total - $(v).parent().next().next().next().next().html()*1;
            $(".order-total-price").html(total);
        })
        
    }
})

$(".selectedDelete").on("click", function(){
    let check = [];
    $(".check").each(function(i, v){
        if($(v).is(":checked")){
            check.push($(v).attr("data-orderNum"));
        }
    })

    console.log(check);
    $.ajax({
        type:"POST",
        url : "./cartSelectedDelete",
        traditional : true,
        data:{
            check : check
        }
        ,success : function(){
            location.href="/cart/cartList"
        }
    })
    
})


$(".selectPayment").on("click", function(){
    let check = [];
    let ea = [];
    let opNum = [];
    
    $(".check").each(function(i, v){
        if($(v).is(":checked")){
            check.push($(v).attr("data-orderNum"));
            ea.push($(v).parent().next().next().next().children().children(".cart-plus-minus-box").val());
            opNum.push($(v).parent().next().children(".optionNum").html());
            
        }
    })
    let rTotal = $(".order-total-price").html()*1;
    let total = 100; //결제 실험용 amount
    let payNum = 8;
    function requestPay(){
        //사전 검증 방식 -> 선택된 것들의 값이 db에 입력된 값과 같은지 확인하고 결제창 띄우기
        $.ajax({
            url: "/cart/paymentCheck",
            method: "post",
            traditional : true,
            data: {
                check : check,
                amount: rTotal, // 결제 예정금액
            },success : function(data){
                console.log(data[0]);
                if(data[0] == 1){
                    IMP.request_pay({
                        pg : 'html5_inicis.INIpayTest', //테스트 시 html5_inicis.INIpayTest 기재 
                        pay_method : 'card',
                        merchant_uid: payNum, //상점에서 생성한 고유 주문번호
                        name : data[1],
                        amount : total,
                        buyer_email : data[2],
                        buyer_name : data[3],
                        buyer_tel : '010-1234-5678',   //필수 파라미터 입니다.
                        buyer_addr : data[5],
                        buyer_postcode : '123-456',
                        m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}',
                        escrow : true, //에스크로 결제인 경우 설정
                        vbank_due : 'YYYYMMDD',
                        bypass : {
                            acceptmethod : "noeasypay", // 간편결제 버튼을 통합결제창에서 제외(PC)
                            P_RESERVED: "noeasypay=Y",  // 간편결제 버튼을 통합결제창에서 제외(모바일)
                            acceptmethod: 'cardpoint',  // 카드포인트 사용시 설정(PC)
                            P_RESERVED : 'cp_yn=Y'     // 카드포인트 사용시 설정(모바일)
                        },
                        period : {
                           from : "20200101", //YYYYMMDD
                           to : "20201231"   //YYYYMMDD
                        }
                    }, function (rsp) { // callback
                        $.ajax({
                            type : "POST",
                            url : "/cart/verifyIamport/" + rsp.imp_uid 
                        }).done(function(data){
                            
                            console.log(data);
                            
                            // 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
                            if(rsp.paid_amount == data.response.amount){
                                alert("결제 및 결제검증완료");
                                if (rsp.success) {
                                    console.log(rsp);
                                    $.ajax({
                                        type:"POST",
                                        url : "./setPayment",
                                        traditional : true,
                                        data:{
                                            check : check,
                                            ea : ea,
                                            opNum : opNum
                                        }
                                        ,success : function(){
                                            location.href="/cart/cartList"
                                        }
                                    })
                                } else {
                                    console.log(rsp);
                                    location.href="/cart/cartList"
                                }
                            } else {
                                alert("결제 실패");
                            }
                        });
                        
                    });
                }else{
                    alert("값이 이상합니다.")
                }
            }
        });
        
    }
    

    requestPay();
    
    


    
    
})




$(".selectPaymentCancel").on("click", function(){
    let check = [];
    let ea = [];
    let opNum = [];
    $(".check").each(function(i, v){
        if($(v).is(":checked")){
            check.push($(v).attr("data-orderNum"));
            ea.push($(v).parent().next().next().next().html().trim());
            opNum.push($(v).parent().next().children(".optionNum").html());
        }
    })
    console.log(check);
    console.log(ea);
    $.ajax({
        type:"POST",
        url : "./cartSelectedPaymentCancel",
        traditional : true,
        data:{
            check : check,
            ea : ea,
            opNum : opNum
        }
        ,success : function(){
            location.href="/cart/cartList"
        }
    })
    
})