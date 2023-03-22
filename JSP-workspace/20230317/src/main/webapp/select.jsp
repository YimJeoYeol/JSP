<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//전송된 id , password를 저장시키기
// 객체준비
//드라이버 로딩
//DB연결
//쿼리 만들기 ="select * from woori where id=? and password = ?"
//pst 생성 --> 쿼리 완성 --> 수행하고 결과 받기 --> 화면출력
//DB해제
%>
<%
	//문자 인코딩
	request.setCharacterEncoding("UTF-8");

	//필요한 객체 선언
	
	Connection conn        = null;
	Statement  st          = null;
	ResultSet  rs          = null; 
	String     sql         = null;
	PreparedStatement  pst = null;
	
	String className 	   = "oracle.jdbc.driver.OracleDriver";
	String url 			   = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbID 		   = "system";
	String dbPassword      = "1234";
	String id 			   = request.getParameter("id");
	String password 	   = request.getParameter("password");
	
	
	try {
		//드라이버 로딩
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
	
		
		//쿼리문 만들기
		sql = "select * from woori where id = ? and password = ?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, password);
		rs = pst.executeQuery();
		if(!(rs.next())){
			out.print("해당 회원 없습니다. <br>");
		}else{%>
		 사용자 ID가 <%=rs.getString("id") %>인 회원의 정보는 다음과 같습니다.<br> 		
		<form action="update.jsp" method="post">
			<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<table>
				<tr><th> 이 름 : </th><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
				<tr><th> E-mail :</th><td><input type="email" name="emial" value="<%=rs.getString("emial")%>"></td></tr>
				<tr><th colspan="2">
				<input type="submit" value="수정하기">
				<a href="delete.jsp?id=<%=rs.getString("id") %>">삭제하기</a>
				</th></tr>
			</table>
		</form>
			
			
		<% 
		}
					 
					} catch (ClassNotFoundException e){
						out.print(e);
					} catch (SQLException e){
						out.print(e);
					} finally {
						try {
							if(rs != null) rs.close();
							if(pst != null) pst.close();
							if(st != null) st.close();
							if(conn != null) conn.close();
						} catch (SQLException e){
							out.print(e);
						}
					}
				%>
	<hr>
	<a href="main.html">Main으로 가기</a>  <a href="">조회페이지로</a>
</body>
</html>