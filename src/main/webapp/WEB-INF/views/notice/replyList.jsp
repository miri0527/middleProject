<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<style type="text/css">
	a {
		font-size : 13px;
		color : gray;
	}
</style>
</head>
<body>
<div class="card">
		<c:forEach items="${list}" var="reply" >
		<c:set value="${reply.replyNum}" var="replyNum"></c:set>
			<div style="width : 100%; color : black; font-size : 20px;  font-weignt : bold; margin-left : 30px; margin-top : 10px; margin-bottom : 20px;"  >
				<div id="parent">
					<div style="height : 30px;" >${reply.id }
						<c:if test="${member.id eq reply.id}">
							<div class="replyDelete" style="float : right; margin-right : 50px;">
								<div>
									<a href="javascript:void(0);" data-num="${replyNum}"> 삭제</a>
								</div>
							</div>
							
							<div class="replyUpdate" style="float : right; margin-right : 10px;">
								<div>
									<a href="javascript:void(0);" data-num="${replyNum}">수정</a>
								</div>
							</div>
							
						</c:if>	
					</div>
 					
					<div style="width : 100%;" >
						<div class="contents">
							<div style="color : gray; font-size : 16px;" class="list" data-replynum=""${replyNum}" data-contents = "${reply.contents}" >${reply.contents }</div>
						</div>
					</div>
					
					
					<c:if test="${reply.modifyDate eq null }">
						<div style="font-size : 13px;">
							<frm:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd.  HH:mm"/>
							<a href="javascript:void(0);" data-num="${replyNum}">답글 쓰기</a>
						</div>
					</c:if>
					<c:if test="${reply.modifyDate ne null }">
						<div style="font-size : 13px;">
							<frm:formatDate value="${reply.modifyDate}" pattern="yyyy-MM-dd.  HH:mm"/>
							<a href="javascript:void(0);" data-num="${replyNum}">답글 쓰기</a>
						</div>
					</c:if>
					
				</div>	
				
			</div>
			
		
			
		</c:forEach>
	
</div>	

<script type="text/javascript" src="/resources/js/replyList.js"></script>
<script type="text/javascript">

/* 댓글 수정 폼 */

$(".replyUpdate").on("click", "[data-num]", function () {
	 let replyNum = $(this).data("num");
	 let contents = $(this).closest("#parent").find("[data-contents]").data("contents");
	$.ajax({
		url : '/noticeReply/update',
		type : 'GET',	
		data : {
			replyNum : replyNum
		},
		success : function(response) {
					
			  		let updateForm = "<div class='update'><form class='form comment-form' method='post' action='/noticeReply/update' id='updateBtn'>"
	                + "<input type='hidden' name='replyNum' value='" + replyNum + "'>" 
	                + " <textarea name='contents' id='content'>"+ contents + "</textarea>"
	                + " <button style='font-weight: bold'>수정</button>"
	                + " <button style='font-weight: bold' data-num='" + replyNum +"' class='cancel' type='button'>취소</button>"
	                + "</form></div>";

	               $(".contents").find("[data-replynum]").append(updateForm);
			
		}
	})
})



</script>
</body>
</html>