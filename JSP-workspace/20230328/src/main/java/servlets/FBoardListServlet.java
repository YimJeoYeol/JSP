package servlets;

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

import dao.FBoardDao;
import dto.FBoard;


@WebServlet("/fboard/list")
public class FBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int stype= 0;
		String sval = null;
		Connection conn = null;
		List<FBoard> FBoardList = null;
		
		if(request.getParameter("stype") != null) {
			stype = Integer.parseInt(request.getParameter("stype"));
			sval = request.getParameter("sval");
		}

		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			//객체주입
			FBoardDao dao = new FBoardDao();
			dao.setConnection(conn);
			
			if(stype == 0) {
				FBoardList = dao.selectList();
			} else if(stype > 0) {
				FBoardList = dao.searchList(stype, sval);
			}
			//화면 위임
			request.setAttribute("FBoardList", FBoardList);
			RequestDispatcher rd = request.getRequestDispatcher("/fboard/fboardAllList.jsp");
			rd.forward(request, response);
		
		}catch(Exception e) {
			System.out.println("FBoardListServlet에서 오류남");
			System.out.println(e);
		}
	}

}
