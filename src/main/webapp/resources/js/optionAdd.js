const frm = document.getElementById("frm");

let count=1;
let jsoncount=1;
let count2 = 1;
let count3 = 1;
    
    

$(".oi").click(function(){
    count++;
    let depth = 0;
    let a= 
    '<div class="op'+ count +'">'
    +'OptionName:<input type="text" data-depth="'+ depth +'" name="optionName" id="optionName" class="optionName'+ depth +'" >'
    +'OptionValue :<input type="text" data-depth="'+ depth +'" name="optionValue" class="optionValue">'//count
    +'<button type="button" class="opc" data-count="'+ count +'">새로운 옵션</button>'
    +'<button type="button" class="opdd">옵션 삭제</button>'
    +'</div>'
    $(".opi").append(a);
})

let va='<input type="text" name="optionValue">'
$(".op").click(function(){
    
})

$(document).on("click",".opv",function(e){
    
    
    $(this).before(va);
    
})


$("#frm").on("click",".opc",function(e){
    console.log("11")
    
    let depth = 1;
    let na=
    '<div class="opa offset-md-2">'
    +'OptionName:<input type="text" data-depth="'+ depth +'" name="optionName" id="optionName" class="optionName'+ depth +'">'
    +'OptionValue :<input type="text" data-depth="'+ depth +'" name="optionValue" class="optionValue">'//'+ 10*$(this).attr('data-count')+$(this).attr('data-count') +'
    +'<button type="button" class="opcii" data-count="'+ 10*$(this).attr('data-count') +'">새로운 옵션</button>'
    +'<button type="button" class="opd">옵션 삭제</button>'
    +'</div>'
    $(this).parent().append(na);
    count2++;
})


$("#frm").on("click",".opcii",function(e){
    let depth = 2;
    let nas=
    '<div class="opb offset-md-1">'
    +'OptionName:<input type="text" data-depth="'+ depth +'" name="optionName" id="optionName" class="optionName'+ depth +'">'
    +'OptionValue :<input type="text" data-depth="'+ depth +'" name="optionValue" class="optionValue">'//'+ 10*$(this).attr('data-count')+$(this).attr('data-count') +'
    +'Price :<input type="text" data-depth="'+ depth +'" name="price" class="price">'
    +'Stock :<input type="text" data-depth="'+ depth +'" name="stock" class="stock">'
    +'<button type="button" class="opd">옵션 삭제</button>'
    +'</div>';  
    
    
    $(this).parent().append(nas);
    count3++;
   
})
$(document).on("click",'.opd',function(){
    

    $(this).parent().remove();
    
})
$(document).on("click",'.opdd',function(){
    if(count ==1){
        alert("옵션은 최소 한개이상 포함되어야합니다");
        return;
    }
    $(this).parent().remove();
    count--;
})
$("#btn").click(function(){
    const depth0Value = document.get
    let jsonArr = 
    [
        {"optionName" : $("#idx1").val(), "optionValue" : $(".idx2").val(),sub:[{"optionName":"size","optionValue":128},{"optionName":"size","optionValue":64}]},
        
        
    ]


    $("#json1").val(JSON.stringify(jsonArr));
    $("#frm").submit();
})


$(document).on("focusout", '.optionName0', function(){
    
    if($(this).attr('data-depth') == 0){
        
        $('.optionName0').val($(this).val());
    }

})
$(document).on("focusout", '.optionName1', function(){
    
    if($(this).attr('data-depth') == 1){
        $('.optionName1').val($(this).val());
    }
    
})
$(document).on("focusout", '.optionName2', function(){
    
    if($(this).attr('data-depth') == 2){
        $('.optionName2').val($(this).val());
    }
    
})

