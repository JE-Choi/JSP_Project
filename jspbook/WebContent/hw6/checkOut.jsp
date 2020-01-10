<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.util.*, jspbook.hw6.*" %>
<jsp:useBean id="pd" class="jspbook.hw6.PrdBean"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ch06 : checkOut.jsp</title>
</HEAD>
<body>
<div align="center">
<H2>계산</H2>
<%=session.getAttribute("id") %>님이 선택한 상품 목록
<HR>
<a href="addrbook_control.jsp?action=cedit&ab_id=${sessionScope.id}">고객정보관리</a><br/>
<a href = "productbook_control.jsp?action=clist">고객 홈페이지</a><br/>
<a href="logout.jsp">로그아웃</a><br>
<%
	ArrayList list = (ArrayList)session.getAttribute("productlist");
	if(list == null) {
		out.println("선택한 상품이 없습니다.!!!");
	}
	else {
		%>
	<form name=form1 method=post action=order_control.jsp?action=cinsert>
	<input type="hidden" name="action" value=“cinsert">
	<input type=hidden name="ab_id" value="${sessionScope.id}">

	<table border="1">
		<tr><th>번호</th><th>상품명</th><th>가격</th><th>수량</th></tr>
		<%
		int total = 0, n=1;
		for(Object productname:list) {
			int target_n = productname.toString().indexOf("-");
			// 0 부터 '-' 전까지 가져와
			String p_id = productname.toString().substring(0,target_n);
			// '-'에서 끝까지 가져와 (n+1인거 주의!!)
			String p_count = productname.toString().substring(target_n+1, productname.toString().length());
			
			// useBean을 이용해서 Product Bean을 가져와야함.
			productname.toString().substring(target_n+1,productname.toString().length());
			ProductBook prd = pd.getDB(Integer.parseInt(p_id));
			out.println("<tr>");
			out.println("<td>"+prd.getProduct_id()+"</td>");
			out.println("<td>"+prd.getProduct_name()+"</td>");
			out.println("<td>"+prd.getProduct_price()+"</td>");
			out.println("<td>"+p_count+"</td>");
			out.println("</tr>");
			// 총값 계산
			total += prd.getProduct_price() * Integer.parseInt(p_count);
			
			out.println("<input type=hidden name=pd_id"+n+" value="+prd.getProduct_id()+">");
			out.println("<input type=hidden name=pd_num"+n+" value="+p_count+">");
			n = n+1;
			}
		
			if(n <= 5){
				for( ; n <= 5 ; n++) {
					out.println("<input type=hidden name=pd_id"+n+" value="+0+">");
					out.println("<input type=hidden name=pd_num"+n+" value=\"\">");
				}
			}
		%>
		<tr><td colspan=4> 총합은 <%=total%>원</td> </tr>
		<input type=hidden name="pd_total" value="<%=total%>">
		<tr><td colspan = 4><input type="submit" value = "구매"/></td></tr>
	</table>
	</form>
	<%}
%>

</div>
</body>
</html>