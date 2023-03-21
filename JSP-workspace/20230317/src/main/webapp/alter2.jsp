<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<% 
	Connection conn = null;
	Statement  st 	= null;
	ResultSet  rs 	= null;
	String     url  = "jdbc:oracle:thin:@localhost:1521:xe";
	String userId   = "system";
	String password = "1234";
//드라이버 로딩
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
	}catch(ClassNotFoundException e){
		out.print(e);
	}

//DB연결 : conn 받기
	try{
		conn = DriverManager.getConnection(url,userId,password);
		st = conn.createStatement();
		/* st.executeUpdate("alter table woori modify name varchar2(10) not null");
		st.executeUpdate("alter table woori add emial varchar2(30)");
		st.executeUpdate("alter table woori add password number");   */
		
		rs = st.executeQuery("select * from woori");
		ResultSetMetaData rsmd = rs.getMetaData();
		out.print("테이블 수정되었습니다. <BR>");
		out.print(rsmd.getColumnCount() + "개의 컬럼(필드)을 가지고 있습니다.<BR>");
		for(int i = 0; i <= rsmd.getColumnCount(); i++){
			out.print(i + "번째 컬럼은 " + rsmd.getColumnName(i));
			out.print("이고 유형은 " + rsmd.getColumnTypeName(i));
			out.print("이며 크기는 " + rsmd.getPrecision(i) + "<BR>");
		}
	}catch(SQLException e){
		out.print(e);
	}finally{
		try{
			
			if(rs != null)   rs.close();
			if(st != null)   st.close();
			if(conn != null) conn.close();
		}catch(SQLException e){
			out.print(e);
		}
	}
//쿼리받기
/* 	try{
	
				
	}catch(SQLException e){
		out.println(e);		
	} */
//st 받기
//st실행하기
//DB ㅇ녀결하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href = "main.html">main으로 </a>
</body>
</html>