<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 쇼핑몰</title>
</head>
<body>

<h2>${sessionScope.id}: 주문 목록 보기 방식</h2>
[<a href="logout.jsp">로그아웃</a>]<br>
<hr>

<p> <a href = "addrbook_control.jsp?action=orderList">사용자별 구매목록 가기</a> </p>
<p> <a href = "order_control.jsp?action=list">전체 구매목록 가기</a> </p>

</body>
</html>