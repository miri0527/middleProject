<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${list[0].depth eq 1}">
	<select id="depth${list[0].depth}" class="form-select opt">
	<option value="0">${list[0].optionName} 선택</option>

	<!-- 옵션 리스트를 반복문으로 출력 -->
	<c:forEach items="${list}" var="op">
		
		<option value="${op.optionNum}" id="OptionNum${list[0].depth}"  data-productnum="${op.productNum}" data-productprice="${op.productPrice}">${op.optionValue}</option>
		<!-- 옵션 번호와 상품 번호를 data 속성으로 설정 -->
		
		
		
	</c:forEach>

	</select> <!-- select 태그 종료 -->
</c:if>
	<c:if test="${list[0].depth eq 2}">
	<select id="depth${list[0].depth}" class="form-select opt" name="optionNum" >
		<option value="0">${list[0].optionName} 선택</option>
	
		<!-- 옵션 리스트를 반복문으로 출력 -->
		<c:forEach items="${list}" var="op">
			
			<option value="${op.optionNum}" id="OptionNum${list[0].depth}"  data-productnum="${op.productNum}" data-productprice="${op.productPrice}">${op.optionValue}</option>
			<!-- 옵션 번호와 상품 번호를 data 속성으로 설정 -->
			
			
			
		</c:forEach>
	
		</select> <!-- select 태그 종료 -->
	</c:if>
	