<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hw3 : add.jsp</title>
</HEAD>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String productid = request.getParameter("pd_id");
	String productcount = request.getParameter("product_count"+productid);
	ArrayList<String> list = (ArrayList)session.getAttribute("productlist");
	if(list == null) { // list 가없으면 만들고
		list = new ArrayList<String>();
		session.setAttribute("productlist",list); //list를 session에 set할거야
	}
	list.add(productid+"-"+productcount); // 내가 상품 추가할 것들 추가하기.

%>
	<script>
		alert("<%=productid %>(<%=productcount %>개)이(가) 추가 되었습니다.!!");
		history.go(-1); // 왔다가 다시 이를 불렀던  에 대한 페이지 표시함.
	</script>
</body>
</html>