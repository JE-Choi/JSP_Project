package jspbook.ch14;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


// import가져오기
import org.slf4j.*;

/**
 * Servlet Filter implementation class LogFilter14
 */
@WebFilter("/LogFilter14")
public class LogFilter14 implements Filter {
	Logger log;
    /**
     * Default constructor. 
     */
    public LogFilter14() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		//log.info("destroy-Filter");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		// 다른 필터로 넘어가기 전에 log출력해야 함. - 위치 중요.
		//log.debug("doFilter-Filter: " + request.getRemoteAddr());
//		log.info("doFilter-Filter");
		chain.doFilter(request, response);
	}

	/** init할 때 log생성할 거임.
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		
		log = LoggerFactory.getLogger(this.getClass());
		//log.info("init-Filter");
	}

}
