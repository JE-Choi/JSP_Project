/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.93
 * Generated at: 2019-05-20 04:48:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.hw3;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import jspbook.hw3.*;

public final class addrbook_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"addrbook_error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<!--스타일 연결 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"addrbook.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<!-- 확인 메세지 띄움을 위한 스크립트 -->\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("// 링크를 통해서 화면이동하는 것이 아니라 자바 스크립트를 부르고 그 안에서 화면 이동할 거임.\n");
      out.write("\tfunction check(ab_id){\n");
      out.write("\t// 스크립트라 변수타입 설정 안해도 돌아가는거, String으로 하면 오류 남. 할거면 var나, let으로 하기\n");
      out.write("\t\tpwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요.');\n");
      out.write("\t\t\n");
      out.write("\t\t// addrbook_edit_form.jsp을 직접 부르지 않고, control을 부를 것\n");
      out.write("\t\t// id와 pwd를 넣어 맞는지 확인한다. \n");
      out.write("\t\t//document.location.href = \"addrbook_control.jsp?action=edit&ab_id=\"+ab_id+\"&pwd=\"+pwd;\n");
      out.write("\t\t// 넣는 인자 명에 따라 이동되는 페이지에 로드되는 Bean쪽에 있는 속성있으면 set되는 듯.\n");
      out.write("\t\tdocument.location.href = \"addrbook_control.jsp?action=edit&ab_id=\"+ab_id+\"&ab_pwd=\"+pwd;\n");
      out.write("\t\t\n");
      out.write("\t}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>고객 목록화면</title>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      java.util.ArrayList datas_addr = null;
      datas_addr = (java.util.ArrayList) _jspx_page_context.getAttribute("datas_addr", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (datas_addr == null){
        datas_addr = new java.util.ArrayList();
        _jspx_page_context.setAttribute("datas_addr", datas_addr, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write("\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("<div align=\"center\"> \r\n");
      out.write("<H2>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" :고객 목록화면</H2>\r\n");
      out.write("<HR>\r\n");
      out.write("<form>\r\n");
      out.write("\t<a href=\"addrbook_form.jsp\">고객 등록</a><P>\n");
      out.write("\t<a href =\"manager_home.jsp\">관리자 홈페이지로</a>\r\n");
      out.write("\r\n");
      out.write("\t<table border=\"1\">\r\n");
      out.write("\t\t<tr><th>아이디</th><th>패스워드</th><th>이 름</th><th>이메일</th><th>전화번호</th><th>생 일</th><th>회 사</th><th>메 모</th></tr>\n");
      out.write("\t\t\n");
      out.write("\t\t");
 
			for(AddrBook ab : (ArrayList<AddrBook>)datas_addr){
		
      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<!-- 링크로 연결된 수정으로 넘어가기 전에 확인 메세지 띄움: 자바 스크립트 이용 \n");
      out.write("\t\t인자값이 숫자일 때는 상관없지만, 인자값이 String이면 작은 따옴표를 입력해야 한다. -->\n");
      out.write("\t\t<td><a href=\"javascript:check('");
      out.print(ab.getAb_id());
      out.write("')\">");
      out.print(ab.getAb_id());
      out.write("</a></td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_pwd());
      out.write("</td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_name());
      out.write("</td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_email());
      out.write("</td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_tel());
      out.write("</td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_birth());
      out.write("</td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_comdept());
      out.write("</td>\n");
      out.write("\t\t<td>");
      out.print(ab.getAb_memo());
      out.write("</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t");

			}
		
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
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
