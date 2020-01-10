<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<H2>ch13:ListenerTest.jsp</H2>
<!-- 아래에서 접근하는 데이터에 대해서는 추가하거나, useBean으로 추가하는 부분이 전혀 없음. -->
<%
session.setAttribute("login","성춘향");
%>
<HR>
도서명 : ${book.title} <BR>
저자명 : ${book.author} <BR>
가격 : ${book.price} <BR>
출판사 : ${book.publisher} <BR>
${sessionScope.login}
</div>
</body>
</html>