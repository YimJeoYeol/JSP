<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	//DB하고 프로그램하고 연결시키는 연결자를 불러오는 코드임.
	Connection conn = null;
	Statement st = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("오라클 드라이버 로딩 완료");
	}catch (ClassNotFoundException e){
		System.out.println(e);
	}
	//DriverManager 클래스에 있는 메서드를 사용해서, 연결자를 불어온다.
	
	try{
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE"
				, "system"
				, "1234");
		/* 	Driver가 제대로 연결되어서 null이 있는지 출력해서 확인했다.
	 	out.println("<br>"+ conn); */
		System.out.println("DB 연결 완료");
		//query 문장을 만들었음, id와 name (a, b)
		String query = ("create table woori(id varchar2(10) primary key, name varchar2(10))"); 
		//query 문을 사용하기 위해서는 state 문장을 가지고 와야함. 그걸 createStatement를 사용해서 state 객체를 만들어서 불러온다
		st = conn.createStatement();
		System.out.println("<br>"+ st);
		//query 문을 시행하는 곳.
		st.executeUpdate(query);
		System.out.println("테이블 생성 성공");
		
		//해제할 때는 역순으로 닫아야 한다.
	
	}catch (SQLException e){
		System.out.println(e);
	}finally {
		try{
			//if문을 써서 DB닫기
			if(st!=null) st.close();
			if(conn!=null) conn.close();
			
/* 			//이렇게 하면 해당 데이터베이스가 열려있는지 모르기 때문에 if문을 써서 해줘야함.
			st.close();
			conn.close(); */
			
		} catch(SQLException e){
			System.out.println(e);
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