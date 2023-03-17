<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cnt" scope="application" class="key.Counter"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Count 공부</title>
</head>
<body>
<%
	int count = 0;
	session = request.getSession();
	session.setMaxInactiveInterval(3);
	String first = (String)session.getValue("checkFirst");
	if(first != null){
		count = cnt.getCount();
	}else{
		cnt.setCount();
		count = cnt.getCount();
		session.putValue("checkFirst", "first");
	}
	/* session.setMaxInactiveInterval(1);
	String first = (String)session.getValue("checkfirst");
	
	/* if(first != null){
		count = cnt.getCount();
	}else{
		cnt.setCount();
		count = cnt.getCount();
		session.putValue("checkfirst", "first"); */
	//} 
	out.println("현재까지의 방문자 수 : " + count);
	
%>

</body>
</html>