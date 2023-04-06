<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신청</title>
</head>
<body>
	 <form action="./memberApplication" method="post" enctype="multipart/form-data">
	 	<label>아이디:</label>
	 	<input type="text" name="id">
        <label>이름:</label>
        <input type="text" name="name"><br>
        <label>이메일:</label>
        <input type="email" name="email" ><br>
        <label>비밀번호:</label>
        <input type="password" name="pw"><br>
        <label>전화번호:</label>
        <input type="text" name="phone"><br>
        <input type="submit" value="판매자 신청">
    </form>
</body>
</html>