package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터를 전송할 때 한글인코딩 해주는 부분을 fiter가 해주기 때문에 없어도 된다.
		/* request.setCharacterEncoding("UTF-8"); */
		
		//필요한 변수 선언
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "";	

		//select.jsp에서 넘어온 id 받기
		String id = request.getParameter("id");

		//드라이버 로딩 + 연결자 생성 + 쿼리문 작성 및 실행
		try{
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			sql = "DELETE FROM woori WHERE id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.executeUpdate();
			response.sendRedirect("list2");

		} catch (SQLException e) {
			System.out.print(e);
		} finally {
		
			try {
				if(pst != null) pst.close();
			} catch (SQLException e){
				System.out.print(e);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
