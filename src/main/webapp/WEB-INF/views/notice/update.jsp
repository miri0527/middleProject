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

<c:import url="../template/managerHeader.jsp"></c:import>

   <div class="container fluid my-5">
	   <div class= "row mb-4 ">
	   
	   	<h1>Noice update page </h1>
	  
	  </div>
	
	<form class = "row g-3 ms-auto" action="./update" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="num" value="${update.num}">
 		<div class="col-12">
    		<label for="title" class="form-label">아이디</label>
    		<input type="text" class="form-control" id="id" name="id" placeholder="id" value="${member.id}" readonly>
  		</div>
  		
  		<div class="col-md-12 mt-4">
		  <div style="display: flex; align-items: center;">
		    <label for="important" class="form-label" style="margin-bottom: 10px; margin-left:5px">중요 표시</label>
		    <div style="margin-left: 10px;">
		      <input type="checkbox" name="important" id="important" style="width: 20px; height: 20px; margin-bottom: 10px;" value="${update.important}">
		    </div>
		  </div>
		</div>
  		
  		
  		<div class="col-12">
    		<label for="title" class="form-label">제목</label>
    		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." value="${update.title}">
  		</div> 
  		
  		
  		
     	<div class="col-12">
    		<label for="contents" class="form-label">내용</label>
    		<textarea class="form-control" name="contents" id="contents" value="${update.contents}"></textarea>
  		</div> 
  		
 		  <input  type="file" class="form-control" id="file" aria-describedby="inputGroupFileAddon04" aria-label="Upload" name="pics">
		  <div class="fw-bold fs-5 col-12 mt-3">
               	<div class="input-group mb-3 my-3">
				  <div class="input-group-text" style="height : 40px;">
				    <input class="form-check-input mt-0 deleteCheck" type="checkbox"  name="fileNum" aria-label="Checkbox for following text input">
				  </div>
				  <input type="text" disabled value="${update.boardFileDTO.oriName}" class="form-control" aria-label="Text input with checkbox">
				  <button class="btn btn-outline-secondary" type="button" id="button" data-filenum="${update.boardFileDTO.fileNum}" data-num= "${update.num }" style="height : 40px;">X</button>
				</div>
              </div> 
  		
	

	  <div class="col-12">	
	    <button type="submit" class="btn btn-primary">수정</button>
	  </div>
	  
	</form>
</div>	

   <c:import url="../template/footer.jsp"></c:import>
   <c:import url="../template/common_js.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>   
<script type="text/javascript" src="../resources/js/noticeUpdate.js"></script>
 <script>
 	$("#contents").summernote({
		height : 300
	});
 	
	$("#important").click(function(){
	 	if($("#important").is(":checked")) {
	        $("#important").val(1);
	    } else {
	        $("#important").val(0);
	    }
	})
	

	
	if($("#important").val() == 1) {
		$("#important").prop("checked", true)
	}

	
	
</script>
</body>
</html>