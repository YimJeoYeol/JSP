<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<%
	//DB 필요한 객체 선언 //이거 둘다 interface임
	Connection conn = null;
	Statement stm = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userId = "system";
	String password = "1234";
	
	
	//DB 드라이버 로딩
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch (ClassNotFoundException e) {
		System.out.print(e);
	}
	//DB 연결, conn 커넥션 객체 생성
	try {
		conn = DriverManager.getConnection(url, userId, password);
		
		//쿼리 만들기
		
		//stm 받기, 스테이트먼트 생성 -> Connection 객체로부터 받는다.
		stm = conn.createStatement();
		
		//stm 수행하고 처리
		stm.executeUpdate("alter table woori modify name varchar2(10) not null");
		stm.executeUpdate("alter table woori add email varchar(30)");
		stm.executeUpdate("alter table woori add password number");
		
		rs = stm.executeQuery("select * from woori");
		ResultSetMetaData rsmd = rs.getMetaData();
		System.out.print("테이블이 수정되었습니다. <br>");
		System.out.print(rsmd.getColumnCount() + "개의 칼럼을 가지고 있습니다. <br><hr>");
		
		for(int i=1; i <= rsmd.getColumnCount(); i++){
			System.out.print(i + "번째 컬럼명은 "+ rsmd.getColumnName(i)+"<br>");
			System.out.print(i + "번째 컬럼의 유형은 " + rsmd.getColumnType(i)+ "<br>");
			System.out.print(i + "번째 컬럼의 크기는 " + rsmd.getPrecision(i)+ "<br><hr>");
		}
		
	} catch (SQLException e) {
		System.out.print(e);
	} finally {
		//DB연결 해제
		try {
			if(rs != null) rs.close();
			if(stm != null) stm.close();
			if(conn != null) conn.close();
			
		} catch(SQLException e) {
			System.out.print(e);
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
	<a href="main.html">main으로 가기</a>
</body>
</html>