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

import DAO.WooriDao;
import DTO.Woori;

@WebServlet("/member/add2")
public class AddServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/member/memberAdd.jsp");
		rd.include(request, response);
	}
	//post 방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;

		//memberAdd.html에서 넘어온 정보를 Woori 객체에 저장함.
		Woori one = new Woori();
		one.setId(request.getParameter("id"));
		one.setPassword(Integer.parseInt(request.getParameter("password")));
		one.setName(request.getParameter("name"));
		one.setEmial(request.getParameter("emial"));
	    
	    try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			WooriDao dao = new WooriDao();
			dao.setConnction(conn);
			dao.insert(one);
	 
	    	response.sendRedirect("list2");
	 
	    }catch(Exception e) {}
	}
}
