<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*, org.slf4j.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 여기서 로깅을 하고 싶다면 import를 해주어야 한다. 
	// 일부로 에러를 발생시킨 것임.
		application.log("logtest.jsp 테스트 로그", new IOException());
		Logger log = LoggerFactory.getLogger(this.getClass());
		// 정의 해 놓으면 발생하는 Exception의 로깅 수준에 맞는게 출력이 된다. 
		// 즉, IOException은 info레벨이 아니라 warn레벨이기 때문에 warn만 출력된것이다. 
		// java에서는 warn, info가 둘다 출력되는 이유는 그건 예외 처리에 따른 로깅이 아니기 때문이다. 
		log.info("info 로그");
		log.warn("warn 로그");
	%>
</body>
</html>