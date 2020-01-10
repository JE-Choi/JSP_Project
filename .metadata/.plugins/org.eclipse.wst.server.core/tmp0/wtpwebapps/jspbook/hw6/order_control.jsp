<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import="jspbook.hw6.*, java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="od" class="jspbook.hw6.OrderBean"/>
<jsp:useBean id="order" class="jspbook.hw6.Order"/>
<jsp:setProperty name="order" property="*"/>


<% 
	// 액션값으로 컨트롤러 행위 분별
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 쇼핑몰 목록 요청인 경우
	if(action.equals("list")) {
/*		ArrayList<ProductBook> datas = pb.getDBList();
		
		request.setAttribute("datas_product", datas);
		pageContext.forward("productbook_list.jsp");*/
		ArrayList<Order> datas = od.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("order_list.jsp");
		
	}
	else if (action.equals("list_oid")){
		String aid = request.getParameter("aid");
		ArrayList<Order> datas = od.getDBList(aid);
		request.setAttribute("datas", datas);
		pageContext.forward("order_list.jsp");
	}
	else if(action.equals("clist")) {
		String aid = request.getParameter("aid");
		ArrayList<Order> datas = od.getDBList(aid);
		request.setAttribute("datas", datas);
		pageContext.forward("cust_order_list.jsp");
		/*ArrayList<ProductBook> datas = pb.getDBList();
		request.setAttribute("datas_product", datas);
		
		// 고객 화면에서는 전환 되는 화면만 list action과 다르게 하겠다. (고객용 화면으로 전환하겠다) 
		pageContext.forward("cust_prd_list.jsp");*/
		
	}
	// 쇼핑몰 등록 요청인 경우
	else if(action.equals("insert")) {
		/*
		if(pb.insertDB(productbook)){// insert 성공
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ // insert 오류
			throw new Exception("DB 입력 오류");
		}*/
		
	} else if(action.equals("cinsert")) {
		if(od.insertDB(order)) {
			//String aid = order.getAb_id();
			String aid = order.getAb_id();
			response.sendRedirect("order_control.jsp?action=clist&aid="+aid);
			}
			else
			throw new Exception("DB 입력오류");
	}
	// 쇼핑몰 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		Order obook = od.getDB(Integer.parseInt(request.getParameter("od_id")));
		if(!request.getParameter("pwd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!'); history.go(-1); </script>");
			}
			else {
			request.setAttribute("od",obook);
			pageContext.forward("ord_edit_form.jsp");
		}
		/*ProductBook pbook = pb.getDB(Integer.parseInt(request.getParameter("pb_id")));
		if(!request.getParameter("pwd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!'); history.go(-1); </script>");
			}
			else {
			request.setAttribute("pb",pbook);
			pageContext.forward("productbook_edit_form.jsp");
		}*/
	}
	// 쇼핑몰 업데이트 등록 요청인 경우
	else if(action.equals("update")) {
		
		if(od.updateDB(order)){
			//response.sendRedirect("order_control.jsp?action=list_oid&aid="+order.getAb_id());
			response.sendRedirect("order_control.jsp?action=list");
		} else{ 
			throw new Exception("DB 입력 오류");
		}
		/*	if(pb.updateDB(productbook)){
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ 
			throw new Exception("DB 입력 오류");
		}*/
	}
	// 쇼핑몰 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(od.deleteDB(Integer.parseInt(request.getParameter("o_id")))){
			response.sendRedirect("order_control.jsp?action=list");
		} else{ 
			throw new Exception("DB 삭제 오류");
		}
		/*if(pb.deleteDB(Integer.parseInt(request.getParameter("product_id")))){
			response.sendRedirect("productbook_control.jsp?action=list");
		} else{ 
			throw new Exception("DB 삭제 오류");
		}*/
	}
	else {
	}
%>