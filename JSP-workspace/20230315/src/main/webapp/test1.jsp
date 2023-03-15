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
	session.invalidate();
	session    = request.getSession();
	/* session.setMaxInactiveInterval(5); */
	
	String[] a = session.getValueNames();
	out.print("세션 ID : " + session.getId() + "<BR>");
	out.print("세션 유지시간 : " + session.getMaxInactiveInterval() + "<BR>");
	
	if(a.length == 0){
		session.putValue(session.getId(), "A");
	}else{
		String what = (String)session.getValue(a[0]);
		out.print("이름 : " + a[0] + "값 : " + what + "<BR>");
		session.putValue(session.getId(), what + "A");
	}
%>
<a href = test1.jsp>다시읽기</a>
</body>
</html>