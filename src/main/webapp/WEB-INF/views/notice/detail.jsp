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
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Lexend:wght@400;800;900&display=swap');
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--Main  -->
<div class="container-fluid col-md-9">
	<div class="row my-5">
		<h1 style="font-family: 'Lexend', sans-serif">Notice Detail Page</h1>
	</div>
	<div class="row">
		<div class="card">
			<div class="card-body">
				
				<table class="table">
					<tr>
						<th width=20% class="text-center warning" style="background-color:	#E2E2E2">조회수</th>
					    <td width=30% class="text-center">${boardDTO.hit}</td>
					    <th width=20% class="text-center warning" style="background-color:	#E2E2E2;">작성일</th>
				        <td width=30% class="text-center">${boardDTO.regDate}</td>
					</tr>
					<tr>
						<th width=20% class="text-center warning" style="background-color:#E2E2E2">작성자</th>
						<td width=30% class="text-center">${boardDTO.id }</td>
						<td width=20%></td>
						<td width=30%></td>
					</tr>
					<tr>
						<th width=20% class="text-center warning" style="background-color:#E2E2E2" >제목</th>
						<td colspan="3">
			         		<div style="margin-left: 20px;">${boardDTO.title}</div>
			         	</td>
					</tr>
					<tr>
				         <th width=20% class="text-center warning" style="background-color:#E2E2E2">첨부 파일</th>
				         <td colspan="3">
				         	<div style="margin-left: 20px;">
					         	<c:forEach items="${boardDTO.boardFileDTOs}" var="fileVO">
									<img class="fileIcon" width="30" height="30" src="${fileVO.fileName }"  style="margin-right: 5px">
			                       
		                    	</c:forEach>
	                    	</div>
				         </td>
			        </tr>
			         <tr>
				         <td colspan="4" class="text-left" valign="top" height="200">
				         	<pre style="white-space: pre-wrap;border:none;background-color: white; font-size: 30px;">${boardDTO.contents}</pre>
				         </td>   
			         </tr>
				</table>
				
				
				<c:if test="${boardDTO.id eq member.id }">
					<form action="./update" id="frm">
					<input type="hidden" name="num" value="${boardDTO.num}">
						<div class="wrapper" style="float : right;">
							<button class="btn btn-primary" type="submit">수정</button>
							<button class="btn btn-danger" id="deleteBtn">삭제</button>
						</div>
					
					</form>
				</c:if>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#deleteBtn").click(function() {
		 let check =  window.confirm("정말 삭제하시겠습니까?");

	    if(check) {
	        frm.setAttribute("action", "./delete")
	        frm.setAttribute("method", "post")
	        frm.submit();
	    }else {
	    	return false;
	    }
	})
	
</script>
</body>
</html>