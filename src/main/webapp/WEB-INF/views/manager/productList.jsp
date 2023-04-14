<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
<style type="text/css">
	
table.type10 {
	margin-top : 50px;
}
thead {
	background-color : black;
	color : white;
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
     <p class="fs-2" style="font-family: 'Impact'">상품리스트</p>
   </div>

   <div class="row">
      <table class="table table-hover text-center type10">
      <thead class="thead-dark">
      	  <tr>
            <c:if test="${member.roleDTO.roleName eq 'ADMIN' }">
               <th></th>
            </c:if>
           		<th>상품명</th>
               <th>상품</th>
               <th>판매여부</th>
            
         </tr>
      </thead>
      <tbody>
      	<c:forEach items="${list}" var="dto">
            <tr>
               
               <td>
                  <input class="form-check-input mt-0 chkList" type="checkbox" data-productNum="${dto.productNum}" aria-label="Checkbox for following text input">
               </td>
             	<td>${dto.productImgDTOs[0].fileName}</td>
               
               <td><a href="./productDetail?productNum=${dto.productNum}"> ${dto.productName}</a></td>
               <td>
               	<c:if test="${dto.productSales eq 1 }">판매중</c:if>
               	<c:if test="${dto.productSales eq 0 }">판매중단</c:if>
               	</td>
               
            </tr>
         </c:forEach>
      </tbody>
            
       
         
      </table>
   </div>   
</div>   
   <!-- Paging -->
         <div class="rowmx-auto paging">
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
               
                  <li class="page-item ${pager.page eq 1?'disabled':''}">
                     <a class="page-link" href="#" aria-label="Previous" data-board-page="1">
                        <span aria-hidden="true">&laquo;</span>
                     </a>
                  </li>
                  
                  <li class="	page-item ${pager.before?'disabled':''}">
                     <a class="page-link" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
                        <span aria-hidden="true">&lsaquo;</span>
                     </a>
                  </li>
                      
                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                     <li class="page-item"><a class="page-link" href="#" data-board-page="${i}">${i}</a></li>
                  </c:forEach>
                  
                  <li class="page-item  ${pager.after eq false ? 'disabled' : ''}">
                     <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
                        <span aria-hidden="true">&rsaquo;</span>
                     </a>
                   </li>
                   
                   <li class="page-item ${pager.page eq pager.totalPage?'disabled' : ''}">
                     <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
                        <span aria-hidden="true">&raquo;</span>
                     </a>
                   </li>
                   
               </ul>
            </nav>
         </div>
         
         <!-- 검색창 -->
         <form action="./productList" method="get" class="row g-3" id="searchForm">
            <input type="hidden" name="page" value="1" id="page">
            <div class="row justify-content-center mx-auto">
               <div class="col-auto search1">
                  <label for="kind" class="visually-hidden">상품명</label>
                  <select class="form-select" name="kind" id="kind" aria-label="Default select example">
                  <!--검색했을 때 s  -->
                     <option value="productName" ${pager.kind eq 'productName' ? 'selected' : ''}>상품명 </option>
                    
                  </select>
               </div>
               <div class="col-auto search2">
                  <label for="search" class="visually-hidden">Search</label>
                  <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요.">
               </div>   
               <div class="col-auto search3">
                  <button type="submit" class="btn btn-outline-primary mb-3">검색</button>
               </div>
            </div>
         </form>
      </div>

      <div class="col text-center button">
         <a href="../product/add"><button type="button" class="btn btn-primary" style="color:white;" id="add">상품등록</button></a>
         <button type="button" class="btn btn-danger" onclick="deleteValue()">상품삭제</button>
      </div>   
    
<script src="../resources/js/memberProductList.js"></script>
<c:import url="../template/common_js.jsp"></c:import>   
<script src="../resources/js/pageing.js"></script>
</body>
</html>