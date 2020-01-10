<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.hw6.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="ordbook.css" type="text/css" media="screen" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>물품목록 수정화면</title>
<script type="text/javascript">
	function delcheck(){
		
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
			}
		else{
			return;
		}
	}
</script>
</head>

<jsp:useBean id="od" scope="request" class="jspbook.hw6.Order" />

<body>
<div align="center">
<H2>${sessionScope.id}: 주문목록 수정화면 </H2>
<HR>

[<a href ="manager_home.jsp">관리자 홈페이지로</a>]
<form name=form1 method=post action=order_control.jsp>
<input type=hidden name="o_id" value="<%=od.getO_id()%>">
<input type="hidden" name = "action" value="update"/>
<table border="1">
  <tr>
    <th>o_id</th>	
    <td><input type="text" name="o_id" maxlength="15" value="<%=od.getO_id() %>" readonly></td>
  </tr>
  
  <tr>
    <th>a_id</th>	
    <td><input type="text" name="ab_id" maxlength="15" value="<%=od.getAb_id() %>" readonly></td>
  </tr>
  
  <tr>
    <th>물품1</th>
    <td><input type="text" name="pd_id1" maxlength="20" value="<%=od.getPd_id1() %>"></td>
  </tr>
  <tr>
    <th>수량1</th>
    <td><input type="text" name="pd_num1" maxlength="20" value="<%=od.getPd_num1() %>"></td>
  </tr>  
  
   <tr>
    <th>물품2</th>
    <td><input type="text" name="pd_id2" maxlength="20" value="<%=od.getPd_id2() %>"></td>
  </tr>
  <tr>
    <th>수량2</th>
    <td><input type="text" name="pd_num2" maxlength="20" value="<%=od.getPd_num2() %>"></td>
  </tr>  
  
  <tr>
    <th>물품3</th>
    <td><input type="text" name="pd_id3" maxlength="20" value="<%=od.getPd_id3() %>"></td>
  </tr>
  <tr>
    <th>수량3</th>
    <td><input type="text" name="pd_num3" maxlength="20" value="<%=od.getPd_num3() %>"></td>
  </tr>
  
    <tr>
    <th>물품4</th>
    <td><input type="text" name="pd_id4" maxlength="20" value="<%=od.getPd_id4() %>"></td>
  </tr>
  <tr>
    <th>수량4</th>
    <td><input type="text" name="pd_num4" maxlength="20" value="<%=od.getPd_num4() %>"></td>
  </tr>
  
  <tr>
    <th>물품5</th>
    <td><input type="text" name="pd_id5" maxlength="20" value="<%=od.getPd_id5() %>"></td>
  </tr>
  <tr>
    <th>수량5</th>
    <td><input type="text" name="pd_num5" maxlength="20" value="<%=od.getPd_num5() %>"></td>
  </tr>
  
  
 
  <tr>
     <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>
</div>
</body>
</html>