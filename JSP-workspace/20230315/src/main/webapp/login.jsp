
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 : <%=id %><br>
패스워드 : <%=pw %><br>
<%
	
	
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	if(id.equals("admin") && pw.equals("1234")){
		out.print("로그인 성공");
	}else{
		out.print("로그인 실패");
	}
%>
</body>
</html>