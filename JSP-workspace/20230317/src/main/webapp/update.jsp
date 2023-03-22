<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection 		  conn   	 = null;
	PreparedStatement pst    	 = null;
	String 			  sql    	 = "";
	int 			  result 	 = 0;
	String 			  className  = "oracle.jdbc.driver.OracleDriver";
	String 			  url        = "jdbc:oracle:thin:@localhost:1521:XE";
	String 			  dbID 	     = "system";
	String 			  dbPassword = "1234";
	
	//넘어온 정보 담기
	String 			 name 		 = request.getParameter("name");
	String   		 id			 = request.getParameter("id");
	String 			 emial		 = request.getParameter("emial");
	
	try {
		//드라이버 로딩
		Class.forName(className);
		conn = DriverManager.getConnection(url, dbID, dbPassword);
		sql = "update woori set name= ?, EMIAL=? where id=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, name);
		pst.setString(2, emial);
		pst.setString(3, id);
		
	
		result = pst.executeUpdate();
		
		
	}catch(ClassNotFoundException e){
		out.print(e);
	} catch (SQLException e){
		out.print(e);
	}catch(Exception e){
		out.print(e);
	}finally {
	
		if(result > 0){
		
		
			
    		out.print("<br>데이터가 성공적으로 수정되었습니다.<br>");
    		
    		
    	} else {
    		out.print("<br>데이터 수정에 실패했습니다.<br>");
    	}
		try {
		
			if(pst  != null) pst.close();
			if(conn != null) conn.close();
		} catch (SQLException e){
			out.print(e);
		}
	}
%>
<jsp:forward page="selectAll.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//전송된 데이터 저장하기
	//객체 준비
	//드라이버 로딩
	//DB연결
	//****쿼리 만들기="update woori set name=?, EMIAL=? where id=?"
	//*** pst 객체 만들기 --> 쿼리 완성 -- > 수행하고 결과 처리 -- > 전체 회원 출력
	//DB해제
%>



	<a href="main.html">Main으로 가기</a>
</body>
</html>