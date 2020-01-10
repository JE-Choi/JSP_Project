package ch13;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class LogFilter
 */
@WebFilter("*.jsp")
public class LogFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LogFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		// 언제 이 필터에 들리는지 시간 출력 할 것임.
		//System.out.println("[LogFilter] - doFilter: " + new Date(System.currentTimeMillis()));
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		
		//System.out.println("[LogFilter] - doFilter 이전"+ new Date(System.currentTimeMillis()));
		chain.doFilter(request, response);
		//System.out.println("[LogFilter] - doFilter 이후"+ new Date(System.currentTimeMillis()));
		
	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		//System.out.println("[LogFilter] - init"+ new Date(System.currentTimeMillis()));
		
	}

}
