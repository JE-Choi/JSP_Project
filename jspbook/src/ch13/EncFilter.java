package ch13;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncFilter
 */
//@WebFilter("/EncFilter")
//모든 *.jsp가 통과하게씀 애너테이션을 수정한다. 2차시도
@WebFilter("*.jsp")
public class EncFilter implements Filter {
	private String encoding;
	// 필터에는 이렇게 3개의 메소드가 있다. 
    /**
     * Default constructor. 
     */
    public EncFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
    // 삭제
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	// 이 메소드를 통해서 filter기능이 시작된다. 
	// FilterChain chain 필터 적용 체인 임.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		// request.getCharacterEncoding()을 했다면 그걸 그냥 그대로 쓰고
		// 안했다면, 내가 가지고 있는 기본 필터를 이용해서 encoding을 하겠다. 
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding(encoding);
			chain.doFilter(request, response);
			
		}
		//System.out.println("[EncFilter] - doFilter");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	// 초기화
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		// web-inf안의 web.xml안에 선언한 encoding param을 이용할 것임.
		// encoding이라고 하는 param을 가져오겠다. 
		// 위에 encoding 변수를 전역으로 선언해야 함. 
		// 지금 encoding 변수에 euc-kr을 넣어준 것임.
		this.encoding = fConfig.getServletContext().getInitParameter("encoding");
	}

}
