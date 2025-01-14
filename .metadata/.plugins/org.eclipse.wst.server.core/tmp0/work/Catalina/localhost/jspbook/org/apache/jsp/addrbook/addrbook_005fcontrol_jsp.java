/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.93
 * Generated at: 2019-06-08 07:04:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.addrbook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import jspbook.addrbook.*;
import java.util.*;

public final class addrbook_005fcontrol_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"addrbook_error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
 request.setCharacterEncoding("utf-8"); 
      out.write("\r\n");
      out.write("\r\n");
      jspbook.addrbook.AddrBean ab = null;
      ab = (jspbook.addrbook.AddrBean) _jspx_page_context.getAttribute("ab", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (ab == null){
        ab = new jspbook.addrbook.AddrBean();
        _jspx_page_context.setAttribute("ab", ab, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write(" <!-- 0429 데이터베이스 연동부분 --> \r\n");
      jspbook.addrbook.AddrBook addrbook = null;
      addrbook = (jspbook.addrbook.AddrBook) _jspx_page_context.getAttribute("addrbook", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (addrbook == null){
        addrbook = new jspbook.addrbook.AddrBook();
        _jspx_page_context.setAttribute("addrbook", addrbook, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write("\r\n");
      out.write("<!-- 0429 request보낸 jsp에서 인자로 넘겨 받은 걸로 addrbook초기화 -->\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("addrbook"), request);
      out.write(' ');
      out.write('\r');
      out.write('\n');
 
	// 컨트롤러 요청 파라미터
	// 0429 액션으로 행위 분별
	// 0429 ?? 이 액션값은 어디서 넘어오는 것?
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	//0429 요청에 따라 처리를 하고, 화면 전환을 발생시키고, 필요에 따라 setAttribute를 해준다. 
	if(action.equals("list")) {
		ArrayList<AddrBook> datas = ab.getDBList();
		
		/*0429 ★addrbook_list.jsp를 불러야 하는데 'ArrayList<AddrBook> datas' 이것도 전달해 주길 원하는데
		attribute를 이용해 줘야 하는데 sendRedirect는 새로운 요청이기에 attribute가 유지가 안되기 때문에
		forward를 사용해야한다. */
		request.setAttribute("datas", datas);
		pageContext.forward("addrbook_list.jsp");
		
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {
		if(ab.insertDB(addrbook)){// 0429 insert가 성공이 되었다면?
			// 0429 addrbook_list.jsp를 호출을 해야하지만, 처리는 control이 하는 것이 맞기에 간접적으로 control을 redirect함.
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{ // 0429 실패한 경우
			throw new Exception("DB 입력 오류");
		}
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
	}
	else {
	}

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
