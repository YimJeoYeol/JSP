<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table, tr, td, th {
		border : 2px solid black;
		border-collapse: collapse;
		padding : 3px;
		text-align: center;
	}
</style>
<script>
	function check(){
		/* blank는 값이 비어있는지 확인하는 용도이다.  */
		var blank = 0;
		if(form1.id.value == "") blank=1;
		if(form1.name.value == "") blank=1;
		if(form1.email.value == "") blank=1;
		if(form1.subject.value == "") blank=1;
		if(form1.content.value == "") blank=1;
		if(form1.password.value == "") blank=1;
		if(blank == 1){
			/* alert 경고창 띄우는 거임 */
			alert("모든 내용을 입력하세요!");
			return false;
		} 
		if(form1.org_password.value != form1.password.value){
			alert("password가 일치하지 않습니다.!");
		}
		return true;
	}
	function delete_conform(){
		var result = confirm("삭제하시겠습니까?");
		/* console.log(result); */
		if(result){
			form1.action = "delete";
			form1.method="get";
			form1.submit();
		}else{
			return false;
		}
	}
</script>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
	<h1>게시글 수정하기</h1>
	<hr>
<%
	FBoard one = (FBoard)request.getAttribute("one");
%>
<!-- body -->
	현재 게시글: <%=one.getName()%>
	<form action="update" method="post" name="form1" onsubmit="return check();">
	<!-- 왜 hidden으로 사용하는가?  -->
	<input type="hidden" name="id" value="<%=one.getId()%>">
	<input type="hidden" name="org_password" value="<%=one.getPassword()%>">
<%-- 	 <input type="hidden" name="step" value="<%=one.getStep()%>">
	<input type="hidden" name="masterid" value="<%=one.getMasterid()%>">
	<input type="hidden" name="replynum" value="<%=one.getReplynum()%>"> --%> 
		<table>
			<tr><th>이름</th><td><input type="text" name="name" value="<%= one.getName() %>"></td></tr>
			<tr><th>이메일</th><td><input type="email" name="email" value="<%= one.getEmail() %>">작성일 : <%= one.getInputdate() %></td></tr>
			<tr><th>제목</th><td><input type="text" name="subject" value="<%= one.getSubject()%>">조회 : <%= one.getReadcount() %></td></tr>
			<tr><th>내용</th><td><textarea rows="15" cols="50" name="content"><%= one.getContent() %></textarea></td></tr>
			<tr><th>암호</th><td><input type="password" name="password" value=""></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="다시쓰기">
				<a href="list"> 목록 </a>
				<a href="rInsert?id=<%=one.getId()%>"> 답 글 </a>
				<input type="button" value="삭제" onclick="delete_conform();">			
			</td></tr>
		</table>	
	</form>
<!-- body -->
</body>
</html>