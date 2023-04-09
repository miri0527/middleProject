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
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="form-floating" id="findPw">
      <input type="text" class="form-control" id="IdFind" placeholder="Id입력">
      <label for="floatingInput">Id입력</label>
      <input type="text" class="form-control" id="emailFind" placeholder="Email입력">
      <label for="floatingInput">email입력</label>
      <button type="button" id="btn1">찾기</button>
    </div>
<script src="/resources/js/memberIdFind.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>