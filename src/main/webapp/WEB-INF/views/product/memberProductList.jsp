<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

<div class="container-fluid">
   <div class="row my-5">
      <h1>상품리스트</h1>
   </div>

   <div class="row">
      <table class="table table hover text-center">
            
         <tr>
            <c:if test="${member.roleDTO.roleName eq 'ADMIN' }">
               <th></th>
            </c:if>
               <th>번호</th>
               <th>상품명</th>
               <th>할인가</th>
               <th>할인율</th>
               <th>판매여부</th>
            
         </tr>
         <c:forEach items="${list}" var="dto">
            <tr>
               <c:if test="${member.roleDTO.roleName eq 'ADMIN' }">
               
               <td>
                  <input class="form-check-input mt-0" type="checkbox" name="chkList" value="${dto.productNum }" aria-label="Checkbox for following text input">
               </td>
               
               </c:if>
               <td>${dto.r}</td>
               <td><a href="./detail?productNum=${dto.productNum}"> ${dto.productName}</a></td>
               <td>${dto.discount }</td>
               <td>${dto.discountPercent }</td>
               <td>${dto.productSales}</td>
            </tr>
         </c:forEach>
      </table>
   </div>   
</div>   
   <!-- Paging -->
         <div class="rowmx-auto">
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
               
                  <li class="page-item ${pager.page eq 1?'disabled':''}">
                     <a class="page-link" href="./memberProductList?page=1" aria-label="Previous" data-board-page="1">
                        <span aria-hidden="true">&laquo;</span>
                     </a>
                  </li>
                  
                  <li class="page-item ${pager.before?'disabled':''}">
                     <a class="page-link" href="./memberProductList?page=${pager.startNum-1}" aria-label="Previous" data-board-page="${pager.startNum-1}">
                        <span aria-hidden="true">&lsaquo;</span>
                     </a>
                  </li>
                      
                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                     <li class="page-item"><a class="page-link" href="./list?page=${i}" data-board-page="${i}">${i}</a></li>
                  </c:forEach>
                  
                  <li class="page-item  ${pager.after eq false ? 'disabled' : ''}">
                     <a class="page-link" href="./memberProductList?page=${pager.lastNum+1}"  aria-label="Next" data-board-page="${pager.lastNum+1}">
                        <span aria-hidden="true">&rsaquo;</span>
                     </a>
                   </li>
                   
                   <li class="page-item ${pager.page eq pager.totalPage?'disabled' : ''}">
                     <a class="page-link" href="./memberProductList?page=${pager.totalPage}"  aria-label="Next" data-board-page="${pager.totalPage}">
                        <span aria-hidden="true">&raquo;</span>
                     </a>
                   </li>
                   
               </ul>
            </nav>
         </div>
         
         <!-- 검색창 -->
         <form action="./list" method="get" class="row g-3" id="searchForm">
            <input type="hidden" name="page" value="1" id="page">
            <div class="row justify-content-center mx-auto">
               <div class="col-auto">
                  <label for="kind" class="visually-hidden">상품명</label>
                  <select class="form-select" name="kind" id="kind" aria-label="Default select example">
                  <!--검색했을 때 s  -->
                     <option value="productName" ${pager.kind eq 'productName' ? 'selected' : ''}>상품명 </option>
                    
                  </select>
               </div>
               <div class="col-auto">
                  <label for="search" class="visually-hidden">Search</label>
                  <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요.">
               </div>   
               <div class="col-auto">
                  <button type="submit" class="btn btn-outline-primary mb-3">검색</button>
               </div>
            </div>
         </form>
         
      </div>

   <c:if test="${member.roleDTO.roleName eq 'ADMIN'}">
      <div class="col text-center">
         <a href="./add"><button type="button" class="btn btn-primary" style="color:white;" id="add">상품등록</button></a>
         <button type="button" class="btn btn-danger" onclick="deleteValue()">상품삭제</button>
      </div>   
   </c:if>   
<script src="../resources/js/memberProductList.js"></script>
<c:import url="../template/common_js.jsp"></c:import>   
</body>
</html>