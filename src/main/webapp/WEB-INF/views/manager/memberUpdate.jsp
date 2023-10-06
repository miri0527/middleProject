<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
<c:import url="../template/common_css.jsp"></c:import>

<c:import url="../template/managerHeader.jsp"></c:import>


<section class="bg-light">
        <div class="container py-4">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center" href="/">
                    <img src="/resources/imgs/logo.png" alt="" id="ig">                
                </a>
            </div>
            
            <form action="./memberUpdate" method="post" id="frm">
            
            
                <div class="form-group has-success">
					<label class="form-label mt-4" for="memberPw">비밀번호</label>
					<input type="password" class="form-control" readonly="readonly" id="adMemberPw" name="pw" value="${dto.pw}">
					<div class="valid-feedback" id="pwCom"></div>
				</div>
				 <div class="form-group">
               		<label for="memberName" class="form-label mt-4">아이디</label>
                    <input type="text" class="form-control" id="adMemberID" aria-describedby="emailHelp" name="id" value="${dto.id}">
                </div>
              
                <div class="form-group">
               		<label for="memberName" class="form-label mt-4">이름</label>
                    <input type="text" class="form-control" id="adMemberName" aria-describedby="emailHelp" name="name" value="${dto.name}">
                </div>
                <div class="form-group">
					<label for="memberAddress" class="form-label mt-4">주소</label>
				 <input type="text" class="form-control" id="adMemberAddress" aria-describedby="emailHelp" name="address" value="${dto.address}">
			 	</div> 
				 <div class="form-group">
					<label for="memberAddress" class="form-label mt-4">휴대폰 번호</label>
				 <input type="text" class="form-control" id="adMemberPhone" aria-describedby="emailHelp" name="phone" value="${dto.phone}">
			 	</div>                
                <div class="form-group">
               		<label for="memberEmail" class="form-label mt-4">이메일</label>
                    <input type="email" class="form-control" id="adMemberEmail" aria-describedby="emailHelp" placeholder="선택입력" name="email" value="${dto.email}">
                </div>
                
                <label for="memberRoleNum" class="form-label mt-4">회원등급</label>
                <select class="form-select" aria-label="Default select example" name="roleNum">
				  <option selected>전체</option>
				  <option value="1" ${dto.roleDTO.roleNum eq '1'? 'selected': ''}>관리자</option>
				  <option value="2" ${dto.roleDTO.roleNum eq '2'? 'selected': ''}>판매자</option>
				  <option value="3" ${dto.roleDTO.roleNum eq '3'? 'selected': ''}>회원</option>
				</select>
								<div class="d-grid gap-2">
                    <button class="btn btn-primary btn-lg" type="submit" id="update">수정하기</button>
                </div>
			
            </form>
        </div>
    </section>
     

<c:import url="../template/common_js.jsp"></c:import>
<script type="text/javascript" src="../resources/js/adminMemberUpdate.js"></script>
</body>
</html>