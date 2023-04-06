// 장바구니에서 수량 증가 버튼을 클릭하면 실행되는 함수
$('.btnP').on("click", function () {
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

$(".checkAll").on("click", function(){
    let check = $(this).is(":checked");
    if(check){
        $(".check").prop("checked", true);
    }else{
        $(".check").prop("checked", false);
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

    console.log(check);
    console.log(ea);
    $.ajax({
        type:"POST",
        url : "./cartSelectedPayment",
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
            location.href="/cart/cartPaymentList"
        }
    })
    
})