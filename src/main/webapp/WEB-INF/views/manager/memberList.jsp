<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table.type09 {
  margin-top : 30px;
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;

}
table.type09 thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
table.type09 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.type09 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  text-align:center;
}

.col-auto {
	margin-top:50px;
}
</style>


<meta charset="UTF-8">
<title>회원리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/managerHeader.jsp"></c:import>
<div class="container-fluid">
	 <div class="row col-md-4 mx-auto text-center border-bottom border-dark pb-2">
     <p class="fs-2" style="font-family: 'Impact'">회원리스트</p>
   </div>
	회원등급
	<input type="checkbox" id="allRole" name="roleName" value="" checked > 전체
	<input type="checkbox" id="memberRole	" name="roleName" class="check" value="MEMBER">일반회원
	<input type="checkbox" id="sellerRole" name="roleName"class="check" value="MANAGER">매니저
	<input type="checkbox" id="adminRole" name="roleName" class="check"value="ADMIN">관리자	
		
		<div class="table-content table-responsive mb-50">
			<table class= "type09">	
			<thead>
				<tr>
					<th scope="cols"></th>
					<th scope="cols">아이디</th>
					<th scope="cols">이름</th>
					<th scope="cols">회원등급</th>	
					<th scope="cols">판매자신청여부</th>
					<th scope="cols">신청</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>
							<input class="form-check-input mt-0 chkList"  type="checkbox" data-id="${dto.id}" aria-label="Checkbox for following text input">
						</td>
						<td><a href="./memberDetail?id=${dto.id}">${dto.id}</a></td>
						<td>${dto.name}</td>
						<td>${dto.roleDTO.roleName }</td>
						<td>
						<c:if test="${dto.roleDTO.roleNum ne 1 }">
							<c:if test="${dto.autoStatus eq '미신청' && dto.roleDTO.roleNum eq 3}">미신청</c:if>
							<c:if test="${dto.autoStatus eq '승인대기'}">승인대기</c:if>
							<c:if test="${dto.autoStatus eq '승인완료'}">승인완료</c:if>
							<c:if test="${dto.autoStatus eq '승인거절'}">승인거절</c:if>
						</c:if>	
						</td>
						<td>
							<c:if test="${dto.autoStatus eq '승인대기' && dto.roleDTO.roleNum eq 3}">
								<form action="../member/sellerApprove" method="post" id="application">
									<input type="hidden" name="id" value="${dto.id}">
									<button class="btn btn-primary" type="submit">승인</button>
									<button class="btn btn-danger" type="submit" id="refuse">거절</button>
								</form>	
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>	
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
	      <form action="./memberList" method="get" class="row g-3" id="searchForm">
	      	<input type="hidden" name="page" value="1" id="page">
	         <div class="row justify-content-center mx-auto">
	            <div class="col-auto">
	               <label for="kind" class="visually-hidden" >회원아이디</label>
	               <select class="form-select" name="kind" id="kind" aria-label="Default select example" style="margin-top:33px;">
	               <!--검색했을 때 s  -->
	                  <option value="id" ${pager.kind eq 'id' ? 'selected' : ''}>회원아이디 </option>
	                 <option value="autoStatus" ${pager.kind eq 'autoStatus' ? 'selected' : ''} > 판매자신청여부</option>
	               </select>
	            </div>
	            <div class="col-auto" style="margin-top: 30px;">
	               <label for="search" class="visually-hidden">Search</label>
	               <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요.">
	            </div>	
	            <div class="col-auto">
	               <button type="submit" class="btn btn-outline-primary mb-3" style="margin-top:33px">검색</button>
	            </div>
	         </div>
	      </form>
	      
		</div>
		<div class="col text-center">
			<button type="button" class="btn btn-danger" onclick="deleteValue()">탈퇴처리</button>	
		</div>
		
<c:import url="../template/common_js.jsp"	></c:import>	
<script src="../resources/js/pageing.js"></script>

<script type="text/javascript" src="../resources/js/memberList.js"></script>	

</body>
</html>