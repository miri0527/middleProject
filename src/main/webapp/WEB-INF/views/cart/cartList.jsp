<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<c:import url="../template/common_css.jsp"></c:import>
			<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
			<link rel="stylesheet" href="/resources/lib/css/nivo-slider.css">
			<link rel="stylesheet" href="/resources/css/core.css">
			<link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
			<link rel="stylesheet" href="/resources/style.css">
			<link rel="stylesheet" href="/resources/css/responsive.css">
			<link rel="stylesheet" href="/resources/css/custom.css">
			<link rel="stylesheet" href="/resources/css/style-customizer.css">
			<script src="/resources/js/vendor/modernizr-3.11.2.min.js"></script>
			<link href="#" data-style="styles" rel="stylesheet">
		</head>

		<body>
		
			<div class="container-fluid">
			<c:if test="${member eq null || member.roleDTO.roleNum ne 1}">
				<c:import url="../template/header.jsp"></c:import>
			</c:if>
			<c:if test="${member.roleDTO.roleNum eq 1 }">
				<c:import url="../template/managerHeader.jsp"></c:import>
			</c:if>
				<div class="col-lg-10 mx-auto">
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- shopping-cart start -->
						<div class="tab-pane active" id="shopping-cart" role="tabpanel">
							<div class="shopping-cart-content">
								<div class="table-content table-responsive mb-50">
									<table class="text-center">
										<thead>
											<tr>
												<th class="checkbox"><input type="checkbox" class="checkAll"></th>
												<th class="product-thumbnail">product</th>
												<th class="product-price">price</th>
												<th class="product-quantity">Quantity</th>
												<th class="product-subtotal">total</th>
												<th class="product-remove">note</th>
											</tr>
										</thead>
										<tbody>
									
											<c:forEach items="${list}" var="dto" varStatus="i">
												<tr>
													<td class="checkbox">
														<input type="checkbox" class="check"
															data-orderNum="${dto.orderNum}">
													</td>
													<td class="product-thumbnail orderNum" id="orderNum-${i.count}">
														
														
															<p class="text-center">${dto.productDTO.productName}</p>
														
															<p class="optionName text-center">${list2[i.index].optionName}</p>
														<!-- 이미지 추가 -->
														<input type="hidden" value="${dto.productDTO.productPrice}"
															id="price-${i.count}">
													</td>
													<td class="product-price">${dto.productDTO.productPrice}</td>
													<td class="product-quantity">
														<c:if test="${dto.buyCheck == 0 }">
															<div class="cart-plus-minus mx-auto">
																<div class="dec qtybutton btnN" id="btnN${i.count}">-
																</div>
																<input type="text" value="${dto.productEa}"
																	name="qtybutton" class="cart-plus-minus-box ea" readonly>
																<div class="inc qtybutton btnP" id="btnP${i.count}">+
																</div>
															</div>
														</c:if>
														<c:if test="${dto.buyCheck == 1 }">
															<input type="text" value="${dto.productEa}" name="qtybutton"
																class="cart-plus-minus-box mx-auto" readonly>
														</c:if>
													</td>
													<td class="product-subtotal totalPrice" id="totalPrice-${i.count}"
														data-all-idx="${i.count}">${dto.totalPrice}</td>
													<td class="product-remove buttons">
													</td>
												</tr>
											
												
												
											</c:forEach>

										</tbody>
									</table>

								</div>
										
								
								<button class="btn btn-primary selectPayment float-end mx-2">Payment Selected</button>
								
								<button class="btn btn-primary selectedDelete float-end">Delete Selected</button>
							</div>
						</div>
						<!-- shopping-cart end -->
					</div>
				</div>

			</div>
			
			<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
			<script src="/resources/js/cartUpdate1.js"></script>
			<c:import url="../template/cart_common_js.jsp"></c:import>
		
			
		</body>

		</html>
		