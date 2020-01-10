<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.hw5.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="productbook.css" type="text/css" media="screen" />
<!-- 확인 메세지 띄움을 위한 스크립트 -->
<script type="text/javascript">
// 링크를 통해서 화면이동하는 것이 아니라 자바 스크립트를 부르고 그 안에서 화면 이동할 거임.
	function check(pb_id){
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요.');
		
		// id와 pwd을 확인한 후 페이지 연결
		// productbook_edit_form.jsp을 직접 부르지 않고, productbook_control으로 연결
		document.location.href = "productbook_control.jsp?action=edit&pb_id="+pb_id+"&pwd="+pwd;
	}
</script>
<title>물품 목록화면</title>
</head>

<jsp:useBean id="datas_product" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>${sessionScope.id}: 물품 목록화면</H2>
<HR>
<form>
	<a href="productbook_form.jsp">물품 등록</a><P>
	<a href ="manager_home.jsp">관리자 홈페이지로</a>

	<table border="1">
		<tr><th>번호</th><th>물품명</th><th>물품종류</th><th>물품가격</th><th>물품 판매처</th><th>물품 설명</th><th>물품URL</th></tr>
		
		<% 
			for(ProductBook pb : (ArrayList<ProductBook>)datas_product){
		%>
		<tr>
		<!-- 링크로 연결된 수정화면으로 넘어가기 전에 자바 스크립트를 이용하여 확인 메세지를 띄움 -->
		<td><a href="javascript:check(<%=pb.getProduct_id()%>)"><%=pb.getProduct_id()%></a></td>
		<td><%=pb.getProduct_name()%></td>
		<td><%=pb.getProduct_type()%></td>
		<td><%=pb.getProduct_price()%>원</td>
		<td><%=pb.getProduct_dealer()%></td>
		<td><%=pb.getProduct_explanation()%></td>
		<td><a href="<%=pb.getProduct_url()%>" target="_black"><%=pb.getProduct_url()%></a></td>
		</tr>
		<%
			}
		%>
	</table>
</form>

</div>

</body>
</html>