package jspbook.ch14;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

// 추가하기
import org.slf4j.*;


/**
 * Application Lifecycle Listener implementation class LpgContextListener
 *
 */
@WebListener
public class LpgContextListener implements ServletContextListener {
	// 변수만 일단 생성.
	Logger log;
	
    /**
     * Default constructor.  리스너 생성자
     */ 
    public LpgContextListener() {
        // TODO Auto-generated constructor stub
    }

	/** 서블릿 종료
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	//log.info("contextDestroyed");
    }

	/** 서블릿 생성되고 시작할때 로그를 넣겠습니다.
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	// 특정 class지정 안함.
    	// logFactory아님. Logger임.
    	//log = LoggerFactory.getLogger(this.getClass());
    	//log.info("contextInitialized");
    }
	
}
