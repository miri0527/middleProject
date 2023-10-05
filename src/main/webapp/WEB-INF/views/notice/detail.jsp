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
#root {
  width: 100%;
  /* margin: 0 auto; */
  max-width: 400px;
  margin-top : 10px;
}


.form textarea {
  resize: none;
  border: 1px solid #dbdbdb;
  padding: 15px 20px;
  outline: none;
}
.form .submit {
  border: 1px solid #8f8f8f;
  background-color: #8f8f8f;
  color: #fff;
  padding: 5px;
  cursor: pointer;
}
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
				         <td colspan="4" class="text-left" valign="top" height="200">
				         	<pre style="white-space: pre-wrap;border:none;background-color: white; font-size: 30px;">${boardDTO.contents}</pre>
				         	<c:forEach items="${boardDTO.boardFileDTOs}" var="fileVO">
								<img class="fileIcon" width="450" height="550" src="/resources/upload/notice/${fileVO.fileName}"  style="margin-right: 5px">
			                       
		                    </c:forEach>
				         		
				         </td>   
				       
			         </tr>
			         
			        
				</table>
				
			</div>
		</div>
	</div>
	<div style="margin-top: 10px;">
	   <p>댓글 보기</p>
	</div>
	

   	<div id="replyList"  style="margin-bottom: 30px;">
		
   	</div>
  
   	
	
	<c:if test="${not empty member.id }">
		<div style="margin-top: 10px;">
		   <p>댓글 등록</p>
		</div>
		
		<div id="root">
			  <form class="form comment-form" method="post" action="/noticeReply/add" id="addBtn">
				  <input type="hidden" name="num" value="${boardDTO.num}">
				  <input type="hidden" name="id" value="${member.id}">
				    <textarea placeholder="댓글을 남겨보세요." name="contents" id="contents"></textarea>
				    <button style="font-weight : bold" id="submit">등록하기</button>
			  </form>
	   </div>
   </c:if>
  
  <c:if test="${boardDTO.id eq member.id }">
	<form action="./update" id="frm">
	<input type="hidden" name="num" value="${boardDTO.num}">
		<div class="wrapper" style="float : right; margin-bottom:20px;">
			<button class="btn btn-primary" type="submit">수정</button>
			<button class="btn btn-danger" id="deleteBtn">삭제</button>
		</div>
	
	</form>
  </c:if>

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
	
		
	/* 댓글 등록 */
	
	$("#submit").click(function() {
		if($("#contents").val() !='') {
			addBtn.submit();
		}else{
			alert("내용을 입력해주새요.");
			return false;
		}
	})
	


	
/* 	let xhttpReply = new XMLHttpRequest();

	xhttpReply.open('GET', '/notice/replyList');
	
	xhttpReply.send();
	     	
	xhttpReply.addEventListener('readystatechange', function(){
	    if(this.readyState==4 && this.status==200){
	        document.getElementById("replyList").innerHTML=this.responseText.trim();
	    }
	
	}); */
	
	/* 댓글 보기 */
	
	$.ajax({
	    url: '/notice/replyList',
	    type: 'GET',
	    data : {
	    	num : ${boardDTO.num}
	    },
	    success: function(response) {
	        $("#replyList").html(response.trim());
	    }
	});



	
</script>
</body>
</html>