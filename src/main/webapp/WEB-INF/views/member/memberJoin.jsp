<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	#ig{
		width: 256px;
		height: 256px;
	}

</style>
</head>
<body>
<c:import url="../template/common_css.jsp"></c:import>
	
	  <section class="bg-light">
        <div class="container py-4">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center" href="/">
                    <img src="/resources/imgs/logo.png" alt="" id="ig">                
                </a>
            </div>
            <form action="./memberJoin" method="post" id="frm">
                <div class="form-group" id="divId">
               		<label for="memberID" class="form-label mt-4">아이디</label>
                    <input type="text" class="form-control" id="memberID" name="id">
                    <button type="button" id="dup">중복 검사</button>
					<div class="valid-feedback" id="com"></div>
                </div>
				<div class="form-group has-success">
					<label class="form-label mt-4" for="memberPw">비밀번호</label>
					<input type="password" class="form-control" id="memberPw" name="pw">
					<div class="valid-feedback" id="pwCom"></div>
				</div>

				<div class="form-group has-danger">
					<label class="form-label mt-4" for="memberPw1">비밀번호 재확인</label> 
					<input type="password" class="form-control" id="memberPw1" name="pw1">
					<div class="invalid-feedback" id="pwCom1"></div>
				</div>
                <div class="form-group">
               		<label for="memberName" class="form-label mt-4">이름</label>
                    <input type="text" class="form-control" id="memberName" aria-describedby="emailHelp" name="name">
                </div>
                <div class="form-group">
					<label for="memberAddress" class="form-label mt-4">주소</label>
				 <input type="text" class="form-control" id="memberAddress" aria-describedby="emailHelp" name="address">
			 	</div> 
				 <!-- <div class="form-group">
					<label for="memberAddress" class="form-label mt-4">상세 주소</label>
				 <input type="text" class="form-control" id="address_detail" aria-describedby="emailHelp" name="address1">
			 	</div>  -->
				 <div class="form-group">
					<label for="memberAddress" class="form-label mt-4">휴대폰 번호</label>
				 <input type="text" class="form-control" id="memberPhone" aria-describedby="emailHelp" name="phone">
			 	</div>                
                <div class="form-group">
               		<label for="memberEmail" class="form-label mt-4">본인 확인 이메일</label>
                    <input type="email" class="form-control" id="memberEmail" aria-describedby="emailHelp" placeholder="선택입력" name="email">
                </div>	
				
				<div class="d-grid gap-2">
                    <button class="btn btn-primary btn-lg" type="button" id="btn1">가입하기</button>
                </div>

            </form>
        </div>
    </section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
			document.getElementById("memberAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
				//카카오 지도 발생
				new daum.Postcode({
					oncomplete: function(data) { //선택시 입력값 세팅
						document.getElementById("memberAddress").value = data.address; // 주소 넣기
						//document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
					}
				}).open();
			});
		}
		</script>
	<script src="/resources/js/memberJoin.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>