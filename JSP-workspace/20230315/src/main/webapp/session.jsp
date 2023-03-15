<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String sessionId = session.getId();
		int sessionTime = session.getMaxInactiveInterval();
		out.print(id + " 님 환영합니다.");
		out.print("생성된 session ID : " + sessionId);
		out.print("세션 유지 시간 : " + sessionTime);
		
	%>
</body>
</html>