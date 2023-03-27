<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,DTO.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h1>회원 목록</h1>
	<a href="add2">신규등록</a> 
 	<%-- <%
		Woori loginOne = (Woori)session.getAttribute("loginOne");
		if(loginOne == null){
			out.print("<a href='../auth/login'>로그인</a>");
		}else{
			out.print(loginOne.getName() + "<a href='../auth/logout'>로그아웃</a>");
		}
	%> 
	 --%>
	<hr>
	<%
	 	request.setCharacterEncoding("UTF-8");
		ArrayList<Woori> wooris = (ArrayList<Woori>)request.getAttribute("wooris");
		
	%>
		<table>
	<%	for(Woori tmp : wooris){ %>
			<tr><td><a href="update?id=<%=tmp.getId()%>"><%=tmp.getId()%></a></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getEmial()%></td>
				<td><%=tmp.getPassword()%></td>
			</tr>
	<%	}		
	%>
		</table>
		<!-- <a href="/">회원 추가</a> -->
</body>
</html>






