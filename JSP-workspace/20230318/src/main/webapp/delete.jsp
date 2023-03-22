<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//필요한 변수 선언
	Connection conn = null;
	Statement stm = null;
	String sql = "";
	int result = 0;

	String className = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbID = "system";
	String dbPassword = "1234";
	
	//select.jsp에서 넘어온 id 받기
	String id = request.getParameter("id");

	//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
	try{
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
		stm = conn.createStatement();
		
		sql = "delete from woori where id = '"+id+"'";
		result = stm.executeUpdate(sql);
		
	} catch (ClassNotFoundException e){
		out.print(e);
	} catch (SQLException e) {
		out.print(e);
	} finally {
		if(result > 0){
    		out.print("<br>"+id+" 데이터가 삭제되었습니다.<br>");
    	} else {
    		out.print("<br>데이터 삭제 실패했습니다.<br>");
    	}
		try {
			if(stm != null) stm.close();
			if(conn != null) conn.close();
		} catch (SQLException e){
			out.print(e);
		}
		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>
	<a href="main.html">Main으로 가기</a>
</body>
</html>