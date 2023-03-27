package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.fboardDao;
import dto.Fboard;


@WebServlet("/fboard/list")
public class FBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		ServletContext sc = this.getServletContext();
		conn = (Connection)sc.getAttribute("conn");
		try {
			
			@SuppressWarnings("rawtypes")
			fboardDao dao = new fboardDao();
			List<Fboard> list = dao.selectList();
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/fboard/fboard_List.jsp");
			rd.forward(request, response);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}




}
