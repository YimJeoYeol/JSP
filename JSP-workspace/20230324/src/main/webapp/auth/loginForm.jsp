<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<h1>User Login</h1>
	<hr>
	<form action="login" method="post">
		<table>
			<tr><th> 아이디 </th><td><input type="text" name="id"></td></tr>
			<tr><th> 비밀번호 </th><td><input type="password" name="password"></td></tr>
			<tr><th colspan="2">
				<input type="submit" value="login">
				<input type="reset" value="cancel">
			</th></tr>
		</table>
	</form>
</body>
</html>