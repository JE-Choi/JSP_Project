<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import="jspbook.hw3.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ab" class="jspbook.hw3.AddrBean"/> <!-- 데이터베이스 연동부분 --> 
<jsp:useBean id="addrbook" class="jspbook.hw3.AddrBook"/>
<!-- 0429 request보낸 jsp에서 인자로 넘겨 받은 걸로 addrbook초기화 -->
<jsp:setProperty name="addrbook" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	// 액션으로 행위 분별
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	// 요청에 따라 처리를 하고, 화면 전환을 발생시키고, 필요에 따라 setAttribute를 해줌.
	if(action.equals("list")) {
		ArrayList<AddrBook> datas = ab.getDBList();
		
		/* ★addrbook_list.jsp를 불러야 하는데 'ArrayList<AddrBook> datas' 이것도 전달해 주길 원하기에
		attribute를 이용해 줘야 하는데 sendRedirect는 새로운 요청이기에 attribute가 유지가 안되기 때문에
		forward를 사용해야한다. */
		request.setAttribute("datas_addr", datas);
		pageContext.forward("addrbook_list.jsp");
		
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {
		if(ab.insertDB(addrbook)){// insert가 성공이 되었다면?
			// addrbook_list.jsp를 호출을 해야하지만, 처리는 control이 하는 것이 맞기에 간접적으로 control을 redirect함.
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{ // 실패한 경우
			throw new Exception("DB 입력 오류");
		}
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		
		AddrBook abook = ab.getDB(addrbook.getAb_id());
		
		// 0520 고객이 설정한 비밀번호로 판별하겠다. 
		if (request.getParameter("ab_pwd").equals(addrbook.getAb_pwd())){
			// 수정 작업
			request.setAttribute("ab", abook);
			pageContext.forward("addrbook_edit_form.jsp");
		} else{ // 비밀번호 오류
			out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		}
	
	}
	// [고객]주소록 수정 페이지 요청인 경우
		else if(action.equals("cedit")) {
			AddrBook abook = ab.getDB(addrbook.getAb_id());
			request.setAttribute("ab", abook);
			pageContext.forward("c_addrbook_edit_form.jsp");
		
		}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
		if(ab.updateDB(addrbook)){ // 수정 성공
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{ // 수정 실패는 mysql에서의 오류임.
			throw new Exception("DB UPDATE 오류");
		}
	}
	// [고객]주소록 수정 등록 요청인 경우
	else if(action.equals("cupdate")) {
		if(ab.updateDB(addrbook)){ // 수정 성공
			response.sendRedirect("productbook_control.jsp?action=clist");
		} else{ // 수정 실패는 mysql에서의 오류임.
			throw new Exception("DB UPDATE 오류");
		}
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		
		if(ab.deleteDB(addrbook.getAb_id())){
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{
			throw new Exception("DB DELETE 오류");
		}
	}
	else {
	}
%>