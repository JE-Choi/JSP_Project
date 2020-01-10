<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.addrbook.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:수정화면</title>
</head>

<jsp:useBean id="ab" scope="request" class="jspbook.addrbook.AddrBook" />

<body>
<div align="center">
<H2>주소록:수정화면 </H2>
<HR>
[<a href=addrbook_list.jsp>주소록 목록으로</a>] <p>
<form name=form1 method=post action=addrbook_control.jsp>
<input type=hidden name="ab_id" value="<%=ab.getAb_id()%>">
<table border="1">
  <tr>
    <th>이 름</th>
    <td><input type="text" name="ab_name" value="홍길동"></td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><input type="text" name="ab_email" value="hong@gmail.com"></td>
  </tr>
    <tr>
    <th>전화번호</th>
    <td><input type="text" name="ab_tel" value="010-1234-5678"></td>
  </tr>
      <tr>
    <th>생 일</th>
    <td><input type="date" name="ab_birth" value="1999-03-01"></td>
  </tr>
  <tr>
    <th>회 사</th>
    <td><input type="text" name="ab_comdept" value="덕성여자대학교"></td>
  </tr>
  <tr>
    <th>메 모</th>
    <td><input type="text" name="ab_memo" value="컴퓨터공학과"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>