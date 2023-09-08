<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mb-3 row">
	
	<input type="hidden" name="productNum" value="${dto.productDTO.productNum}">
	<table>
   			<tr>
   				<th>옵션번호</th>
   				<th>색</th>
   			</tr>
   			<c:forEach items="${list}" var="productOptionDTOs">
   			<tr>
   				<td>${productOptionDTOs.optionNum}</td>
   				<td>${productOptionDTOs.optionName}</td>
   				<td>${productOptionDTOs.optionValue }</td>
   				<td>${productOptionDTOs.productPrice }</td>
   			</tr>
   			</c:forEach>
   	</table>
	
</div>
</body>
</html>