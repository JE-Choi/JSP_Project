<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align=center>
<H2>ch14:error_ch14.jsp</H2>
<HR>

<table>
<tr width=100% bgcolor="pink"><td>
관리자에게 문의해 주세요..<BR>
빠른시일내 복구하겠습니다.
</td></tr>
<tr><td>
${now}<p>
요청 실패 URI : ${pageContext.errorData.requestURI}<BR>
상태코드 : 	${pageContext.errorData.statusCode}<BR>
예외유형 : 	${pageContext.errorData.throwable}
</td></tr>
</table>

</div>
</body>
</html>