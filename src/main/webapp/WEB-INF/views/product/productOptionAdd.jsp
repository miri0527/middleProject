<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/cart_common_css.jsp"></c:import>
</head>
<body>

	<form action="./productOptionAdd" method="post" id="frm">
	    <input type="hidden" name="json1" id="json1">
	    <div class="opi">
	        <button type="button" class="oi">옵션 네임</button>
	        <div class="op1">
	        OptionName:<input type="text" class="optionName0" name="optionName" data-depth="0" data-value="id1">
	        OptionValue :<input type="text" name="optionValue" data-depth="0" class="optionValue" data-value="idx2">
	      
	        <button type="button" class="opc" data-count="1">새로운 옵션</button>
	        <button type="button" class="opdd">옵션 삭제</button>
	        </div>
	        
	        </div>
	        
		<button type="button" id="btnFinish">옵션 생성하기</button>
	</form>

<script src="/resources/js/optionAdd.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/cart_common_js.jsp"></c:import>

</body>
</html>