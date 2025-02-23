<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.hw6.*"%>
<!DOCTYPE HTML>
<html>
<head>
<!--스타일 연결 -->
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<!-- 확인 메세지 띄움을 위한 스크립트 -->
<script type="text/javascript">
// 링크를 통해서 화면이동하는 것이 아니라 자바 스크립트를 부르고 그 안에서 화면 이동할 거임.
/*	function check(ab_id){
	// 스크립트라 변수타입 설정 안해도 돌아가는거, String으로 하면 오류 남. 할거면 var나, let으로 하기
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요.');
		
		// addrbook_edit_form.jsp을 직접 부르지 않고, control을 부를 것
		// id와 pwd를 넣어 맞는지 확인한다. 
		//document.location.href = "addrbook_control.jsp?action=edit&ab_id="+ab_id+"&pwd="+pwd;
		// 넣는 인자 명에 따라 이동되는 페이지에 로드되는 Bean쪽에 있는 속성있으면 set되는 듯.
		document.location.href = "addrbook_control.jsp?action=edit&ab_id="+ab_id+"&ab_pwd="+pwd;
		
	}*/
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매목록보기</title>

</head>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>${sessionScope.id} :구매목록보기</H2>
<HR>
	[<a href ="productbook_control.jsp?action=clist">고객 홈페이지로</a>]<br/>
	<a href="addrbook_control.jsp?action=cedit&ab_id=${sessionScope.id}">고객정보관리</a><br/>
	<a href="logout.jsp">로그아웃</a><br>
<form>
<!-- <a href="addrbook_form.jsp">고객 등록</a><P>
	<a href ="manager_home.jsp">관리자 홈페이지로</a> -->	

	<table border="1">
		<tr><th>o_id</th><th>ab_id</th><th>물품1</th><th>수량1</th>
		<th>물품2</th><th>수량2</th><th>물품3</th><th>수량3</th>
		<th>물품4</th><th>수량4</th><th>물품5</th><th>수량5</th></tr>
		   
		<% 
			for(Order od : (ArrayList<Order>)datas){
		%>
		<tr>
		<!-- 링크로 연결된 수정으로 넘어가기 전에 확인 메세지 띄움: 자바 스크립트 이용 
		인자값이 숫자일 때는 상관없지만, 인자값이 String이면 작은 따옴표를 입력해야 한다. -->
		<td><a href="javascript:check('<%=od.getO_id()%>')"><%=od.getO_id()%></a></td>
		<td><%=od.getAb_id()%></td>
		<td><%=od.getPd_id1()%></td>
		<td><%=od.getPd_num1()%></td>
		<td><%=od.getPd_id2()%></td>
		<td><%=od.getPd_num2()%></td>
		<td><%=od.getPd_id3()%></td>
		<td><%=od.getPd_num3()%></td>
		<td><%=od.getPd_id4()%></td>
		<td><%=od.getPd_num4()%></td>
		<td><%=od.getPd_id5()%></td>
		<td><%=od.getPd_num5()%></td>
		</tr>
		<%
			}
		%>
	</table>
</form>

</div>
</body>
</html>