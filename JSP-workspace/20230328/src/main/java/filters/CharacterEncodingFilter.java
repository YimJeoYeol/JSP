package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;


@WebFilter("/*")
public class CharacterEncodingFilter extends HttpFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//Servlet이 시행되기 전에 준비작업이 필요하면 doFiter메서드 위에 적고
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("필터 적용 완료");
		//filter을 작동시키는 메서드
		chain.doFilter(request, response);
		//Servlet이 시행되고 나서 작업이 필요하면 doFilter 아래에 적는다.
	}
	
	//filter가 생성될 때 해야할 작업이 있으면 적는 곳.
	public void init(FilterConfig fConfig) throws ServletException {}
	
	//메모리 상에 없을 경우 해야할 코드
	public void destroy() {}
}
