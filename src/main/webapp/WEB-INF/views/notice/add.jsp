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

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
   <div class="container fluid my-5">
	   <div class= "row mb-4 ">
	   
	   	<h1>Noice add page </h1>
	  
	  </div>
	
	<form class = "row g-3 ms-auto" action="./add" method="post" enctype="multipart/form-data" >
 		<div class="col-12">
    		<label for="title" class="form-label">아이디</label>
    		<input type="text" class="form-control" id="id" name="id" placeholder="id" value="${member.id}" readonly>
  		</div>
  		
  		
  		<div class="col-12">
    		<label for="contents" class="form-label">제목</label>
    		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
  		</div> 
  		
  		
  		
     	<div class="col-12">
    		<label for="contents" class="form-label">내용</label>
    		<textarea class="form-control" name="contents" id="contents" placeholder="내용을 입력하세요."></textarea>
  		</div> 
  		
  		<div class="col-12">
  			<input type="file" class="custom-file-input" name="addfiles">
  		</div>
  		


	  <div class="col-12">
	    <button type="submit" class="btn btn-primary">등록</button>
	  </div>
	  
	</form>
</div>	

   <c:import url="../template/footer.jsp"></c:import>
   <c:import url="../template/common_js.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>   
 <script>
 	$("#contents").summernote({
		height : 300
	});
</script>
</body>
</html>