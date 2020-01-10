<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="productbook_error.jsp" import="jspbook.productbook.*, java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>물품 작성화면</title>
<link rel="stylesheet" href="productbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>${sessionScope.id}: 물품 작성화면 </H2>
<HR>
[<a href=productbook_control.jsp?action=list>물품 목록으로</a>] <P>
[<a href ="manager_home.jsp">관리자 홈페이지로</a>]

<form name=form1 method=post action=productbook_control.jsp>
<!-- action의값을 insert으로 설정하여 
productrbook_control.jsp으로 넘어간 후 전달받은 action값에 대응한 처리과정을 수행한다. -->
<input type="hidden" name = "action" value="insert"/>
<table border="1">
  <tr>
    <th>물품명</th>	
    <td><input type="text" name="product_name" maxlength="15"></td>
  </tr>
  <tr>
    <th>물품종류</th>
    <td>
    	<select name="product_type">
    		<option>과일</option>
    		<option>채소</option>
    		<option>베이커리</option>
    		<option>수산물</option>
    		<option>건강식품</option>
    	</select>
    </td>
  </tr>
  <tr>
    <th>물품가격</th>
    <td><input type="text" name="product_price" maxlength="20"></td>
  </tr>
  <tr>
    <th>물품 판매처</th>
    <td><input type="text" name="product_dealer" maxlength="20"></td>
  </tr>  
  <tr>
    <th>물품 설명</th>
    <td><input type="text" name="product_explanation"></td>
  </tr>
   <tr>
    <th>물품 url</th>
    <td><input type="text" name="product_url" maxlength="200"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>

</div>
</body>
</html>