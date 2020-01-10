package final19;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;

/**
 * Application Lifecycle Listener implementation class RequestAttributeListener
 *
 */
@WebListener
public class RequestAttributeListener implements ServletRequestAttributeListener {

    /**
     * Default constructor. 
     */
    public RequestAttributeListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestAttributeListener#attributeRemoved(ServletRequestAttributeEvent)
     */
    public void attributeRemoved(ServletRequestAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletRequest request = arg0.getServletRequest();
    	System.out.println("attributeRemoved: "+arg0.getName()+" = "+arg0.getValue());
    }

	/**
     * @see ServletRequestAttributeListener#attributeAdded(ServletRequestAttributeEvent)
     */
    public void attributeAdded(ServletRequestAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletRequest request = arg0.getServletRequest();
    	System.out.println("attributeAdded: "+arg0.getName()+" = "+arg0.getValue());
    }

	/**
     * @see ServletRequestAttributeListener#attributeReplaced(ServletRequestAttributeEvent)
     */
    public void attributeReplaced(ServletRequestAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletRequest request = arg0.getServletRequest();
    	System.out.println("attributeReplaced: "+arg0.getName()+" = "+arg0.getValue());
    }
	
}
