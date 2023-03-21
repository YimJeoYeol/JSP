<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;

	try{
		/* Class.forName("com.mysql.cj.jdbc.Driver"); */
		Class.forName("oracle.jdbc.driver.OracleDriver");
		out.print("드라이버 로딩 완료");
	}catch(ClassNotFoundException e){
		out.print(e);
	}
	try{
		/* conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member ? useUnicode=true", "root","1111"); */
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","1234");
	 	out.print("DB 연결 완료");
		 String query = "create table woori(id varchar2(10) primary key, name varchar2(10))";
		st = conn.createStatement();
		out.print("<BR>" + st);
		st.executeUpdate(query);
		out.print("테이블 생성 성공!"); 
		st.close();
		conn.close();
	}catch(SQLException e){
		out.println(e);
	}finally{
		try{
			if(st != null)   st.close();
			if(conn != null) conn.close();
		}catch(SQLException e){
			out.print(e);
		}
	}



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>