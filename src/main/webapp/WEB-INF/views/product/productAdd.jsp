<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Subas || Home-3</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../template/common_css.jsp"></c:import>
<style type="text/css">
	.div {
		margin-top : 30px;
		height : 400px;
		border : 1px solid black;
		position: absolute;
	}
	.center {
		padding-top : 20px;
		margin-left : 300px;
	
	
	}
	
	.center2 {
		padding-top : 20px;
		margin-left : 300px;
		
		
	}
	
	.center3 {
		float:left;
		padding-top : 30px;
		
		
	}
	.btn1 {
		margin-top : 80px;
		margin-left : 300px;
	}
	.btn2 {
		margin-top : 80px;
	}
</style>
</head>
<body>

	<c:import url="../template/managerHeader.jsp"></c:import>
       
 <div class="container-fluid my-5">
 	<div class="row col-md-4 mx-auto text-center border-bottom border-dark pb-2">
     <p class="fs-2" style="font-family: 'Impact'">상품 등록</p>
   </div>
    <form action="./add" method = "post" enctype="multipart/form-data">
    <input type="hidden" value="${dto.id }" name="id">
      <div class="row col-md-4 mx-auto my-5">
         <div class="fw-bold fs-5 col-12">
            <p>상품등록</p>
            <select name="categoryNum" class="form-select form-select-sm" aria-label=".form-select-sm example"><br>
				<option value="1" selected >컴퓨터</option>
				<option value="2">노트북</option>
				<option value="3">모니터</option>
				<option value="4">휴대폰</option>
				<option value="5">TV</option>
				<option value="6">냉장고</option>
				<option value="7">에어컨</option>
				<option value="8">공기청정기</option>
			</select>
         </div>
        
         
	       <div class="fw-bold fs-5 col-12">
	            <p>상품명</p>
	            <input type="text" name="productName" class="form-control" ><br>
	       </div>   
   
			<fieldset class="mb-4 center3">
            <legend class="fw-bold fs-5">판매 여부</legend>
            <div class="form-check form-check-inline ">
               <label for="bs1" class="form-check-labyyel" id="inlineRadio1">판매</label>
               <input id="bs1" type="radio" name="productSales" value="1" checked class="form-check-input" for="inlineRadio1">
            </div>
            <div class="form-check form-check-inline">
               <label for="bs2" class="form-check-label" id="inlineRadio2">판매 중지</label>
               <input id="bs2" type="radio" name="productSales" value="0" class="form-check-input" for="inlineRadio2">
            </div>
         </fieldset>
         <div id = "fileList">
          
            <button type="button" class = "btn btn-primary" id="addBtn">ADD</button>
         </div>           
        
         <div class="row justify-content-center my-5">
            <button type="submit" class="btn btn-outline-warning col-2">전송</button>
         </div>
      </div>
   </form>
  
  		</div>
  		
  	</div>
</div>
<script src="../resources/js/productAdd.js"></script>
<c:import url="../template/common_js.jsp"></c:import>	

</body>
</html>