<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	//필요한 변수 선언
	Connection conn = null;
	PreparedStatement pst = null;
	String sql = "";
	int result = 0;
	
	String className = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbID = "system";
	String dbPassword = "1234";
	
	//넘어온 정보 담기
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	int password = Integer.parseInt(request.getParameter("password"));
	String emial = request.getParameter("emial");
	
	//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
	try {
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
		
		sql = "update woori set name=?, id=?, password=?, emial=? where id = ?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, name);
		pst.setString(2, id);
		pst.setInt(3, password);
		pst.setString(4, emial);
		pst.setString(5, id);
		
		result = pst.executeUpdate();
		
	} catch (ClassNotFoundException e){
		out.print(e);
	} catch (SQLException e){
		out.print(e);
	} finally{
		if(result > 0){
    		out.print("<br>데이터가 성공적으로 수정되었습니다.<br>");
    	} else {
    		out.print("<br>데이터 수정에 실패했습니다.<br>");
    	}
		try {
			if(pst != null) pst.close();
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
<title>회원 정보 수정하기</title>
</head>
<body>
	<hr>
	<a href="selectAll.jsp">수정된 정보 보기</a><br>
	<a href="main.html">Main으로 가기</a>
</body>
</html>