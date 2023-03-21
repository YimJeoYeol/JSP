<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<style>
	table, tr, td, th {
		border : 2px solid red;
		border-collapse: collapse;
	}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 

	request.setCharacterEncoding("UTF-8");
	Connection conn     = null;
	Statement  st       = null;
	ResultSet  rs       = null; 
	String     sql      = null;
	PreparedStatement  pst = null;
	
	String     url      = "jdbc:oracle:thin:@localhost:1521:xe";
	String     userId   = "system";
	String     userPw   = "1234";

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,userId,userPw);
		st = conn.createStatement();
		rs = st.executeQuery("select * from woori orderby id");
		/* st.executeQuery(sql); */
		
	%>
	<h1>우리 회원정보보기</h1>
	<hr>
	<table>
	  <tr>
	    <th>사용자 ID</th><th>이름</th><th>Email</th><th>비밀번호</th></tr>
	  
	

	
	<%
		if(!rs.next()){
			out.print("등록된 회원이 없습니다.");
		}else{
			//테이블에 정보가 있으면 갯수만큼 화면에 출력
			do{
				out.print("<tr><td>"+rs.getString(1) + "</td>" );
				out.print("<td>"+rs.getString(2) + "</td>");
				out.print("<td>"+rs.getString(3)+ "</td>");
				out.print("<td>"+rs.getInt(4)    + "</td></tr>");
				
			}while(rs.next());
		} 
	}catch(ClassNotFoundException e){
		out.print(e);
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
	
%>
	
	</table>
</body>
</html>