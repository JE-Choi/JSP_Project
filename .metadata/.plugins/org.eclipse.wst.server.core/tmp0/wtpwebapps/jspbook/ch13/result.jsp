<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch13 : result.jsp</title>
</head>
<body>
<div align="center">
<H2>ch13:result.jsp</H2>
<HR>
<!-- request.setCharacterEncoding 안하고 그냥 실행. -->
처리결과 : ${param.title}
<%session.setAttribute("login","홍길동"); %>
${sessionScope.login} 님 환영합니다!!!
</div>
</body>
</html>