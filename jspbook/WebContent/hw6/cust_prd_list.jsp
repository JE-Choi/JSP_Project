<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.hw6.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="productbook.css" type="text/css" media="screen" />
<!-- 확인 메세지 띄움을 위한 스크립트 -->
<script type="text/javascript">
// 링크를 통해서 화면이동하는 것이 아니라 자바 스크립트를 부르고 그 안에서 화면 이동할 거임.
	function check(pb_id){
		// 아까 추가한 pd_id의 value를 매개변수로 하겠다. 
		document.form1.pd_id.value = pb_id;
		document.form1.submit();
	}
</script>
<title>나의 쇼핑몰</title>
</head>

<jsp:useBean id="datas_product" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>${sessionScope.id}님 환영합니다.</H2>
<HR>
<form name = form1 method = post action=add.jsp>
	<!-- 버튼 누를 때마다 이 값도 같이 넘어감. -->
	<input type="hidden" name = "pd_id" value = "pd_id"/>
	<a href="addrbook_control.jsp?action=cedit&ab_id=${sessionScope.id}">고객정보관리</a><br/>
	<a href="logout.jsp">로그아웃</a><br>
	<a href = "checkOut.jsp">장바구니 가기</a><br/>
	<a href = "order_control.jsp?action=clist&aid=${sessionScope.id}">구매목록 가기</a><br/>
	
	<table border="1">
		<tr><th>번호</th><th>물품명</th><th>물품종류</th><th>물품가격</th><th>물품 판매처</th><th>물품 설명</th><th>물품URL</th>
		<th>수량</th><th>장바구니</th></tr>
		
		<% 
			for(ProductBook pb : (ArrayList<ProductBook>)datas_product){
				
		%>
		
		<tr>
		<!-- 링크로 연결된 수정화면으로 넘어가기 전에 자바 스크립트를 이용하여 확인 메세지를 띄움 -->
		<td><%=pb.getProduct_id()%></td>
		<td><%=pb.getProduct_name()%></td>
		<td><%=pb.getProduct_type()%></td>
		<td><%=pb.getProduct_price()%>원</td>
		<td><%=pb.getProduct_dealer()%></td>
		<td><%=pb.getProduct_explanation()%></td>
		<td><a href="<%=pb.getProduct_url()%>" target="_black"><%=pb.getProduct_url()%></a></td>
		<!-- 그냥 select이름을  product_count로 하면 모든 항목의 select의 name의 값이 같으므로 문제가 생기기에
		구별이 되어야 한다. 위에 input type="hidden"추가하고 select의 name뒤에 변수 붙여줌. 이러면 각각의 항목마다 다른 name값을 가지게 된다. -->
		<td><select name = "product_count<%=pb.getProduct_id()%>">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select></td>
		<!-- submit해도 어떤 항목을 장바구니 버튼 눌렀는지 애매해.. 그래서 자바 스크립트 이용할 거임 -->
		<td><input type = "button" onClick="check(<%=pb.getProduct_id()%>)" value="장바구니"/></td>
		</tr>
		<%
			}
		%>
	</table>
</form>

</div>

</body>
</html>