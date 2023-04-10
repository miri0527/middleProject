<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

	<form action="./productOptionAdd" method="post" id="frm">
	    <input type="hidden" value="${dto0[0].productNum}" id="productNum">
	    <div class="opi">
	        <button type="button" class="oi">옵션 네임</button>
	        <c:forEach items="${dto0}" var="dto0">
		        <div class="op1">
		        OptionName:<input type="text" value="${dto0.optionName}" class="optionName0" name="optionName" data-depth="0" data-value="id1">
		        OptionValue :<input type="text" value="${dto0.optionValue}" name="optionValue" data-depth="0" class="optionValue" data-value="idx2">
		        <!-- <button type="button" class="opv">벨류 추가</button>  -->
		        <button type="button" class="opc" data-count="1">새로운 옵션</button>
		        <button type="button" class="opdd">옵션 삭제</button>
		        <c:forEach items="${dto1}" var="dto1">
		        	<c:if test="${dto1.ref == dto0.optionNum}">		        	
			        	<div class="opa offset-md-2">
		    				OptionName:<input type="text" value="${dto1.optionName}" data-depth="1" name="optionName" id="optionName" class="optionName1">'
		    				OptionValue :<input type="text" value="${dto1.optionValue}" data-depth="1" name="optionValue" class="optionValue">
						    <button type="button" class="opcii" data-count="10">새로운 옵션</button>
						    <button type="button" class="opd">옵션 삭제</button>
						    <c:forEach items="${dto2}" var="dto2">
						    	<c:if test="${dto2.ref == dto1.optionNum}">
						    	<div class="opb offset-md-1">
								   	OptionName:<input type="text" value="${dto2.optionName}" data-depth="2" name="optionName" id="optionName" class="optionName2">
								    OptionValue :<input type="text" value="${dto2.optionValue}" data-depth="2" name="optionValue" class="optionValue">
								    Price :<input type="text" value="${dto2.productPrice}" data-depth="2" name="price" class="price">
								    Stock :<input type="text" value="${dto2.productStock}" data-depth="2" name="stock" class="stock">
								    <button type="button" class="opd">옵션 삭제</button>
							    </div>
						    	</c:if>
						    </c:forEach>
					    </div>
		        	</c:if>
		        </c:forEach>
		        
		        </div>	        
	        </c:forEach>
	        
	        </div>
	        
		<button type="button" id="btnFinish">옵션 수정하기</button>
	</form>

<script src="/resources/js/optionUpdate.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>