package servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FBoardDao;
import dto.FBoard;

@WebServlet("/fboard/add")
public class FBoardAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/fboard/fboardAdd.jsp");
		rd.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		
		FBoard one = new FBoard();
		one.setName(request.getParameter("name"));
		one.setEmail(request.getParameter("email"));
		one.setSubject(request.getParameter("subject"));
		one.setContent(request.getParameter("content"));
		one.setPassword(request.getParameter("password"));
	
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			FBoardDao dao = new FBoardDao();
			dao.setConnection(conn);
			dao.insert(one);
			
			response.sendRedirect("list");
			
		} catch (Exception e) {
			
		}
		
	}

}
