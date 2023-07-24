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
<meta http-equiv="Cache-Control" content="no-store" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Lexend:wght@400;800;900&display=swap');
	#row {
		  display: flex;
		  justify-content: center; /* 가로 방향으로 가운데 정렬 */
		  align-items: center; /* 세로 방향으로 가운데 정렬 */
	}
	
	
</style>
<body class="hold-transition sidebar-mini layout-fixed">
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid col-md-9">
	<div class="row my-5">
		<h1 style="font-family: 'Lexend', sans-serif">Notice List</h1> <p>${member.id}님 환영합니다.</p>
	</div>

	<div class="row">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>NUM</th><th>TITLE</th><th>WRITER</th><th>DATE</th><th>HIT</th>
				
					
				</tr>
			</thead><c:forEach items="${list}" var="dto">
			 
				<tr>
					
					<td>${dto.r}</td>
					<td><a href="./detail?num=${dto.num}"> ${dto.title}</a></td>
					<td>${dto.id}</td>
					<td>${dto.regDate}</td>
					<td>${dto.hit }</td>
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
	
	<!-- paging -->
		<div class="row justify-content-center mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<li class="page-item">
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
			    <li class="page-item"><a class="page-link" href="#" data-board-page="${i}"  >${i}</a></li>
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}"><%-- ${pager.after eq false ? 'disabled':''} --%>
	
			      <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			      
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item"><%-- ${pager.after eq false ? 'disabled':''} --%>
	
			      <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
			      
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
		
				
		<!-- 검색창 -->
		
		
		<div class="row" id="row">
			<div class="col-auto">
			  <form class="row g-3" action="./list" method="get" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
				<div class="col-auto">
				  <label for="kind" class="visually-hidden">Kind</label>
				  <select class="form-select" name="kind" id="kind" aria-label="Default select example">
					<option value="title" ${pager.kind eq 'title'? 'selected':''}>Title</option>
					<option value="contents" ${pager.kind eq 'contents'? 'selected':''}>Contents</option>
					<option value="id" ${pager.kind eq 'id'? 'selected':''}>Writer</option>
				  </select>
				</div>
				<div class="col-auto">
				  <label for="search" class="visually-hidden">Search</label>
				  <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
				</div>
				<div class="col-auto">
				  <button type="submit" class="btn btn-warning mb-3">검색</button>
				</div>
				<div class="col-auto justify-content-end">
					<c:if test="${member.roleDTO.roleNum == 1}">
						<div class="col-auto justify-content-end">
							 <a href="./add" class="btn btn-warning">글작성</a>
						</div>  
					</c:if>
				</div>  
			  </form>
			</div>
		  </div>
		
		
	</div>
			

	  

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/boardForm.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/pageing.js"></script>
<script>
/* 	setData('${pager.search}') */
</script>
</body>
</html>        