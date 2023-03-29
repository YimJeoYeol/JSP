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



@WebServlet("/fboard/update")
public class FBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		//넘어온 정보 담기
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			FBoardDao dao = new FBoardDao();
			dao.setConnection(conn);
			
//			FBoard one = dao.selectOne(id);
//			아래는 두줄을 한 줄로 만드는 코드이다.
			request.setAttribute("one", dao.selectOne(id));
			RequestDispatcher rd = request.getRequestDispatcher("/fboard/fboardUpdate.jsp");
			rd.forward(request, response);
			
		} catch (Exception e){
			System.out.print(e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		
		FBoard one = new FBoard();
		one.setId(Integer.parseInt(request.getParameter("id")));
		one.setName(request.getParameter("name"));
		one.setEmail(request.getParameter("email"));
		one.setSubject(request.getParameter("subject"));
		one.setContent(request.getParameter("content"));
		one.setPassword(request.getParameter("password"));
//		one.setReadcount(Integer.parseInt(request.getParameter("readcount")));
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			FBoardDao dao = new FBoardDao();
			dao.setConnection(conn);
			dao.update(one);
			response.sendRedirect("list");
			
		} catch (Exception e){
			System.out.println("updateServlet dopost 오류");
			System.out.print(e);
		} 
	}

}
