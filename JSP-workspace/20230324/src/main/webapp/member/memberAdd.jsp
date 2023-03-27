<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>신규 회원 등록</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		border-collapse: collapse;
		padding : 3px;
		text-align: center;
		}
</style>
<script>
	function check(){
		/* blank는 값이 비어있는지 확인하는 용도이다.  */
		var blank = 0;
		if(form1.id.value == "") blank=1;
		if(form1.password.value == "") blank=1;
		if(form1.name.value == "") blank=1;
		if(form1.email.value == "") blank=1;
		
		if(blank == 1){
			/* alert 경고창 띄우는 거임 */
			alert("모든 내용을 입력하세요!");
			return false;
		} 
		return true;
	}
	/* 비밀번호가 숫자인지 확인하는 것  */
	function check_num(str){
		/* if is not Number -> 내장함수 숫자가 아니면 : ture, 숫자이면 : false*/
		if(isNaN(str)){
			alert("숫자만 입력하세요.")
			return ""; /* 빈 문자열을 반환함. 그래서 문자열을 넣으면 입력했던 모든 값이 지워짐.*/
		}
		return str;	
	}
</script>
</head>
<body>
	<h1>신규 회원 등록</h1>
	<hr>
	<!-- action에 mapping 정보중에 마지막 꺼만 적으면 됨. -->
	<form action="add2" method="post" name="form1" onsubmit="return check();">
	<table>
		<!-- name은 데이터베이스의 칼럼명과 동일하게 해야함.  -->
		<tr><th>사용자 ID</th><td><input type="text" name="id"></td></tr>
		<tr><th>암호</th><td><input type="password" name="password" onkeyup="this.value=check_num(this.value)"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>이메일</th><td><input type="email" name="emial"></td></tr>
		<tr><th colspan="2">
			<input type="submit" value="확인">
			<input type="reset"	value="다시 작성">		
		</th></tr>
	</table>
	</form>
</body>
</html>