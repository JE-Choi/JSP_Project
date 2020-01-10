<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.hw3.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 수정화면</title>
<script>
	function delcheck(){
		result = confirm("정말로 삭제하겠습니까?");
		if(result == true){ // 삭제 진행
			document.form1.action.value = "delete";
			document.form1.submit();
		} else{ // 삭제 취소
			return;
		}
	}
</script>
</head>

<jsp:useBean id="ab" scope="request" class="jspbook.hw3.AddrBook" />

<body>
<div align="center">
<H2>${sessionScope.id}: 고객 수정화면 </H2>
<HR>
[<a href=addrbook_list.jsp>주소록 목록으로</a>] <p>
[<a href ="manager_home.jsp">관리자 홈페이지로</a>]
<form name=form1 method=post action=addrbook_control.jsp>
<input type=hidden name="ab_id" value="<%=ab.getAb_id()%>">
<input type=hidden name = "action" value = "update">
 
<table border="1">
	<tr>
    <th>아이디</th>
    <td><input type="text" name="ab_id" value="<%=ab.getAb_id() %>" readonly></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="password" name="ab_pwd" value="<%=ab.getAb_pwd() %>"></td>
  </tr>
  <tr>
    <th>이 름</th>
    <td><input type="text" name="ab_name" value="<%=ab.getAb_name() %>"></td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><input type="text" name="ab_email" value="<%=ab.getAb_email() %>"></td>
  </tr>
    <tr>
    <th>전화번호</th>
    <td><input type="text" name="ab_tel" value="<%=ab.getAb_tel() %>"></td>
  </tr>
      <tr>
    <th>생 일</th>
    <td><input type="date" name="ab_birth" value="<%=ab.getAb_birth() %>"></td>
  </tr>
  <tr>
    <th>회 사</th>
    <td><input type="text" name="ab_comdept" value="<%=ab.getAb_comdept() %>"></td>
  </tr>
  <tr>
    <th>메 모</th>
    <td><input type="text" name="ab_memo" value="<%=ab.getAb_memo() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>