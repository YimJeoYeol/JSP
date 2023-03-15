<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	JSP 컨테이너 정보 : <%=application.getServerInfo() %><br>
	JSP 컨테이너 Major 버젼 : <%=application.getMajorVersion()%><br>
	
	JSP 컨테이너 Major 버젼 : <%=application.getMinorVersion() %>
	
</body>
</html>