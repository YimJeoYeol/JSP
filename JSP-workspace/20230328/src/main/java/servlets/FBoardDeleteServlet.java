package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FBoardDao;


@WebServlet("/fboard/delete")
public class FBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//필요한 객체 선언, jsp에서 넘어온 정보 받기.
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "";
		int id = Integer.parseInt(request.getParameter("id"));

		try{
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			FBoardDao dao = new FBoardDao();
			dao.setConnection(conn);
			dao.delete(id);
			
			response.sendRedirect("list");

		} catch (Exception e) {
			System.out.println("FBoardDeleteServlet에서 오류");
			System.out.print(e);
		} finally {
			try {
				if(pst != null) pst.close();
			} catch (SQLException e){
				System.out.print(e);
			}
		}
	}

}
