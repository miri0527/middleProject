<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/common_css.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
table.type10 {
	margin-top : 50px;
}
thead {
	background-color : black;
	color : white;
}
	
th:nth-child(2n), td:nth-child(2n) {
   	background-color: #bbdefb;
 }
 
.paging {
	margin-top : 20px;
} 

.button {
	margin-top : 30px;
}

.search2 {
	padding-top : 30px;
}

.search1 {
	padding-top : 33px;
}

.search3 {
	padding-top : 33px;
}
</style>
</head>
<body>
<c:import url="../template/managerHeader.jsp"></c:import>
<div class="container-fluid">
   <div class="row col-md-4 mx-auto text-center border-bottom border-dark pb-2">
     <p class="fs-2" style="font-family: 'Impact'">상품디테일 옵션</p>
   </div>

   <div class="row">
   	<input type="hidden" name="productNum" value="${dto.productDTO.productNum}">
      <table class="table table-hover text-center type10">
      <thead class="thead-dark">
      	<tr>
				<th>옵션번호</th>
				<th>옵션이름</th>
				<th>옵션값</th>
				<th>재고</th>
			</tr>
      </thead>
      <tbody>
      	<c:forEach items="${list}" var="productOptionDTOs">
				<tr>
					<td>${productOptionDTOs.optionNum }</td>
					<td>${productOptionDTOs.optionName }</td>
					<td>${productOptionDTOs.optionValue }</td>
					<td>${productOptionDTOs.productStock }</td>
				</tr>
			</c:forEach>
      </tbody>
            
       
         
      </table>
   </div>   
</div>   
</body>
</html>