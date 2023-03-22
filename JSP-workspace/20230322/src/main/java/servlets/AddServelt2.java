package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/add2")
public class AddServelt2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>회원 등록</title></head>");
		out.println("<body><h1>회원 신규 등록</h1><hr>");
		out.println("<form action=\"add\" method=\"post\" name=\"form1\">");
		out.println("<table>");
		out.println("<tr><th>사용자 ID</th><td><input type=\"text\" name=\"id\"></td></tr>");
		out.println("<tr><th>암호</th><td><input type=\"password\" name=\"password\"></td></tr>");
		out.println("<tr><th>이름</th><td><input type=\"text\" name=\"name\"></td></tr>");
		out.println("<tr><th>이메일</th><td><input type=\"email\" name=\"emial\"></td></tr>");
		out.println("<tr><th colspan=\"2\">");
		out.println("<input type=\"submit\" value=\"확인\">");
		out.println("<input type=\"reset\"	value=\"다시 작성\"></th></tr>");
		out.println("</table></form></body></html>");
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전송된 Data 저장
		// 객체 준비
		//DB 로딩 및 연결
		//쿼리 만들기
		//쿼리 수행 및 처리
		//DB 해제
		request.setCharacterEncoding("UTF-8");
		Connection conn 		= null;
		/*
		 * Statement stm = null; ResultSet rs = null;
		 */
		String sql 				= "";
		PreparedStatement  pst  = null;
		
		String driverName 		= "oracle.jdbc.driver.OracleDriver";
		String url 				= "jdbc:oracle:thin:@localhost:1521:XE";
		String dbID 			= "system";
		String dbPassword 		= "1234";
		String id 				= request.getParameter("id");
		String name 			= request.getParameter("name");
		String emial 			= request.getParameter("emial");
		String password 		= request.getParameter("pasword");
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, dbID, dbPassword);
			/* stm = conn.createStatement(); */
			
			sql = "insert into woori values(?, ?, ?, ?)";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, name);
			pst.setString(3, emial);
			pst.setString(4, password);
			
			/* int result = */pst.executeUpdate();
			response.sendRedirect("list");
			/*
			 * PrintWriter out = response.getWriter();
			 * out.println("<html><head><title>회원신규결과</title></head>"); if(result <= 0) {
			 * out.println("<body><h3>등록실패</h3></body></html>"); }else {
			 * out.println("<body><h3>등록성공</h3></body></html>"); }
			 */
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {
				if(pst  != null)  pst.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				System.out.println(e);
			}
		}
	} 

}
