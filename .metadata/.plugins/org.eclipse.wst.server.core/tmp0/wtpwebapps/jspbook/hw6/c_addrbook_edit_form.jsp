<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.hw6.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 수정화면</title>
<script>
	function delcheck(){
		result = confirm("정말로 탈퇴하시겠습니까 ?");
		if(result == true){ // 탈퇴 진행
			document.form1.action.value="cdelete";
			document.form1.submit();
		} else{ // 탈퇴 취소
			return;
		}
	}
</script>
</head>

<jsp:useBean id="ab" scope="request" class="jspbook.hw6.AddrBook" />

<body>
<div align="center">
<H2>${sessionScope.id}: 고객정보 수정화면 </H2>
<HR>
	[<a href ="productbook_control.jsp?action=clist">고객 홈페이지로</a>]<br/>
	<a href="logout.jsp">로그아웃</a><br>
	<a href = "checkOut.jsp">장바구니 가기</a><br/>
	<a href = "order_control.jsp?action=clist&aid=${sessionScope.id}">구매목록 가기</a><br/>
	
<form name=form1 method=post action=addrbook_control.jsp>
<input type=hidden name="ab_id" value="<%=ab.getAb_id()%>">
<input type=hidden name = "action" value = "cupdate">
 
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
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="회원탈퇴" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>