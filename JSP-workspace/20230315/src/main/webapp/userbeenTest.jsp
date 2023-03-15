<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="chap1.*"%>
 <%-- <% 
 	User u1 = new User();
 %> --%>
 <jsp:useBean id="u1" class="chap1.User"/>
 <jsp:setProperty property="name" name="u1" value="유관순" />
 <jsp:setProperty property="num" name="u1" value=""/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 이름 : <%=u1.getName() %><br>
	나이 : <%=u1.getNum() %> --%>
	<jsp:getProperty property="name" name="u1"/><br>
	<jsp:getProperty property="num" name="u1"/>
</body>
</html>