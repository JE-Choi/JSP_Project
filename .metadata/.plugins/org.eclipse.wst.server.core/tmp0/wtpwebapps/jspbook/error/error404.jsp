<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch14:error_ch14.jsp</title>
</head>
<jsp:useBean id="now" class="java.util.Date" />

<body>
<div align=center>
<H2>ch14:error_ch14.jsp</H2>
<HR>

<table>
<tr width=100% bgcolor="orange"><td>
요청하신 파일을 찾을 수 없습니다..<BR>
URL 주소를 다시 한번 확인해 주세요!!!
</td></tr>
<tr><td>
${now}<p>
요청 실패 URI : ${pageContext.errorData.requestURI}<BR>
상태코드 : ${pageContext.errorData.statusCode}<BR>
<!-- error-code로 정의할 경우, 예외가 정해져 있기 때문에
예외 유형부분이 출력이 안됨. 
// 예외유형 : ${pageContext.errorData.throwable}
-->

</td></tr>
</table>

</div>
</body>
</html>