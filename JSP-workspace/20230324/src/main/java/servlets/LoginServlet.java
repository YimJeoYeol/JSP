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
import javax.servlet.http.HttpSession;

import DAO.WooriDao;
import DTO.Woori;


@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/auth/loginForm.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전송된 정보 저장
		//conn 객체 받아오기
		//Dao 객체 생성해서 conn 주입하기
		//Dao 객체의 login 호출 결과 받기
		//login 성공하면 list화면,login 실패시 --> 실패화면
		String id = request.getParameter("id");
		int password = Integer.parseInt(request.getParameter("password"));
		
		try {
			ServletContext sc = this.getServletContext();
			Connection conn = (Connection)sc.getAttribute("conn");
			
			WooriDao dao = new WooriDao();
			dao.setConnction(conn);
			Woori loginOne= dao.login(id, password);
			
			if(loginOne != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginOne", id);
				response.sendRedirect("../member/list2");
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("/auth/loginFail.jsp");
				rd.forward(request, response);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
	}

}
