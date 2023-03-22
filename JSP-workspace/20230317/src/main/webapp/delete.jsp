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
	//문자 인코딩
	request.setCharacterEncoding("UTF-8");
	String id 			   = request.getParameter("id");
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
	
	try{
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
		
		sql = "delete from woori where id=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);
		
		pst.executeUpdate();
		
	} catch (ClassNotFoundException e){
		out.print(e);
	} catch (SQLException e){
		out.print(e);
	} finally {
		try {
			if(pst  != null) pst.close();
			if(conn != null) conn.close();

		} catch (SQLException e){
			out.print(e);
		}
	}
	
%>
<jsp:forward page="selectAll.jsp"></jsp:forward>
</body>
</html>