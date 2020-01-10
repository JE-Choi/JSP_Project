<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" errorPage="addrbook_error.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="login" class="jspbook.hw5.LoginBean" scope="page" />
<jsp:setProperty name="login" property="*" />
<jsp:useBean id="ab" class="jspbook.hw5.AddrBean" scope="page" />

<HTML>
<HEAD><TITLE>MyShoppingMall : 로그인 </TITLE></HEAD>
<BODY>
<div align=center>
<H2>로그인 예제</H2>
<HR>
<% 
	if(!login.checkUser()) {// 관리자가 아닌경우
		if(!ab.checkUser(request.getParameter("userid"), request.getParameter("passwd"))){
			// 일반 고객도 아님.
			out.println("로그인 실패 !!");	
			pageContext.include("login_form.html");
		} else{
			// 사용자 로그인인 경우
			session.setAttribute("id", request.getParameter("userid"));
			// list와 분별하기 위하여 clist라고 지칭.
			response.sendRedirect("productbook_control.jsp?action=clist");
			
		}
	}
	else {
		// 관리자 로그인 성공인 경우
		session.setAttribute("id", "관리자");
		response.sendRedirect("manager_home.jsp");
		// 또는
		// pageContext.forward("productbook_control.jsp?action=list");
	}
%>
 


</div>
</BODY>
</HTML>