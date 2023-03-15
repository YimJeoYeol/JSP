<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request 객체 정보</h1>
	<hr>
	
	인코딩 방식 : <%=request.getCharacterEncoding() %><br>
	Mime 타입 : <%=request.getContentType() %><br>
	요청정보 길이 :<%=request.getContentLength() %><br>
	헤더이름 :<%=request.getHeaderNames() %><br>
	웹 전달 이름 경로 : <%=request.getPathInfo() %><br>
	웹 클라이언트 이름 : <%=request.getRemoteHost() %><br>
	웹 클라이언트 IP 주소 : <%=request.getRemoteAddr() %><br>
	웹 클라이언트 URL 경로 : <%=request.getRequestURI() %><br>
	전송방식 : <%=request.getMethod() %><br>
	프로토콜 이름 : <%=request.getProtocol() %><br>
	서버이름 : <%=request.getServerName() %><br>
	서버 포트 번호 : <%=request.getServerPort() %><br>
	
	<hr>
	<%=request.getParameter("msg") %><br>
	<%=request.getParameter("name") %><br>
	<%=request.getParameter("age") %>
</body>
</html>