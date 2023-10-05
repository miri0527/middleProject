<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
   <div class="container fluid my-5">
   <div class= "row mb-4 ">
   
   <h1>${boardName} add page </h1>
   
	<h1 class="mb-2"> 
	</h1>
	</div>
	
	<form class = "row g-3 ms-auto" action="./add" method="post" enctype="multipart/form-data" id="frm" >
 		<div class="col-12">
    		<label for="title" class="form-label">아이디</label>
    		<input type="text" class="form-control" id="id" name="id" placeholder="id" value="${member.id}" readonly>
  		</div>
  		
  		<c:if test="${boardName eq 'Qna'}">
	  		<div class="col-12">
	    		<label for="contents" class="form-label">제목</label>
	    		<input type="text" class="form-control" id="title" name="title" placeholder="제목">
	  		</div> 
  		</c:if>
  		
  		<c:if test="${boardName eq 'QnaReply'}">
	  		<div class="col-12">
	    		<label for="contents" class="form-label">제목</label>
	    		<input type="text" class="form-control" id="title" name="title" placeholder="제목">
	  		</div> 
	  		<div class="col-12">
	    		<label for="contents" class="form-label">원글 제목</label>
	    		<input type="text" class="form-control"  value="${title}" readonly="readonly">
	  		</div> 
	  		
	  		<input type="hidden" name="num" value="${dto.num}">
  		</c:if>
  		
  		
     	<div class="col-12">
    		<label for="contents" class="form-label">내용</label>
    		<input type="text" class="form-control" id="contents" name="contents" placeholder="상세내용">
  		</div> 
  		
  		<div class="col-12">
    		<label for="contents" class="form-label">상품이름</label>
    		<input type="text" class="form-control" value="${productName}" readonly="readonly">
  		</div>
		<input type="hidden" name="productNum" value="${dto.productNum}">
	
	  <div class="col-12">
	    <button type="submit" id="add" class="btn btn-primary">글쓰기</button>
	  </div>
	  
	</form>
   </div>
   <c:import url="../template/footer.jsp"></c:import>
  
   <c:import url="../template/common_js.jsp"></c:import>
 <script>
	/* 	$("#contents").summernote(); */
		
	
</script>
</body>
</html>