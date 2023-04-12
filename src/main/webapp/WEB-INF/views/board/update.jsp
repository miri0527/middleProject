<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<h1>${boardName} Update page</h1>
	<form action="./update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num}">
		<input type="hidden" name="productNum" value="${dto.productNum}">
		<input type="hidden" name="regdate" value="${dto.regDate}">
		<div class="mb-3">
		  <label for="writer" class="form-label">작성자</label>
		  <input type="text" name="id" readonly value="${dto.id}" class="form-control" id="id">
		</div>
		
		
		<c:if test="${boardName eq qna}">
		<div class="mb-3">
		  <label for="title" class="form-label">제목</label>
		  <input type="text" name="title" class="form-control" value="${dto.title}" id="title" placeholder="제목 입력">
		</div>
		</c:if>
		
		<div class="mb-3">
		  <label for="contents" class="form-label">내용</label>
		  <textarea name="contents" class="form-control" id="contents" placeholder="내용 입력" rows="7">${dto.contents}</textarea>
		</div>

		<div class="mb-3 my-5">
			<button class="my btn btn-danger" type="submit">글쓰기</button>
		</div>
	</form>
	<c:import url="../template/footer.jsp"></c:import>
	<script>
		$("#contents").summernote();
	</script>
</body>
</html>