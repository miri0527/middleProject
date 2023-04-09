<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:import url="../template/common_css.jsp"></c:import>

</head>
<body> 

	<c:import url="../template/header.jsp"></c:import>

	 
		<img class="mb-4" src="/resources/imgs/logo.png" alt="" width="72"
			height="57">
		

		
	
<div class="col-lg-10 mx-auto">
                            <div class="registered-customers">
                                <h6 class="widget-title border-left mb-50">REGISTERED CUSTOMERS</h6>
                                <form action="./memberLogin" method="post">
                                    <div class="login-account p-30 box-shadow">
                                        <p>If you have an account with us, Please log in.</p>
                                        <input type="text" class="form-control" id="floatingInput"
																				placeholder="ID입력" name="id" value="${cookie.remember.value}">
                                        <input type="password" class="form-control" id="floatingPassword"
																					placeholder="바밀번호입력" name="pw">
                                        <!-- <p><small><a href="#">Forgot our password?</a></small></p> -->
                                        <label> <input type="checkbox" value="remember"
																						name="remember"> ID 저장
																				</label>
																				<div>
																				<a href="./memberIdFind"><button type="button" class="submit-btn-1 btn-hover-1">ID찾기</button></a> 
																				<a href="./memberPwFind"><button type="button" class="submit-btn-1 btn-hover-1">PW찾기</button></a>
                                        <button class="submit-btn-1 btn-hover-1" type="submit">login</button>
                                        
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
<%-- 	<c:import url="../template/common_js.jsp"></c:import> --%>
	
</body>
</html>