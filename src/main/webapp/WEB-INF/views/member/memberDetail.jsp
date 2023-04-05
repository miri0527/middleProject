<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>


	<div class="container-fluid md-auto">

		<div class="mb-3 row">
			<label for="memberID" class="col-sm-2 col-form-label">Id</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberID" value="${dto.id}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="memberRoleName" class="col-sm-2 col-form-label">RoleName</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberRoleName" value="${dto.roleDTO.roleName}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="memberPW" class="col-sm-2 col-form-label">Pw</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberPW" value="${dto.pw}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="memberName" class="col-sm-2 col-form-label">Name</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberName" value="${dto.name}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="memberAddress" class="col-sm-2 col-form-label">Address</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberAddress" value="${dto.address}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="memberPhone" class="col-sm-2 col-form-label">Phone</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberPhone" value="${dto.phone}">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="memberEmail" class="col-sm-2 col-form-label">Email</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="memberEmail" value="${dto.email}">
			</div>
		</div>

		<a href="./memberPwCheck" class="btn btn-danger offset-md-6">수정</a>

	</div>
	
	
	<div class="card mb-15">
		<div class="card-header" id="headingOne">
			<h4 class="card-title">
				<a data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">My Personal
					Information</a>
			</h4>
		</div>
		<div id="collapseOne" class="collapse show"
			aria-labelledby="headingOne" data-bs-parent="#accordion">
			<div class="card-body">
				<form action="#">
					<div class="new-customers">
						<div class="p-30">
							<div class="row">
								<div class="col-sm-6">
									<input type="text" readonly class="form-control-plaintext"
										id="memberID" value="${dto.id}">
								</div>
								<div class="col-sm-6">
									<input type="text" readonly class="form-control-plaintext"
					id="memberRoleName" value="${dto.roleDTO.roleName}">
								</div>
								<div class="col-sm-6">
									<input type="text" readonly class="form-control-plaintext"
					id="memberName" value="${dto.name}">
								</div>
								<div class="col-sm-6">
									<input type="text" readonly class="form-control-plaintext"
					id="memberAddress" value="${dto.address}">
								</div>
								<div class="col-sm-6">
									<input type="text" readonly class="form-control-plaintext"
					id="memberPhone" value="${dto.phone}">
								</div>
								<div class="col-sm-6">
									<input type="text" readonly class="form-control-plaintext"
					id="memberEmail" value="${dto.email}">
								</div>
							</div>
							
							
							<div class="row">
								<div class="col-md-6">
									<button class="submit-btn-1 mt-20 btn-hover-1" type="submit"
										value="register">Save</button>
								</div>
								<div class="col-md-6">
								<a href="./memberPwCheck"><button class="submit-btn-1 mt-20 btn-hover-1 f-right"
										type="reset">수정</button></a>
									
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>