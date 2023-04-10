<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
	<div class="row my-5">
		<h1>결제리스트</h1>
	</div>
	
	
		<div class="row">
			<table class="table table-hover text-center">
				<tr>
					<th>상품명</th>
					<th>아이디</th>
					<th>가격</th>
					<th>구입수량</th>
					<th>결제날짜</th>	
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.optionName }</td>
						<td>${dto.id}</td>
						<td>${dto.totalPrice }</td>
						<td>${dto.productTea }</td>
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
	                  <a class="page-link" href="./cartList?page=1" aria-label="Previous" data-board-page="1">
	                     <span aria-hidden="true">&laquo;</span>
	                  </a>
	               </li>
	               
	               <li class="page-item ${pager.before?'disabled':''}">
	                  <a class="page-link" href="./cartList?page=${pager.startNum-1}	" aria-label="Previous" data-board-page="${pager.startNum-1}">
	                     <span aria-hidden="true">&lsaquo;</span>
	                  </a>
	               </li>
	                	
	               <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	                  <li class="page-item"><a class="page-link" href="./cartList?page=${i}" data-board-page="${i}">${i}</a></li>
	               </c:forEach>
	               
	               <li class="page-item  ${pager.after eq false ? 'disabled' : ''}">
	                  <a class="page-link" href="./cartList?page=${pager.lastNum+1}"  aria-label="Next" data-board-page="${pager.lastNum+1}">
	                     <span aria-hidden="true">&rsaquo;</span>
	                  </a>
	                </li>
	                
	                <li class="page-item ${pager.page eq pager.totalPage?'disabled' : ''}">
	                  <a class="page-link" href="./cartList?page=${pager.totalPage}"  aria-label="Next" data-board-page="${pager.totalPage}">
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
	            <div class="col-auto">
	               <label for="kind" class="visually-hidden"></label>
	               <select class="form-select" name="kind" id="kind" aria-label="Default select example">
	               <!--검색했을 때 s  -->
	                  <option value="id" ${pager.kind eq 'id' ? 'selected' : ''}>회원아이디 </option>
	                 <%-- <option value="optionName" ${pager.kind eq 'autoStatus' ? 'selected' : ''} > 상품명</option> --%>
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
</body>
</html>