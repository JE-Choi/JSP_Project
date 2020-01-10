package ch13;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class testListener
 *
 */
@WebListener
public class testContextListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public testContextListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    // 톰캣이 종료 될 때
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    // 톰캣이 실행 될 때
    // 전달받은 이벤트는 매개변수로 ServletContextEvent arg0로 전달됨.
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext ctx = arg0.getServletContext();
    	
    	// Book 객체를 만들어 application scope 에 저장
    	// 이렇게 객체 생성시 매개변수를 넣고 싶다면 해당 java class에 생성자가 필요하다. 
		Book mybook = new Book("자바웹프로그래밍","황희정",20000,"한빛미디어");
		// jsp에서 book으로 접근하게 됨.
		ctx.setAttribute("book", mybook);
		//System.out.println("TestContextListener 시작됨..");    
    }
	
}
