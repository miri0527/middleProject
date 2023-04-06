<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<div class="container-fluid">
		<div class="row col-md-10 mx-auto my-5">		
			<h1 class="mb-3">CartAdd</h1>
			<form action="./cartAdd" method = "post">
				<div class="mb-3">
					<label for="id" class="form-label">ID</label>
					<input type="text" class="form-control" id="id" name="id" value="${mDTO.id}" readonly>
				</div>
				<div class="mb-3">
					<label for="productNum" class="form-label">ProductNum</label>
					<input type="text" class="form-control" id="productNum" name="productNum" value="${pDTO.productNum}" readonly>
				</div>
				<div class="mb-3">
					<label for="ProductName" class="form-label">ProductName</label>
					<input type="text" class="form-control" id="ProductName" name="productName" value="${pDTO.productName}" readonly>
				</div>
				<div class="mb-3">
					<label for="OptionNum" class="form-label">OptionNum</label>
					<input type="text" class="form-control" id="OptionNum" name="optionNum" value="${pDTO.optionNum}" readonly>
				</div>
				<div class="mb-3">
					<label for="OptionName" class="form-label">OptionName</label>
					<input type="text" class="form-control" id="OptionName" name="optionName" value="${pDTO.optionName}" readonly>
				</div>
				<div class="mb-3">
					<label for="ProductPrice" class="form-label">ProductPrice</label>
					<input type="text" class="form-control" id="productPrice" name="productPrice" value="${pDTO.productPrice}" readonly>
				</div>
				<div class="mb-3">
					<label for="productEa" class="form-label">ProductEA</label>
					<input type="text" class="form-control" id="productEa" name="productEa" value="1">
				</div>
				<div class="mb-3">
					<label for="totalPrice" class="form-label">TotalPrice</label>
					<input type="text" class="form-control" id="totalPrice" name="totalPrice">
				</div>
				<button type="submit" class="btn btn-primary float-end">Submit</button>
			</form>
		</div>
	</div>
	<script src="/resources/js/cartAdd.js"></script>
	<c:import url="../template/cart_common_js.jsp"></c:import>
</body>
</html>