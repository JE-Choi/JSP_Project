<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.hw6.*"%>
<!DOCTYPE HTML>
<html>
<head>
<!--스타일 연결 -->
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<!-- 확인 메세지 띄움을 위한 스크립트 -->
<script type="text/javascript">
	// 선택한 사용자의 구매 내역
	function showOrderList(ab_id){
		document.location.href = "order_control.jsp?action=list_oid&aid="+ab_id;
		
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 목록화면</title>

</head>

<jsp:useBean id="datas_addr" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>${sessionScope.id} :사용자 선택 화면</H2>
<h4>관리자님 구매목록이 보고 싶은 사용자를 선택해주세요.</h4>
<HR>
	<p><a href = "manager_order_list.jsp">구매목록 가기</a></p>
	<p><a href ="manager_home.jsp">관리자 홈페이지로</a></p>
	<p><a href="logout.jsp">로그아웃</a></p>
<form>

	<table border="1" class = "order_oid">
		<tr><th>아이디</th></tr>
		
		<% 
			for(AddrBook ab : (ArrayList<AddrBook>)datas_addr){
		%>
		<tr>
		<!-- 링크로 연결된 수정으로 넘어가기 전에 확인 메세지 띄움: 자바 스크립트 이용 
		인자값이 숫자일 때는 상관없지만, 인자값이 String이면 작은 따옴표를 입력해야 한다. -->
		<td><a href="javascript:showOrderList('<%=ab.getAb_id()%>')"><%=ab.getAb_id()%></a></td>
		</tr>
		<%
			}
		%>
	</table>
</form>

</div>
</body>
</html>