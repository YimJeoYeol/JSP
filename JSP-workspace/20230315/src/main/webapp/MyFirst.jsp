<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
   
 <%!int i = -10; //선언문
 	public int sum(){
		int a = 10;
		int b = 20;
		int c;
		
		
		c = a + b;
		return c;
	 }
 %>
 <% 
 int j = 0; 
 if(i > 0) j = i;
 else j = -100;
 /*지역변수로 들어가기때문에 위것이랑 다르다 로컬변수로 들어가있다.*/
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP 서버 만들기:<%= j/*표현식*/ %></h1>
	<hr>
	합: <%=sum() %>
	<form action="" method="get">
		ID : <input type = "text" name="id"><br>
		pw : <input type = "password" name="password"><br>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
	<hr>
	<%
		String name = "홍길동";
		/*내장객체가 있다.*/
		out.print("당신의 이름은 " + name + " 입니다.");
	%>
	<br>
	당신의 이름은 <%=name %>
	<hr>
	<%
		Date d = new Date();
		
	%>
	<%=d %>
	<hr>
	<h1><a href="https://www.naver.com">네이버</a></h1>
	<h1><a href="Test.jsp">test.jsp</a></h1>
	<hr>
	<jsp:include page="Test.jsp"/>
	<hr>
	<jsp:forward page="move.jsp"/>
	
</body>
</html>