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

import DAO.WooriDao;
import DTO.Woori;  


@WebServlet("/member/list2")
public class ListServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			WooriDao dao = new WooriDao();
			//객체 주입, 외부로부터 Connection을 전달받아서 dao 클래스가 Connection 객체를 사용할 수 있다.
			dao.setConnction(conn);
			List<Woori> wooris = dao.selectList();
			
			//map 타입으로 포장해서, 값을 전달해준다. //파란색 wooris가 key, 갈색 wooris는 arraylist
			request.setAttribute("wooris", wooris);
			//화면위임 -> 매개변수로 호출할 jsp 파일을 주면 됨.
			RequestDispatcher rd = request.getRequestDispatcher("/member/MemberList.jsp");
			rd.include(request, response);
		
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
