<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>

<body>
<c:import url="../template/header.jsp"></c:import>
<!-- 서버 내부 주소, 상대 경로  -->
	<div class="container-fluid my-5">
	<div class="row mb-4 border-bottom border-dark">
	<h1 class="col-md-7 mx-auto text-center pb-4"> ${boardName} page</h1>
	</div>	
	
	
	<!-- 템플릿 테스트  -->
	<section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
						<c:forEach items="${list}" var="dto">
                        <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${pageScope.dto.productNum}</h5>
                                    <!-- Product price-->
                                     ${pageScope.dto.productName}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="./detail?productNum=${dto.productNum}">product detail</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
         </div>
     </div>
</section> 
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>