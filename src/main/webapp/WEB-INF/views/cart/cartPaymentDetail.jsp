<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ORDERNUM</th>
								<th>PRODUCTNUM</th>
								<th>PRODUCTNAME</th>
								<th>ID</th>
								<th>PRODUCTEA</th>
								<th>TOTALPRICE</th>
								<th>ORDERDATE</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									${dto.orderNum}
								</td>
								<td>
									${dto.productDTO.productNum}
								</td>
								<td>
									${dto.productDTO.productName}
								</td>
								<td>
									${dto.id}
								</td>
								<td>
									${dto.productEa}
								</td>
								<td>
									${dto.totalPrice}
								</td>
								<td>
									${dto.orderDate}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<c:import url="../template/common_js.jsp"></c:import>
		</body>

		</html>