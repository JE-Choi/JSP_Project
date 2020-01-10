<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import="jspbook.hw5.*, java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="pb" class="jspbook.hw5.PrdBean"/> 
<jsp:useBean id="productbook" class="jspbook.hw5.ProductBook"/>
<jsp:setProperty name="productbook" property="*"/> 


<% 
	// 액션값으로 컨트롤러 행위 분별
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 쇼핑몰 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<ProductBook> datas = pb.getDBList();
		
		request.setAttribute("datas_product", datas);
		pageContext.forward("productbook_list.jsp");
		
	}
	else if(action.equals("clist")) {
		
		ArrayList<ProductBook> datas = pb.getDBList();
		request.setAttribute("datas_product", datas);
		
		// 고객 화면에서는 전환 되는 화면만 list action과 다르게 하겠다. (고객용 화면으로 전환하겠다) 
		pageContext.forward("cust_prd_list.jsp");
		
	}
	// 쇼핑몰 등록 요청인 경우
	else if(action.equals("insert")) {
		
		if(pb.insertDB(productbook)){// insert 성공
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ // insert 오류
			throw new Exception("DB 입력 오류");
		}
		
	}
	// 쇼핑몰 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		ProductBook pbook = pb.getDB(Integer.parseInt(request.getParameter("pb_id")));
		if(!request.getParameter("pwd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!'); history.go(-1); </script>");
			}
			else {
			request.setAttribute("pb",pbook);
			pageContext.forward("productbook_edit_form.jsp");
		}
	}
	// 쇼핑몰 업데이트 등록 요청인 경우
	else if(action.equals("update")) {
		if(pb.updateDB(productbook)){
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ 
			throw new Exception("DB 입력 오류");
		}
	}
	// 쇼핑몰 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(pb.deleteDB(Integer.parseInt(request.getParameter("product_id")))){
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ 
			throw new Exception("DB 삭제 오류");
		}
	}
	else {
	}
%>