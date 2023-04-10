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
	<h1>json test page</h1>
	
	<div class="container-fluid" id="full">
		<div class="row">
			<div class="col-md-6 optionName my-2" id="optionName">
				<label>Name1</label>		
				<input type="text" id="optionName" data-option-depth="1">
				<button class="btn btn-danger" id="optionValueAdd1">optionValueAdd1</button>
			</div>
			<div class="col-md-6 optionValue my-2" id="optionValue">
				<label>Name1-Value1-depth-1</label>
				<input type="text" id="optionValue1" data-value-count="1">
				<button class="btn nameAdd btn-primary" id="optionNameAdd1" data-value-count="1" data-value-depth="1">optionNameAdd</button>
			</div>
		</div>
	</div>
	
	
	<button id="jsonButton" class="btn btn-danger col-md-5 float-end">toJson</button>
	
	<script src="/resources/js/jsontest3.js"></script>
	<!-- <script src="/resources/js/jsonTest.js"></script> -->
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>