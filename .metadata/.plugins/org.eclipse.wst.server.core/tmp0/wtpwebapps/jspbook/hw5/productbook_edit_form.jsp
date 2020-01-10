<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.hw5.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="productbook.css" type="text/css" media="screen" />

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

<jsp:useBean id="pb" scope="request" class="jspbook.hw5.ProductBook" />

<body>
<div align="center">
<H2>${sessionScope.id}: 물품목록 수정화면 </H2>
<HR>

[<a href=productbook_control.jsp?action=list>물품 목록으로</a>] <p>
[<a href ="manager_home.jsp">관리자 홈페이지로</a>]
<form name=form1 method=post action=productbook_control.jsp>
<input type=hidden name="product_id" value="<%=pb.getProduct_id()%>">
<input type="hidden" name = "action" value="update"/>
<table border="1">
  <tr>
    <th>물품명</th>	
    <td><input type="text" name="product_name" maxlength="15" value="<%=pb.getProduct_name() %>"></td>
  </tr>
  <tr>
    <th>물품종류</th>
    <td>
    	<select name="product_type">
    	<%
    	String[] types = {"과일","채소","베이커리","수산물","건강식품"};
    	for(int i = 0;i < types.length; i++){
    		
    		if(types[i].equals(pb.getProduct_type())){
    		%>
    			<option selected><%=types[i] %></option>
    			<%
    		} else{
    		%>
    			<option><%=types[i] %></option>
    	<% 
    		}
    	}
    	%>
    	</select>
    </td>
  </tr>
  <tr>
    <th>물품가격</th>
    <td><input type="text" name="product_price" maxlength="20" value="<%=pb.getProduct_price() %>"></td>
  </tr>
  <tr>
    <th>물품 판매처</th>
    <td><input type="text" name="product_dealer" maxlength="20" value="<%=pb.getProduct_dealer() %>"></td>
  </tr>  
  <tr>
    <th>물품 설명</th>
    <td><input type="text" name="product_explanation" value="<%=pb.getProduct_explanation() %>"></td>
  </tr>
   <tr>
    <th>물품 url</th>
    <td><input type="text" name="product_url" maxlength="200" value="<%=pb.getProduct_url() %>"></td>
  </tr>
  <tr>
     <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>