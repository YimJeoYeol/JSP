<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정하기</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		border-collapse: collapse;
		}
</style>
<script>
	function blankCheck() {
		var blank = 0;
		if(selectData.id.value == "") blank=1;
		if(selectData.password.value == "") blank=1;
		
		if(blank == 1) {
			alert("모든 내용을 입력하세요!");
			return false;
		}
		return true;
	}
	function check_num(str){
		if(isNaN(str)){
			alert("숫자만 입력하세요.")
			return "";
		}
		return str;
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	//필요한 객체 선언
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	//DB 정보
	String className = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbID = "system";
	String dbPassword = "1234";
	
	//select.html에서 넘어온 정보 담기
	String id = request.getParameter("id");
	int password = Integer.parseInt(request.getParameter("password"));
	
	//드라이버 로딩하기
	try{	
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
		
		//prepareStatement 객체 생성 + 쿼리문 작성 --> 프리페어는 쿼리문을 매개변수로 넣어야해서 먼저 작성해야함.
		String sql = "select * from woori where id=? and password=?";
		pst = conn.prepareStatement(sql);
		//숫자는 데이터베이스의 위치가 아니고, 쿼리문의 위치임.
		pst.setString(1, id);
		pst.setInt(2, password);
		//쿼리문 수행
		rs = pst.executeQuery();
		
		if(!(rs.next())){
			out.print("정보가 없습니다");
		}
%>
<!-- try문 중간에 끊어도 그냥 되는거임? 된다. -->
		<h1>회원 정보 수정하기</h1>
		<hr>
		조회한 id의 정보는 다음과 같습니다. 수정할 정보를 입력하거나 삭제하세요.
		<form action="update.jsp" method="post" name="selectData" onsubmit="return blankCheck();">
		<table>
			<tr><th>이름</th><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
			<tr><th>사용자 ID</th><td><input type="text" name="id" value="<%=rs.getString("id")%>"></td></tr>
			<tr><th>비밀번호</th><td><input type="text" name="password" value="<%=rs.getString("password")%>" onkeyup="this.value=check_num(this.value)"></td></tr>
			<tr><th>이메일</th><td><input type="text" name="email" value="<%=rs.getString("email")%>"></td></tr>
			<tr><th colspan="2">
			<input type="submit" name="update" value="수정하기">
			<button type="button" onclick="location.href='delete.jsp?id=<%=id%>'">삭제하기</button>
			</th></tr>
<%
	} catch(ClassNotFoundException e) {
		out.print(e);
	} catch(SQLException e) {
		out.print(e);
	} finally {
		try {
			if(pst != null) pst.close();
			if(conn != null) conn.close();
		}catch(SQLException e){
			out.print(e);
		}
	}
%>
	
</table>
	<a href="main.html">Main으로 가기</a>
</form>
</body>
</html>