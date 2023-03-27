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

@WebServlet("/member/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* memberList.jsp에서 넘온 id 정보를 통해 DB에서 id와 같은 정보를 가지는 column을 조회하고 해당 record를 반환하는 메서드 */	
	//<a> 태그로 링크 요청이 들어와서 doGet으로 들어가게 된다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Connection 객체
		Connection conn = null;
		//넘어온 정보 담기
		String id = request.getParameter("id");
		
		//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			WooriDao dao = new WooriDao();
			dao.setConnction(conn);
			Woori one = dao.SelectOne(id);
			request.setAttribute("one", one);
				
			RequestDispatcher rd = request.getRequestDispatcher("/member/MemberUpdate.jsp");
			rd.forward(request, response);
			
		} catch (Exception e){
			System.out.print(e);
		}
	}
	
	/* memberUpdate.jsp에서 넘어온 id 정보를 통해 DB에서 id와 같은 정보를 가지는 column을 조회하여 DB의 정보를 수정하는 메서드 */	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//필요한 변수 선언
		Connection conn = null;
		
		//memberUpdate.jsp에서 넘어온 정보를 WooriDAO에 넘겨주기 위해서 Woori 객체에 담는 작업
		//강사님은 넘어온 변수를 담고, 다시 try문 안에서 woori 객체 안에서 set을 사용해서 넣었지만, 나는 한방에 해결.
		Woori one = new Woori();
		one.setId(request.getParameter("id"));
		one.setName(request.getParameter("name"));
		one.setEmial(request.getParameter("emial"));
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			WooriDao dao = new WooriDao();
			dao.setConnction(conn);
			dao.update(one);
			
			response.sendRedirect("list2");
		} catch (Exception e){
			System.out.print(e);
		} 
	}
}
