<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<div id="root">
		  <form class="form comment-form" method="post" action="/noticeReply/update" id="updateBtn">
			  <input type="hidden" name="replyNum" value="${noticeReply.replyNum}">
			    <textarea name="contents" id="contents" >${noticeReply.contents}</textarea>
			    <button style="font-weight : bold" id="update">수정</button>
			    <button style="font-weight : bold" id="cancel" type="button">취소</button>
		  </form>
	  </div>
</body>
<script type="text/javascript">
	
</script>
</html>
