<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
	    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Subas || Home-3</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
</head>
<body>
	<c:if test="${member eq null || member.roleDTO.roleNum ne 1}">
	 <c:import url="./template/common_css.jsp"></c:import>
		<c:import url="./template/home.jsp"></c:import>
	 <c:import url="./template/common_js.jsp"></c:import>	
	</c:if>
	
	<c:if test="${member.roleDTO.roleNum eq 1 }">
	 <c:import url="./template/common_css.jsp"></c:import>
		<c:import url="./template/managerHome.jsp"></c:import>
	 <c:import url="./template/common_js.jsp"></c:import>	
	</c:if>
    
  
   
</body>
</html>