$(".form-select").not("option[value='1']").prop("disabled",true)
$(".form-select").not("option[value='2']").prop("disabled",true)
$(".form-select").not("option[value='']").prop("disabled",true)

$("#update").click(() => {
    $(".form-select").not("option[value='1']").prop("disabled",false)
$(".form-select").not("option[value='2']").prop("disabled",false)
$(".form-select").not("option[value='']").prop("disabled",false)
})