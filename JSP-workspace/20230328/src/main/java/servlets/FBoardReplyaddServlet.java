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


@WebServlet("/fboard/rInsert")
public class FBoardReplyaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Connection conn = null;
		
		try {
			ServletContext sc = request.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			FBoardDao dao = new FBoardDao();
			dao.setConnection(conn);
			FBoard one =dao.selectOne(id);
			
			request.setAttribute("one", one);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/fboard/FBoardReplyAdd.jsp");
		
		rd.include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전송된 data 저장
		int masterid = Integer.parseInt(request.getParameter("masterid"));
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		int step     = Integer.parseInt(request.getParameter("step"));
		
		
		
		Connection conn = null;
		ServletContext sc = this.getServletContext();
		conn = (Connection)sc.getAttribute("conn");
		
		
		
		try {
			FBoard tmp = new FBoard();
			tmp.setName(name);
			tmp.setEmail(emial);
			tmp.setPassword(password);
			tmp.setSubject(subject);
			tmp.setContent(content);
			tmp.setMasterid(masterid);
			tmp.setReplynum(replynum);
			tmp.setStep(step);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		//conn 받아와서 dao만들어 주입하기
		//dao 답글 저장 요청
		//목록 화면 출력
	}

}
