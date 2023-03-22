<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 정보 보기</title>
<style>
	table, tr, td, th {
		border : 2px solid red;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<%
	//문자 인코딩
	request.setCharacterEncoding("UTF-8");

	//필요한 객체 선언
	Connection conn = null; //드라이버 연결자.
	Statement stm = null;	//쿼리문을 작성 statement 객체
	ResultSet rs = null;	//쿼리문 결과를 담을 resultSet 객체
	String sql = null;		//쿼리문을 담을 변수
	
	String className = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbID = "system";
	String dbPassword = "1234";

	try {
		//드라이버 로딩
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
		stm = conn.createStatement();
		
		//쿼리문 만들기
		sql = "select * from woori order by id";
		//데이터베이스에서 전체 가져온 결과가 rs(resultSet)에 전부 담겨져 있음.
		rs = stm.executeQuery(sql); 
%>
<!-- 스크립트 문을 중간에 끊어서 html body를 작성  -->
		<h1>우리 회원 정보 보기</h1>
		<hr>
		<table>
			<tr><th>사용자 ID</th><th>이름</th><th>이메일</th><th>pw</th></tr>
			
		
<%
		//등록된 회원이 있는지 없는지 체크
		//테이블에 정보가 하나도 없을 때
		if(!(rs.next())) { // 값이 없어야지 false가 되고 !가 붙어서 true가 되어서 if문이 실행하게 된다. if문은 true일 때 실행이 되니까.
			out.print("등록된 회원이 없습니다.");
		//테이블에 정보가 있으면 갯수만큼 화면에 출력
		} else { //rs.next는 레코드 단위로 값을 가지고옴.
			do{
				out.print("<tr><td>" + rs.getString(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getInt(4) + "</td></tr>");
			}while(rs.next());
		}
	} catch (ClassNotFoundException e){
		out.print(e);
	} catch (SQLException e){
		out.print(e);
	} finally {
		try {
			if(rs != null) rs.close();
			if(stm != null) stm.close();
			if(conn != null) conn.close();
		} catch (SQLException e){
			out.print(e);
		}
	}
%>
</table>
	<a href="main.html">메인으로 가기</a>
</body>
</html>