<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 작성화면</title>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>회원가입</H2>
<HR>
[<a href="index.html">홈페이지로</a>]<p>


<form name=form1 method=post action=addrbook_control.jsp>
<!-- addrbook_control.jsp으로 넘어갈 때 action값으로 실행할 행위를 전달한다. -->
<input type="hidden" name = "action" value="c_insert"/>
<table border="1">
	<tr>
    <th>아이디</th>
    <td><input type="text" name="ab_id" maxlength="15"></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="password" name="ab_pwd" maxlength="15"></td>
  </tr>
  <tr>
    <th>이 름</th>	
    <td><input type="text" name="ab_name" maxlength="15"></td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><input type="email" name="ab_email" maxlength="50"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="ab_tel" maxlength="20"></td>
  </tr>
  <tr>
    <th>생 일</th>
    <td><input type="date" name="ab_birth"></td>
  </tr>  
  <tr>
    <th>회 사</th>
    <td><input type="text" name="ab_comdept" maxlength="20"></td>
  </tr>
  <tr>
    <th>메 모</th>
    <td><input type="text" name="ab_memo"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>

</div>
</body>
</html>