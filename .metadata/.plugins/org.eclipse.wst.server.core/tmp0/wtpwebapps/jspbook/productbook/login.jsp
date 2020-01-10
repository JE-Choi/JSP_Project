<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" errorPage="productbook_error.jsp"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="login" class="jspbook.productbook.LoginBean" scope="page" />
<jsp:setProperty name="login" property="*" />

<HTML>
<HEAD><TITLE>MyShoppingMall : 로그인 </TITLE></HEAD>
<BODY>
<div align=center>
<H2>로그인 예제</H2>
<HR>
<% 
	if(!login.checkUser()) {
		// 로그인 실패인 경우
		out.println("로그인 실패 !!");	
		pageContext.include("login_form.html");
	}
	else {
		// 로그인 성공인 경우
		session.setAttribute("id", "관리자");
		response.sendRedirect("manager_home.jsp");
		// 또는
		// pageContext.forward("productbook_control.jsp?action=list");
	}
%>
 


</div>
</BODY>
</HTML>