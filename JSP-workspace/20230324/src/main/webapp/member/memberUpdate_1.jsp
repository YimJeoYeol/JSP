<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DTO.*"%>
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
<meta charset="UTF-8">
<title>회원 정보 수정하기</title>
</head>
<body>
<h1>회원 정보 수정하기</h1>
<hr>
<%
  request.setCharacterEncoding("UTF-8");
  Woori one = (Woori)request.getAttribute("one");
  //Woori라는 클래스 타입의 참조변수 one을 통해서 UpdateServlet에서 조회해서 가져온 Woori 객체를 참조한다.
  //참조변수명.get() 메서드를 사용해서 해당 클래스 객체가 가지고 있는 변수의 정보를 호출할 수 있다.

%>
<!-- body  -->
		조회한 id: <%=one.getId()%>의 정보는 다음과 같습니다. 수정할 정보를 입력하거나 삭제하세요.
		<form action="update" method="post" name="selectData" onsubmit="return blankCheck();">
		<input type="hidden" name="id" value="<%=one.getId()%>">
		<table>
			<tr><th>아이디</th><td><input type="text" name="id" value="<%=one.getId()%>" readonly></td></tr>
			<tr><th>비밀번호</th><td><input type="text" name="password" value="<%=one.getPassword()%>" disabled></td></tr>
			<tr><th>이름</th><td><input type="text" name="name" value="<%=one.getName()%>" maxlength="10"></td></tr>
			<tr><th>이메일</th><td><input type="text" name="email" value="<%=one.getEmial()%>"></td></tr>
			<tr><th colspan="2">
			<input type="submit" name="update" value="수정하기">
			<button type="button" onclick="location.href='delete?id=<%=one.getId()%>'">삭제하기</button>
			</th></tr>
		</table>
		</form>
<!-- body  -->
</body>
</html>