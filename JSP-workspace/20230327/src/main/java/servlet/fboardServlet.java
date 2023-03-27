package servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.fboardDao;


@WebServlet("/fboard/update")
public class fboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Connection conn = null;
		try {
			ServletContext sc = request.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			fboardDao dao = new fboardDao();
			
			
		}catch(Exception e) {
			
		}
	}
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
