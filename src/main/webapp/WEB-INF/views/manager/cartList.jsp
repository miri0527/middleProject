<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
	<div class="row my-5">
		<h1>결제리스트</h1>
	</div>
	
	
		<div class="row">
			<table class="table table-hover text-center">
				<tr>
					<th>상품명</th>
					<th>아이디</th>
					<th>가격</th>
					<th>구입수량</th>
					<th>결제날짜</th>	
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.optionName }</td>
						<td>${dto.id}</td>
						<td>${dto.totalPrice }</td>
						<td>${dto.productTea }</td>
						<td>${dto.orderDate }</td>
						
					</tr>
				</c:forEach>
			</table>
			
		</div>		
</div>	
</body>
</html>