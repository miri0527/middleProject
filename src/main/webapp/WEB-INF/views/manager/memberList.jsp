<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

<div class="container-fluid">
	<div class="row my-5">
		<h1>회원리스트</h1>
	</div>
	회원등급
	<input type="checkbox" id="allRole" name="roleName" value=""  checked > 전체
	<input type="checkbox" id="memberRole" name="roleName" value="MEMBER">일반회원
	<input type="checkbox" id="sellerRole" name="roleName" value="SELLER">판매자
	<input type="checkbox" id="adminRole" name="roleName" value="ADMIN">관리자	
	
	
		<div class="row">
			<table class="table table-hover text-center">
				<tr>
					<th></th>
					<th>아이디</th>
					<th>이름</th>
					<th>회원등급</th>	
					<th>신청여부</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>
							<input class="form-check-input mt-0"  type="checkbox" name="chkList" value="${dto.id}" aria-label="Checkbox for following text input">
						</td>
						<td><a href="./memberDetail?id=${dto.id}">${dto.id}</a></td>
						<td>${dto.name}</td>
						<td>${dto.roleDTO.roleName }</td>
						<td>
							<c:if test="${dto.autoStatus eq 0 }">미신청</c:if>
							<c:if test="${dto.autoStatus eq 1 }">신청중</c:if>
							<c:if test="${dto.autoStatus eq 2 }">신청완료</c:if>
						</td>
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
	                  <a class="page-link" href="./memberList?page=1" aria-label="Previous" data-board-page="1">
	                     <span aria-hidden="true">&laquo;</span>
	                  </a>
	               </li>
	               
	               <li class="page-item ${pager.before?'disabled':''}">
	                  <a class="page-link" href="./memberList?page=${pager.startNum-1}	" aria-label="Previous" data-board-page="${pager.startNum-1}">
	                     <span aria-hidden="true">&lsaquo;</span>
	                  </a>
	               </li>
	                	
	               <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	                  <li class="page-item"><a class="page-link" href="./memberList?page=${i}" data-board-page="${i}">${i}</a></li>
	               </c:forEach>
	               
	               <li class="page-item  ${pager.after eq false ? 'disabled' : ''}">
	                  <a class="page-link" href="./memberList?page=${pager.lastNum+1}"  aria-label="Next" data-board-page="${pager.lastNum+1}">
	                     <span aria-hidden="true">&rsaquo;</span>
	                  </a>
	                </li>
	                
	                <li class="page-item ${pager.page eq pager.totalPage?'disabled' : ''}">
	                  <a class="page-link" href="./memberList?page=${pager.totalPage}"  aria-label="Next" data-board-page="${pager.totalPage}">
	                     <span aria-hidden="true">&raquo;</span>
	                  </a>
	                </li>
	                
	            </ul>
	         </nav>
	      </div>
	      
	      <!-- 검색창 -->
	      <form action="./memberList" method="get" class="row g-3" id="searchForm">
	      	<input type="hidden" name="page" value="1" id="page">
	         <div class="row justify-content-center mx-auto">
	            <div class="col-auto">
	               <label for="kind" class="visually-hidden">회원아이디</label>
	               <select class="form-select" name="kind" id="kind" aria-label="Default select example">
	               <!--검색했을 때 s  -->
	                  <option value="id" ${pager.kind eq 'id' ? 'selected' : ''}>회원아이디 </option>
	                 
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
		<div class="col text-center">
			<button type="button" class="btn btn-danger" onclick="deleteValue()">탈퇴처리</button>	
		</div>
		
		
		<!-- <script type="text/javascript">
			console.log("${list.get(0).roleDTO.roleName}")
			let list = ${list};
			for(let i=0; i<${list.size()}; i++) {
				console.log("${list.get(i).roleDTO.roleName}")
			}
		</script> -->
<c:import url="../template/common_js.jsp"	></c:import>	


<script type="text/javascript" src="../resources/js/memberList.js"></script>	

</body>
</html>