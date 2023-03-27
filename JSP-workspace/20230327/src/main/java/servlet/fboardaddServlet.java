package servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.fboardDao;
import dto.Fboard;


@WebServlet("/fboard/add")
public class fboardaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/fboard/FboardAdd.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String password = request.getParameter("password");
		
		Connection conn = null;
		
		try {
			ServletContext sc = request.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			Fboard tmp = new Fboard();
			tmp.setName(name);
			tmp.setEmail(email);
			tmp.setSubject(subject);
			tmp.setContent(content);
			tmp.setPassword(password);
			fboardDao dao = new fboardDao();
			dao.insert(tmp);
			response.sendRedirect("list");
			
		}catch(Exception e) {
			
		}
				
	}

}
