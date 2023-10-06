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
     <p class="fs-2" style="font-family: 'Impact'">상품 리스트</p>
   </div>

   <div class="row">
      <table class="table table-hover text-center type10">
      <thead class="thead-dark">
      	  <tr>
          		
               <th>상품</th>
               <th>상품명</th>
               <th>판매 여부</th>
               <th></th>
               
            
         </tr>
      </thead>
      <tbody>
     
      	<c:forEach items="${list}" var="dto">
            <tr>
               
               <td>
                  <input class="form-check-input mt-0 chkList" type="checkbox" data-productNum="${dto.productNum}" aria-label="Checkbox for following text input">
               </td>
              
               
               <td><a href="./productDetail?productNum=${dto.productNum}"> ${dto.productName}</a></td>
               <td>
	               	<c:if test="${dto.productSales eq 1 }">판매중</c:if>
	               	<c:if test="${dto.productSales eq 0 }">판매중단</c:if>
               </td>
               <td>
               		<a href="../product/update?productNum=${dto.productNum}" class="btn btn-primary">상품 수정</a>
               </td>
           
            </tr>
         </c:forEach>
      </tbody>
            
       
         
      </table>
   </div>   

   <!-- Paging -->
	<div class="container">
		<div class="row" style="margin-left : 50px;">
			 <div class="col-lg-4 offset-lg-4">
			<nav aria-label="Page navigation example">
			  <ul class="shop-pagination box-shadow text-center ptblr-10-30">
			  	<li class="page-item">
                          <a class="page-link" href="#"
                              aria-label="Previous"
                              data-board-page="1">
                              <!--==page=1 -->

                              <span
                                  aria-hidden="true">&laquo;</span>
                          </a>
                      </li>
                      <li class="page-item ${pager.before ? 'disabled' : ''}">
                          <a class="page-link" href="#"
                              aria-label="Previous"
                              data-board-page="${pager.startNum-1}">
                              <span
                                  aria-hidden="true">&lsaquo;</span>
                              <!--lsaquo는 꺽쇠 하나 laquo는 꺽쇠 두개  -->
                          </a>
                      </li>
                      <c:forEach begin="${pager.startNum}"
                          end="${pager.lastNum}" var="i">
                          <li class="page-item"><a
                                  class="page-link ${pager.page eq i ? 'active' : '' }"
                                  href="#"
                                  data-board-page="${i}">${i}</a>
                          </li>
                      </c:forEach>
                      <!-- &gt = <꺽쇠를 표현 &lt는 >꺽쇠를 표현 -->
                      <li
                          class="page-item ${pager.after eq false ? 'disabled' : ''}">
                          <!--  -->
                          <a class="page-link " href="#"
                              aria-label="Next"
                              data-board-page="${pager.lastNum+1}">
                              <span
                                  aria-hidden="true">&rsaquo;</span>
                          </a>
                      </li>
                      <li class="page-item "> <!--  -->
                          <a class="page-link " href="#"
                              aria-label="Next"
                              data-board-page="${pager.totalPage}">
                              <span
                                  aria-hidden="true">&raquo;</span>
                          </a>
                      </li>
			  </ul>
			</nav>
			</div>
		</div>
	</div>
	
	<!--검색창 -->
	<div class="container mt-30">
	  <!-- Add a container to center the content -->
	  <div class="row">
	    <div class="col-lg-6 offset-lg-3">
	      <!-- Use col-lg-4 (adjust column size as needed) and offset-lg-4 to center the content -->
	      <form class="row g-3" action="./productList" method="get" id="searchForm">
	      	<input type="hidden" name="categoryNum" value="${param.categoryNum }">
	        <input type="hidden" name="page" value="1" id="page">
	        <div class="col-auto" style="display: flex; align-items: center; margin-left : 140px;">
       		 <label for="kind" class="visually-hidden">상품명</label>
                 <select class="form-select" name="kind" id="kind" aria-label="Default select example" style="height : 35px;  width : 130px; margin-bottom : 19px;">
                 <!--검색했을 때 s  -->
                    <option value="productName" ${pager.kind eq 'productName' ? 'selected' : ''}>상품명 </option>
                   
                 </select>
        
	          <label for="search" class="visually-hidden">Search</label>
	          <input type="text" class="form-control" value="${pager.search}" name="search" id="search" style="height : 35px; width : 180px; margin-left : 10px;" placeholder="검색어를 입력하세요">
	          

	          <button type="submit" class="btn btn-warning mb-4" style="width : 80px; margin-left : 10px; height : 35px;">검색</button>
	   
	        </div>
	       
	      </form>
	 
	    </div>
	  </div>
	</div>
         
        
         
      <div class="col text-center button">
         <a href="../product/add"><button type="button" class="btn btn-warning" style="color:white;" id="add">상품 등록</button></a>
         <button type="button" class="btn btn-danger" onclick="deleteValue()">상품 삭제</button>
      </div>   
</div>       
<script src="../resources/js/memberProductList.js"></script>
<c:import url="../template/common_js.jsp"></c:import>   
<script src="../resources/js/pageing.js"></script>
</body>
</html>