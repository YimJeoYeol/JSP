package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/list")
public class ListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		String sql = "";
		
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbID = "system";
		String dbPassword = "1234";
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, dbID, dbPassword);
			stm = conn.createStatement();
			
			sql = "select * from woori order by id desc"; //내림차순으로
			rs = stm.executeQuery(sql);
			//Driver 연결까지는 jsp와 코드가 다른게 없음.
			
			//응답해줄 때 보내주는 객체를 가져옴???-> 이게 무슨 말일까 다시 생각해봐라.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html><head><title>회원목록</title></head>");
			out.println("<body><h1>회원 정보 보기</h1>");
			out.println("<hr>");
			out.println("<table><tr><th>id</th><th>name</th><th>emaㅑl</th><th>password</th></tr>");
			
			while(rs.next()) {
				out.println("<tr><td>"+rs.getString("id")+"</td><td>"+
							rs.getString("name")+ "</th><td>"+
							rs.getString("emial")+ "</th><td>"+
							rs.getInt("password")+"</th><tr>");
			}
			out.println("</table></body></html>");
			
		}catch(ClassNotFoundException e) {
			System.out.println(e);
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(stm != null) stm.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				System.out.println(e);
			}
		}
	}
}
