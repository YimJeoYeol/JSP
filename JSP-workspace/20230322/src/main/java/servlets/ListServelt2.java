package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Woori;


@WebServlet("/member/list2")
public class ListServelt2 extends HttpServlet {
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
			stm  = conn.createStatement();
			
			sql  = "select * from woori order by id desc"; //내림차순으로
			rs   = stm.executeQuery(sql);
			//Driver 연결까지는 jsp와 코드가 다른게 없음.
			
			//응답해줄 때 보내주는 객체를 가져옴???-> 이게 무슨 말일까 다시 생각해봐라.
			response.setContentType("text/html; charset=UTF-8");

			ArrayList<Woori> wooris = new ArrayList<Woori>();
			while(rs.next()) {
				Woori tmp = new Woori();
				tmp.setId(rs.getString("id"));
				tmp.setName(rs.getString("name"));
				tmp.setEmial(rs.getString("emial"));
				tmp.setPassword(rs.getInt("password"));
				
				wooris.add(tmp);
			}
			//위임
			request.setAttribute("wooris", wooris);
			RequestDispatcher rd = request.getRequestDispatcher("/member/MemberList.jsp");
			rd.include(request, response);
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
