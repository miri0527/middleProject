<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/common_css.jsp"></c:import>
<div class="container-fluid md-auto">

<div class="mb-3 row">

	<input type="hidden" name="id" value="${id.id}">
    <label for="memberID" class="col-sm-2 col-form-label">Id</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberID" value="${dto.id}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="memberRoleName" class="col-sm-2 col-form-label">RoleName</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberRoleName" value="${dto.roleDTO.roleName}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="memberPW" class="col-sm-2 col-form-label">Pw</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberPW" value="${dto.pw}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="memberName" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberName" value="${dto.name}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="memberAddress" class="col-sm-2 col-form-label">Address</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberAddress" value="${dto.address}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="memberPhone" class="col-sm-2 col-form-label">Phone</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberPhone" value="${dto.phone}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="memberEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="adMemberEmail" value="${dto.email}">
    </div>
  </div>

	<a href="./memberUpdate?id=${dto.id}"><button type="button" class="btn btn-primary">회원수정</button></a>
	<form action="./memberDelete" method="post" id="frm2">
		<input type="hidden" name="id" value="${dto.id}">
		<button type="submit" id="deleteBtn" class="btn btn-danger">탈퇴처리</button>
	</form>
	
</div>

<script type="text/javascript" src="../resources/js/adminMemberDetail.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>