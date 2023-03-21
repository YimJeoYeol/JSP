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
	
	Connection conn     = null;
	Statement  st       = null;
	ResultSet  rs       = null; 
	String     sql      = null;
	PreparedStatement  pst = null;
	
	String className = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbID = "system";
	String dbPassword = "1234";
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	
	try {
		//드라이버 로딩
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
	
		
		//쿼리문 만들기
		sql = "select * from woori where id = ? and password = ?";
		pst = conn.prepareStatement(sql);
		if(!(rs.next())){%>
		해당정보가 없습니다.

<%
			
		}else{
			if(password.equals(rs.getString("password"))){%>
				사용자 ID가 <%= id %>인 회원의 정보는 다음과 같습니다.
				정보를 변경하려면 내용을 입력한 다음 <수정하기>버튼을 누르세요
				<form name="form1" method="post" action="update.jsp">
				<input type="hidden" name="id" value="<%=id %>">
				<br> 이름 :
				<input type="text" name="name" vlaue="<%rs.getString("name")%>">
				<br> email :
				<input type="text" name="email" vlaue="<%rs.getString("email")%>">
				<input type="submit" name="change" value="수정하기">
				<a href="delete.jsp?id=<%=id%>">삭제하기</a>
				
				</form>
				<%} else { %>
				비밀번호가 틀립니다.
				<%
			}
		}
		
		rs = pst.executeQuery(sql); 
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
</body>
</html>