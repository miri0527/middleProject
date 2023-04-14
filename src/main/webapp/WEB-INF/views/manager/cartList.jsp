<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
<style type="text/css">
	.paging {
	margin-top : 20px;
} 

table.ta {
	margin-top : 30px;
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
    	 <p class="fs-2" style="font-family: 'Impact'">구매리스트</p>
   	 </div>
	
	
		<div class="row">
			<table class="table table-hover text-center ta">
				<tr>
					<th>주문번호</th>
					<th>아이디</th>
					<th>상품명</th>
					<th>총가격</th>
					<th>구입수량</th>
					<th>결제날짜</th>	
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.orderNum }</td>
						<td>${dto.id}</td>
						<td>${dto.productDTO.productName}</td>
						<td>${dto.totalPrice }</td>
						<td>${dto.productEa }</td>
						<td>${dto.orderDate }</td>
						
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
	                  <a class="page-link" href="#" aria-label="Previous" data-board-page="1">
	                     <span aria-hidden="true">&laquo;</span>
	                  </a>
	               </li>
	               
	               <li class="page-item ${pager.before?'disabled':''}">
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
	      <form action="./cartList" method="get" class="row g-3" id="searchForm">
	      	<input type="hidden" name="page" value="1" id="page">
	         <div class="row justify-content-center mx-auto">
	            <div class="col-auto search1">
	               <label for="kind" class="visually-hidden">회원아이디</label>
	               <select class="form-select" name="kind" id="kind" aria-label="Default select example">
	               <!--검색했을 때 s  -->
	                  <option value="id" ${pager.kind eq 'id' ? 'selected' : ''}>회원아이디 </option>
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
<script src="../resources/js/pageing.js"></script>	     
</body>
</html>