package ch13;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class TestSessionAttrListener
 *
 */
@WebListener
public class TestSessionAttrListener implements HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public TestSessionAttrListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    // session의 속성이 추가되었을 때
    public void attributeAdded(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    	HttpSession session = arg0.getSession();
    	//System.out.println("attributeAdded: "+arg0.getName()+" = "+arg0.getValue());
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    // session속성 지워졌을 때
    public void attributeRemoved(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    	HttpSession session = arg0.getSession();
    	//System.out.println("attributeRemoved: "+arg0.getName()+" = "+arg0.getValue());
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    // session속성 변경 되었을 때
    public void attributeReplaced(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    	HttpSession session = arg0.getSession();
    	//System.out.println("attributeReplaced: "+arg0.getName()+" = "+arg0.getValue());
    }
	
}
