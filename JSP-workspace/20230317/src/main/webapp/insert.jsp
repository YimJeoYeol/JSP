<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<% 
	request.setCharacterEncoding("UTF-8");

	
	
	Connection conn     = null;
	Statement  st       = null;
	/* ResultSet  rs       = null; */
	String     sql      = null;
	PreparedStatement  pst = null;
 	int 	   cnt		= 0; 
	String     url      = "jdbc:oracle:thin:@localhost:1521:xe";
	String     userId   = "system";
	String     userPw   = "1234";
	String     id       = request.getParameter("id");
	int        password = Integer.parseInt(request.getParameter("password"));
	String     name     = request.getParameter("name");
	String     email    = request.getParameter("email");
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,userId,userPw);
		/* st = conn.createStatement(); */
		
//		sql = "insert into woori values('"+id+"', '"+name+"', '"+email+"', "+password+")";
		sql = "insert into woori values(?, ?, ?, ?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1, id);
		pst.setString(2, name);
		pst.setString(3, email);
		pst.setInt(4, password);
		
		System.out.println(sql);
		int result = pst.executeUpdate();
		/* st.executeUpdate(sql); */
		/* int result = st.executeUpdate(sql); */
		
		if(result > 0){
			out.print("데이터가 성공적으로 입력되었습니다.<BR>");
		}else{
			out.print("데이터가 입력되지 않았습니다.<BR>");
		}
		
		
	}catch(ClassNotFoundException e){
		out.print(e);
	}catch(SQLException e){
		out.print(e);
	}finally{
		try{
			
		/* 	if(rs != null)   rs.close(); */
			if(pst != null) pst.close();
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
	<a href = "main.html">Main으로 </a>  <a href="insert.html">[회원등록 페이지]</a>
</body>
</html>