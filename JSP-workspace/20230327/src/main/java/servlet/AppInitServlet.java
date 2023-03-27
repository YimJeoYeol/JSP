package servlet;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

//Client에 아무런 요청이 없어도 실행되는 Servlet을 만듬.
public class AppInitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//Servlet이 실행될 때 해야할 일
	public void init(ServletConfig config) throws ServletException {
		System.out.println("AppInitServlet 준비...");
		//부모 이거 뭐임???
		super.init(config);
		
		//DB 로딩 및 연결
		try {
			//context parameter를 설정한 건데 , 강사님이 쉽게 설명한다고 class의 전역변수로 이야기함.
			//용어가 다른 거지 개념은 비슷함.
			//web.xml에서 <Context> 태그로 설정한 param에 접근할 수 있도록 객체를 생성함.
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("driverName"));
			Connection conn = DriverManager.getConnection(
					sc.getInitParameter("url"),
				    sc.getInitParameter("dbID"),
			        sc.getInitParameter("dbPassword"));
			//web.xml에 DB에 연결한 connection 객체를 저장함. -> 전역으로 저장하는 것.
			sc.setAttribute("conn", conn);
			
			//context parameter에 정확하게 저장되었는지 console에 출력문으로 확인.
			System.out.println("AppInitServlet 준비 완료...");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	//Servlet이 종료될 때 해야할 일
	public void destroy() {
		//지금까지는 finally 구문을 사용해서 DB를 닫았지만, 이제는 appcation이 종료될 때 닫을 수 있도록 설정한다.
		System.out.println("AppInitServlet 마무리...");
		super.destroy();
		//web.xml 파일에 있는 Connection 객체를 호출하기
		ServletContext sc = this.getServletContext();
		//.getAttribute의 반환타입은 Object이기 때문에 강제형변환(다운캐스팅)해줘야 한다.
		Connection conn = (Connection) sc.getAttribute("conn");
		try {
			if(conn != null) conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
