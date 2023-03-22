<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h1>회원 목록</h1>
	<hr>
	<%
		ArrayList<Woori> wooris= (ArrayList<Woori>)request.getAttribute("wooris");
		
		//향상된 for 구문
		/* for(int i=0; i<wooris.size(); i++){ */
		for(Woori tmp: wooris){
	%>	
			<table>
			<tr><td><%= tmp.getId() %></td>
			<td><%= tmp.getName() %></td>
			<td><%= tmp.getEmial() %></td>
			<td><%= tmp.getPassword() %></td></tr>
			</table>
		<% 
			}
		%>
	
	
	
	
</body>
</html>