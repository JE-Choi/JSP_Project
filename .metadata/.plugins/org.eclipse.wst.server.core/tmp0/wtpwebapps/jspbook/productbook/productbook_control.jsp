<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="productbook_error.jsp" import="jspbook.productbook.*, java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="pb" class="jspbook.productbook.ProductBean"/> 
<jsp:useBean id="productbook" class="jspbook.productbook.ProductBook"/>
<jsp:setProperty name="productbook" property="*"/> 


<% 
	// 액션값으로 컨트롤러 행위 분별
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 쇼핑몰 목록 요청인 경우
	if(action.equals("list")) {
		ArrayList<ProductBook> datas = pb.getDBList();
		
		/*0429 ★addrbook_list.jsp를 불러야 하는데 'ArrayList<AddrBook> datas' 이것도 전달해 주길 원하는데
		attribute를 이용해 줘야 하는데 sendRedirect는 새로운 요청이기에 attribute가 유지가 안되기 때문에
		forward를 사용해야한다. */
		request.setAttribute("datas", datas);
		pageContext.forward("productbook_list.jsp");
		
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
		if(pb.updateDB(productbook)){// insert 성공
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ // insert 오류
			throw new Exception("DB 입력 오류");
		}
	}
	// 쇼핑몰 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(pb.deleteDB(Integer.parseInt(request.getParameter("product_id")))){// insert 성공
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ // insert 오류
			throw new Exception("DB 삭제 오류");
		}
	}
	else {
	}
%>