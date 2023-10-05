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

<c:if test="${member eq null || member.roleDTO.roleNum ne 1}">
	<c:import url="../template/header.jsp"></c:import>
</c:if>
<c:if test="${member.roleDTO.roleNum eq 1 }">
	<c:import url="../template/managerHeader.jsp"></c:import>
</c:if>

<div class="container-fluid col-md-9">
	<div class="row my-5">
		<h1 style="font-family: 'Lexend', sans-serif">Notice List</h1> <p>${member.id}님 환영합니다.</p>
	</div>
	<div class="row">
		<table class="table table-hover">
			<thead>
				<tr style="text-align : center;">
					<th></th><th >TITLE</th><th>WRITER</th><th>DATE</th><th>HIT</th>
				
					
				</tr>
			</thead>
		
			<tbody class="importantList">	
			
			<c:forEach items="${list}" var="dto">
			 
				<tr  class="check-item" data-num-important="${dto.important}" style="text-align: center; line-height: 22.5px;">
					<td >${dto.r}</td>
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
			
			</tbody>
		
		</table>
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
		
				
		<!-- 검색창 -->
		
		<div class="container mt-30">
		  <!-- Add a container to center the content -->
		  <div class="row">
		    <div class="col-lg-6 offset-lg-3">
		      <!-- Use col-lg-4 (adjust column size as needed) and offset-lg-4 to center the content -->
		      <form class="row g-3" action="./list" method="get" id="searchForm">
		        <input type="hidden" name="page" value="1" id="page">
		        <div class="col-auto" style="display: flex; align-items: center; margin-left : 140px;">
		          <label for="kind" class="visually-hidden">Kind</label>
		          <select class="form-select" name="kind" id="kind" aria-label="Default select example" style="height : 35px;  width : 80px; margin-bottom : 19px;">
		            <option value="title" ${pager.kind eq 'title'? 'selected':''}>Title</option>
		            <option value="contents" ${pager.kind eq 'contents'? 'selected':''}>Contents</option>
		            <option value="id" ${pager.kind eq 'id'? 'selected':''}>Writer</option>
		          </select>
		        
		          <label for="search" class="visually-hidden">Search</label>
		          <input type="text" class="form-control" value="${pager.search}" name="search" id="search" style="height : 35px; width : 180px; margin-left : 10px;" placeholder="검색어를 입력하세요">
		          
	
		          <button type="submit" class="btn btn-warning mb-4" style="width : 80px; margin-left : 10px; height : 35px;">검색</button>
		   			
					<c:if test="${member.roleDTO.roleNum == 1}">
						<div class="col-auto justify-content-end">
							 <a href="./add" class="btn btn-warning mb-4" style="width : 80px; margin-left : 10px; height : 35px;">글작성</a>
						</div>  
					</c:if>
					
		        </div>
		       
		      </form>
		 
		    </div>
		  </div>
		</div>
		
		
	</div>
			
<c:if test="${member eq null || member.roleDTO.roleNum ne 1}">
	<c:import url="../template/footer.jsp"></c:import>
</c:if>
<c:if test="${member.roleDTO.roleNum eq 1 }">
	<c:import url="../template/managerFooter.jsp"></c:import>
</c:if>


<script type="text/javascript" src="../resources/js/importantList.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<script src="../resources/js/pageing.js"></script>
<script>
/* 	setData('${pager.search}') */
</script>
</body>
</html>        