$('#btnFinish').click(function(){
    let check = true;
    $('.price').each(function(i,v){
        if($.isNumeric($(v).val())==false){
            check= false;
        }
    })
    $('.stock').each(function(i,v){
        if($.isNumeric($(v).val())==false){
            check= false;
        }
    })
    if(check == false){
        alert('price와 stock에 숫자만 입력했는지 확인하십시오.')
    }else{
        let optionValue0 = [];
        let optionValue1 = [];
        let optionValue2 = [];
        let optionName = [];
        let countList = [];
        let countList2 = [];
        let price = [];
        let stock = [];
        
        optionName.push($('.optionName0').val());
        if($('.optionName1').length != 0){
            
            optionName.push($('.optionName1').val());
        }
        if($('.optionName2').length != 0){
            
            optionName.push($('.optionName2').val());
        }

        
    
        $('.optionValue').each(function(i, v){
            
            if($(v).attr('data-depth') == 0){
                optionValue0.push($(v).val())
                let ar = []
                let count2 = 0;
                $(v).parent().children('.opa').children('.optionValue').each(function(i2, v2){
                    let ar2 = [];
                    let price2 = [];
                    let stock2 = [];
                    let count = 0;
                    if($(v2).attr('data-depth') == 1){
                        
                        ar.push($(v2).val());
                        count2 ++;
                        $(v2).parent().children('.opb').children('.optionValue').each(function(i3, v3){
                            if($(v3).attr('data-depth') == 2){
                                count++
                                ar2.push($(v3).val());
                            }
                        })
                        $(v2).parent().children('.opb').children('.price').each(function(i3, v3){
                            price2.push($(v3).val());
                        })
                        $(v2).parent().children('.opb').children('.stock').each(function(i3, v3){
                            stock2.push($(v3).val());
                        })
                        countList.push(count);
                        optionValue2.push(ar2);
                        price.push(price2);
                        stock.push(stock2);
                    }
                })
                countList2.push(count2);
                optionValue1.push(ar);
            }
        })
        console.log(optionValue0);
        console.log(optionValue1);
        console.log(optionValue2);
        $.ajax({
            url : "/product/productOptionAdd",
            type : "POST",
            traditional:true,
            data:{
                "optionValue0" : optionValue0,
                "optionValue1" : optionValue1,
                "optionValue2" : optionValue2,
                "optionName" : optionName,
                "countList" : countList,
                "countList2" : countList2,
                "price" : price,
                "stock" : stock,
              
            }
            });
    }
    
})

// $('#btnFinish').click(function(){
//     let optionNameList = [$('.optionName0').val(), $('.optionName1').val(), $('.optionName2').val()]
//     let optionValue0 = [1, 2, 3, 4];
//     let optionValue1 = [[1,2], [2,3,4], [1,2,3,4,5], []];
//     let optionValue2 = [[[1,2,3],[1,2]], [[1,2],[1],[1,2,3]], [[],[],[],[],[]], [[]]];




//     for(a of $('.optionValue')){
//         if(a.attr('data-depth') == 0){
//             optionValue0.push(a.val());
//         }
//         if(a.attr('data-depth') == 1){
//             optionValue1.push(a.val());
//         }
//         if(a.attr('data-depth') == 2){
//             optionValue2.push(a.val());
//         }
//     }
//     data = [
//         {
//             optionName : "color",
//             optionValue : "red",
//             depth : 0,
//             sub : [
//                 {
//                     optionName : "size",
//                     optionValue : 64,
//                     depth : 1,
//                     sub : [
//                         {
//                             optionName : "ram",
//                             optionValue : "8",
//                             depth : 2
//                         },
//                         {
//                             optionName : "ram",
//                             optionValue : "16",
//                             depth : 2
//                         }
//                     ]
//                 },
//                 {
//                     optionName : "size",
//                     optionValue : 128,
//                     depth : 1,
//                     sub : [
//                         {
//                             optionName : "ram",
//                             optionValue : "8",
//                             depth : 2
//                         }
//                     ]
//                 }
//             ]
//         },
//         {
//             optionName : "color",
//             optionValue : "yellow",
//             depth : 0,
//             sub : [
//                 {
//                     optionName : "size",
//                     optionValue : 64,
//                     depth : 1,
//                     sub : [
//                         {
//                             optionName : "ram",
//                             optionValue : "8",
//                             depth : 2
//                         }
//                     ]
//                 },
//                 {
//                     optionName : "size",
//                     optionValue : 128,
//                     depth : 1,
//                     sub : [
//                         {
//                             optionName : "ram",
//                             optionValue : "8",
//                             depth : 2
//                         }
//                     ]
//                 }
//             ]
//         }
//     ]
// })
