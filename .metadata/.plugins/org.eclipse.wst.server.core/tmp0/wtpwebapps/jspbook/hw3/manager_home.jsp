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
<hr>

<a href = "addrbook_control.jsp?action=list">고객관리</a> <!-- 수업시간에 했던거 그대로 넣고 -->
<a href = "productbook_control.jsp?action=list">물품 관리</a> <!-- 이게 과제 -->

</body>
</html>