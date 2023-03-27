<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* , java.util.* , dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자유게시판</h1>
	<a href="add">글쓰기</a>
	<table>
		<tr><th> 번 호 </th><th> 제 목 </th><th> 등  록 자 </th><th> 날 짜 </th><th> 조 회 </th></tr>
		<% 
		ArrayList<Fboard> list = (ArrayList<Fboard>)request.getAttribute("list");
		for(Fboard tmp : list){
		%>
		<tr><td><%= tmp.getId() %></td>
			<td><a href=""><%= tmp.getSubject() %></td>
			<td><%= tmp.getName() %></td>
			<td><%= tmp.getInputdate() %></td>
			<td><%= tmp.getReadcount() %></td></tr>
		<% } %>
	</table>
</body>
</html>