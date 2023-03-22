<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%
    request.setCharacterEncoding("UTF-8");
  	//필요한 객체 선언
    Connection conn = null;       //드라이버 연결자
	Statement stm = null;
    PreparedStatement pst = null; //프리페어 스테이트먼트
    ResultSet rs = null;
    String sql = null;            //쿼리문 만들려고 선언하는 것.
    int result = 0;               //Update 성공여부를 담을 변수
    
    String className = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbID = "system";
    String dbPassword = "1234";
    
    //전송된 Data 저장하기, 변수명도 칼럼명, name명 동일하게 해야 안 헷갈림
    //파라메타를 받아오는 것은 무조건 string 타입임.
    String id = request.getParameter("id");
    int password = Integer.parseInt(request.getParameter("password"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    
    try {
    	//DB드라이버 로딩
    	Class.forName(className);
    	
    	//DB 커넥션 객체 생성
    	conn = DriverManager.getConnection(url, dbID, dbPassword);
    	
    	//스테이트먼트 객체 생성
    	stm = conn.createStatement();
    	
    	//스테이트먼트 쿼리문, 데이터베이스에 저장하는 쿼리문 작성
    	/* sql = "insert into woori values ('"+id+"','"+name+"','"+email+"',"+password+")";
    	//쿼리문 수행 DB가 수정되기 때문에 executeUpdate 사용함
    	int result = stm.executeUpdate(sql); //반환타입이 int다 정상적으로 수행했는지 알려준다. 정상수행이면 1, 아니면 0 or -1
    	System.out.print(sql); //값이 제대로 저장했는지 콘솔에서 확인
    	if(result > 0){
    		out.print(result); //어떤 값이 반환했는지 확인하려고 찍어봄.
    		out.print("데이터가 성공적으로 입력되었습니다.<br>");
    	} else {
    		out.print(result); //어떤 값이 반환했는지 확인하려고 찍어봄.
    		out.print("데이터 저장에 실패했습니다.<br>");
    	} */
    	
    	//프리페어 스테이트먼트 쿼리문 작성
    	sql = "insert into woori values(?,?,?,?)"; //와일드카드
    	pst = conn.prepareStatement(sql);
 		pst.setString(1, id);
 		pst.setString(2, name);
 		pst.setString(3, email);
 		pst.setInt(4, password);
 		System.out.print(sql);
 		
 		//쿼리문 실행, 프리페어 스테이트먼트는 매개변수를 주지 않아도 된다.
 		result = pst.executeUpdate(); //반환된 int 값으로 정상적으로 수행했는지 확인하는 것.
 		
    } catch (ClassNotFoundException e) {
    	out.print(e);
    } catch (SQLException e) {
    	out.print(e);
    } finally {
    	//성공 여부 확인함, try 문 안에 있을 경우 update가 실패하면 catch 문으로 바로 넘어가서 finally 안에 넣음.
    	if(result > 0){
    		out.print("<br>데이터가 성공적으로 입력되었습니다.<br>");
    	} else {
    		out.print("<br>데이터 저장에 실패했습니다.<br>");
    	}
    	try {
    		if(pst != null) pst.close();
    		if(stm != null) stm.close();
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
<title>회원 정보 입력하기</title>
</head>
<body>
	<br>
	<a href="main.html">Main으로 가기</a><br>
	<a href="insert.html">회원등록 페이지로 이동</a>
</body>
</html>