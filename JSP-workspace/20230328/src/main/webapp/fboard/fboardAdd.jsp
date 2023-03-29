<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table, tr, td, th {
		border : 2px solid black;
		border-collapse: collapse;
		padding : 3px;
	}
</style>
<!-- javaScript로 데이터 빈값 확인하는 함수 만들기. -->

<title>새글 쓰기</title>
</head>
<body>
	<h1>새글 쓰기</h1>
	<hr>
	<form action="add" method="post">
		<table>
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>이메일</th><td><input type="email" name="email"></td></tr>
			<tr><th>제목</th><td><input type="text" name="subject"></td></tr>
			<tr><th>내용</th><td><textarea rows="15" cols="50" name="content"></textarea></td></tr>
			<tr><th>암호</th><td><input type="password" name="password"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="저장">
				<input type="reset" value="다시쓰기">			
			</td></tr>
		</table>	
	</form>
</body>
</html>