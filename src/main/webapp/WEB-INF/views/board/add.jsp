<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
   <div class="container fluid my-5">
   <div class= "row mb-4 ">
   
   <h1>${boardName} add page </h1>
   
	<h1 class="mb-2"> 리뷰 등록 페이지 
	</h1>
	</div>
	
	<form class = "row g-3 ms-auto" action="./add" method="post" enctype="multipart/form-data" >
 		<div class="col-12">
    		<label for="title" class="form-label">아이디</label>
    		<input type="text" class="form-control" id="id" name="id" placeholder="id" value="id">
  		</div>
  		<div class="col-12">
    		<label for="contents" class="form-label">내용</label>
    		<input type="text" class="form-control" id="contents" name="contents" placeholder="상세내용">
  		</div>
  			<div class="col-12">
    		<label for="contents" class="form-label">상품번호</label>
    		<input type="text" class="form-control" id="productNum" name="productNum" readonly value="${dto.productNum}">
  		</div>

		<!-- <div id="fileList" class="my-5">
				<button type="button" class="btn btn-primary" id="fileAdd">ADD</button>
		</div> -->


	  <div class="col-12">
	    <button type="submit" class="btn btn-primary">글쓰기</button>
	  </div>
	  
	</form>
   </div>
   
   <c:import url="../template/common_js.jsp"></c:import>
   
</body>
</html>