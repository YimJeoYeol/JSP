<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="chap1.*" %>
<jsp:useBean id="info" class="chap1.User" scope="request"></jsp:useBean>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재값 : <br>
	<jsp:getProperty property="name" name="info"/><br>
	<jsp:getProperty property="num" name="info"/>
	
	<br>
	Form으로부터 설정된 값 : <br>
	<jsp:setProperty property="name" name="info"/><br>
	<jsp:setProperty property="num" name="info"/><br>
		<jsp:getProperty property="name" name="info"/><br>
	<jsp:getProperty property="num" name="info"/>
	
	<br>
	직접 설정한 값 :<br>
	<jsp:setProperty property="name" name="info" value="모짜르트"/>
	<jsp:setProperty property="num" name="info" value="12345"/>
	<jsp:getProperty property="name" name="info"/><br>
	<jsp:getProperty property="num" name="info"/>
	
</body>
</html>