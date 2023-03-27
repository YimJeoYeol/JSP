<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글 쓰기</title>
</head>
<body>
	<h1>새글 쓰기</h1>
	<hr>
	<form action="" method="post">
		<table>
			<tr><th> 이 름 </th><td><input type="text" name="name"></td></tr>
			<tr><th> E-mail </th><td><input type="text" name="email"></td></tr>
			<tr><th> 제 목 </th><td><input type="text" name="subject"></td></tr>
			<tr><th> 내 용 </th><td><textarea rows="5" cols="100" name="content"></textarea></td></tr>
			<tr><th> 암 호 </th><td><input type="password" name="password"></td></tr>
			<tr><th colspan="2">
								<input type="submit" value="저장">
								<input type="reset" value="다시쓰기">
								</th></tr>
		</table>
	</form>
</body>
</html>