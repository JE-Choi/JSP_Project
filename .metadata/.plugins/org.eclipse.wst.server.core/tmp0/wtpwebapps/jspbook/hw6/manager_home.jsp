<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 쇼핑몰</title>
</head>
<body>

<h2>${sessionScope.id}: 관리 메뉴</h2>
[<a href="logout.jsp">로그아웃</a>]<br>
<hr>

<a href = "addrbook_control.jsp?action=list">고객관리</a>
<a href = "productbook_control.jsp?action=list">물품 관리</a>
<a href = "manager_order_list.jsp">구매목록 가기</a><br/>

</body>
</html>