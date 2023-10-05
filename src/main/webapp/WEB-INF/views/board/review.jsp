<%@page import="com.home.middle.board.BbsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend:wght@400;800;900&display=swap');
</style>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid col-md-9">
	<div class="row my-5">
		<h1 style="font-family: 'Lexend', sans-serif">${boardName} List</h1> <p>${member.id}님 환영합니다.</p>
	</div>

	<div class="row">
		<table class="table table-hover">
			<thead>
			
				<tr>
					<th>NUM</th><th>CONTENTS</th><th>ID</th><th>상품 이름</th><th>DATE</th>
					 
					  <c:if test="${member.id eq list[0].id }">
						<th>삭제</th><th>수정</th>
					</c:if>
				 
					
				</tr>
			</thead>
				<c:forEach items="${list}" var="dto">
			 
				<tr>
					
					<td>${dto.r}</td>
					<td>${dto.contents}</td>
					<td>${dto.id}</td>
					<td>${dto.productDTO.productName }</td>
					
					<td>${dto.regDate}</td>
					
					<c:if test="${member.id eq dto.id}">
					<td> 
					<form action="./delete" id="frmde">
					 <input type="hidden" name="num" value="${dto.num}">
					 <button  type="button" class="btn btn-warning delete3"  data-num="${dto.num}">DELETE</button>
					</form>
					</td>
					<td>
					 <a class="btn btn-warning"  href ="./update?num=${dto.num}">UPDATE</a>
					</td>
					</c:if>
				<%-- 	<c:if test="${member.roleDTO.roleNum eq 1}">
		         
			          <td width="86px" >
						<a href="/review/add?num=${dto.num}&productNum=${dto.productNum}" class="btn btn-warning">댓글</a>
					</td> 
					
					
					</c:if> --%>
				<%-- 	<c:if test="${member.roleDTO.roleNum < 2 }">
					<div class="col-auto justify-content-end">
					 <a href="/qnaReply/add" class="btn btn-warning">글작성</a>
					</div>  
					</c:if> --%>
				</tr>
				
				</c:forEach>
			<tbody>
				
			</tbody>
		
		</table>
	</div>
</div>
	<!-- paging -->
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
		

	<div class="container mt-30">
	  <!-- Add a container to center the content -->
	  <div class="row">
	    <div class="col-lg-6 offset-lg-3">
	      <!-- Use col-lg-4 (adjust column size as needed) and offset-lg-4 to center the content -->
	      <form class="row g-3" action="./listdetail" method="get" id="searchForm">
	        <input type="hidden" name="page" value="1" id="page">
	        <div class="col-auto" style="display: flex; align-items: center; margin-left : 140px;">
	          <label for="kind" class="visually-hidden">Kind</label>
	          <select class="form-select" name="kind" id="kind" aria-label="Default select example" style="height : 35px;  width : 80px; margin-bottom : 19px;">
	            <option value="contents" ${pager.kind eq 'contents'? 'selected':''}>Contents</option>
	            <option value="id" ${pager.kind eq 'id'? 'selected':''}>ID</option>
	            <option value="productName" ${pager.kind eq 'productName'? 'selected':''}>상품 이름</option>
	          </select>
	        
	          <label for="search" class="visually-hidden">Search</label>
	          <input type="text" class="form-control" value="${pager.search}" name="search" id="search" style="height : 35px; width : 180px; margin-left : 10px;" placeholder="검색어를 입력하세요">
	          

	          <button type="submit" class="btn btn-warning mb-4" style="width : 80px; margin-left : 10px; height : 35px;">검색</button>
	   
	        </div>
	       
	      </form>
	       <!--  <div class="col-lg-8 offset-lg-4">
		     
	          <a href="./add" class="btn btn-info"  style="width : 100px; margin-bottom : 9px; margin-left : 70px; margin-top : 5px; ">글작성</a>
		       
	        </div> -->
	    </div>
	  </div>
	</div>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/boardForm.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/pageing.js"></script>
<script>
	
</script>
</body>
</html>