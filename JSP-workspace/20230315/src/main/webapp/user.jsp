<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="info" class="chap1.User" scope="request"/>
<jsp:setProperty property="name" name="info"/>
<jsp:setProperty property="num" name="info"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
	<table>
		<tr><th colspan="2">JSP Bean테스트</th></tr>
		<tr><th> 이 름 </th><td><input type="text" name="name" value="<%=info.getName()%>"></td></tr>
		<tr><th> 학 번 </th><td><input type="text" name="num"- value ="<%=info.getNum()%>"></td></tr>
		<tr>
		<th colspan="2">
			<input type="submit" value="보내기">
			<input type="reset" value="다시쓰기">
		</th></tr>
	</table>
	</form>
	<jsp:include page="SetGet.jsp"/>
</body>
</html>