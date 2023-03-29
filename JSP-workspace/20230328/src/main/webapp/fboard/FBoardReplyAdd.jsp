<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 쓰기</title>
</head>
<body>
<% FBoard one = (FBoard)request.getAttribute("one"); %>
	<h1>답글 쓰기</h1>
	<hr>
	<form action="" method="post">
		<input type="hidden" name="step" value="<%=one.getStep()%>">
		<input type="hidden" name="masterid" value="<%=one.getMasterid()%>">
		<input type="hidden" name="replynum" value="<%=one.getReplynum()%>">
		<table>
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>이메일</th><td><input type="email" name="email"></td></tr>
			<tr><th>제목</th><td><input type="text" name="subject" value="RE:<%=one.getSubject()%>"></td></tr>
			<tr><th>내용</th><td><textarea rows="15" cols="50" name="content"><%=one.getContent()%>---------------------</textarea></td></tr>
			<tr><th>암호</th><td><input type="password" name="password"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="저장">
				<input type="reset" value="다시쓰기">			
			</td></tr>
		</table>	
	</form>
</body>
</html>