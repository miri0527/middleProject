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
	
/* th:nth-child(2n), td:nth-child(2n) {
   	background-color: #bbdefb;
 } */
 
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
     <p class="fs-2" style="font-family: 'Impact'">상품 옵션</p>
   </div>

   <div class="row">
   	<input type="hidden" name="productNum" value="${dto.productDTO.productNum}">
   	<c:if test="${not empty list }">
      <table class="table table-hover text-center type10">
	      <thead class="thead-dark">
	      	
	      	<tr>
	      		<th style="width : 15%; ">옵션 이름</th>
				<c:forEach items="${list}" var="productOptionDTO">
					 <c:if test="${productOptionDTO.depth eq 2}">
				        <th></th>
				     </c:if>
	      			 
	      		</c:forEach> 
					
			</tr>
	      </thead>
	      <tbody>
	      	<tr>	
	      		<td>${list2[0]}</td>
		      		<c:forEach items="${list}" var="productOptionDTO">
		      			  <c:if test="${productOptionDTO.depth eq 0}">
					         <td colspan="4">${productOptionDTO.optionValue}</td>
					     </c:if>
					       
		      		</c:forEach> 
	
	      		
	      	</tr>
	      		
	      	<tr>
	      		<td >${list2[1]}</td>
	      		
	      		<c:forEach items="${list}" var="productOptionDTO">
	      		 <c:if test="${productOptionDTO.depth eq 1 }">
				     	<td colspan="2">${productOptionDTO.optionValue}</td>
				 	 
				 </c:if>
				 </c:forEach>
				     
	      	</tr>
	      	
	     	<tr>
	     		<td>${list2[2]}</td>
	     		<c:forEach items="${list}" var="productOptionDTO">
	      		 <c:if test="${productOptionDTO.depth eq 2 }">
	      	
				     	 <td>${productOptionDTO.optionValue}</td>
				 	 
				 </c:if>
				 </c:forEach>
	     		
	     	</tr>
	     	
	     	<tr>
	     		<td>재고</td>
	     		
	     		<c:forEach items="${list}" var="productOptionDTO">
		      		 <c:if test="${productOptionDTO.depth eq 2 }">
		      	
				     	 <td>${productOptionDTO.productStock}</td>
					 	 
					 </c:if>
				 </c:forEach>
	     	</tr>
	     	
	     	<tr>
	     		<td>가격</td>
	     		
	 	   		<c:forEach items="${list}" var="productOptionDTO">
	      		 <c:if test="${productOptionDTO.depth eq 2 }">
	      	
				     	 <td>${productOptionDTO.productPrice}</td>
				 	 
				 </c:if>
				 </c:forEach>
	     	</tr>
	      		
			
			
	      </tbody>  
     	 </table>
       </c:if>
       
       <c:if test="${empty list }">
       	  <div class="row col-md-4 mx-auto text-center mt-30">
    		<h1>싱품 옵션을 등록해주세요.</h1>
    		<a href="../product/productOptionAdd?productNum=${param.productNum}" style="margin-top : 10px;">상품 옵션 추가하러 가기</a>
   		</div>
       		
       		
       		
       		
       </c:if>
   </div>   
</div>   
</body>
</html>