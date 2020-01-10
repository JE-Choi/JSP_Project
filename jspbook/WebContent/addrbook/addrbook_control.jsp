﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import="jspbook.addrbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ab" class="jspbook.addrbook.AddrBean"/> <!-- 0429 데이터베이스 연동부분 --> 
<jsp:useBean id="addrbook" class="jspbook.addrbook.AddrBook"/>
<!-- 0429 request보낸 jsp에서 인자로 넘겨 받은 걸로 addrbook초기화 -->
<jsp:setProperty name="addrbook" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	// 0429 액션으로 행위 분별
	// 0429 ?? 이 액션값은 어디서 넘어오는 것?
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	//0429 요청에 따라 처리를 하고, 화면 전환을 발생시키고, 필요에 따라 setAttribute를 해준다. 
	if(action.equals("list")) {
		ArrayList<AddrBook> datas = ab.getDBList();
		
		/*0429 ★addrbook_list.jsp를 불러야 하는데 'ArrayList<AddrBook> datas' 이것도 전달해 주길 원하는데
		attribute를 이용해 줘야 하는데 sendRedirect는 새로운 요청이기에 attribute가 유지가 안되기 때문에
		forward를 사용해야한다. */
		request.setAttribute("datas", datas);
		pageContext.forward("addrbook_list.jsp");
		
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {
		if(ab.insertDB(addrbook)){// 0429 insert가 성공이 되었다면?
			// 0429 addrbook_list.jsp를 호출을 해야하지만, 처리는 control이 하는 것이 맞기에 간접적으로 control을 redirect함.
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else{ // 0429 실패한 경우
			throw new Exception("DB 입력 오류");
		}
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
	}
	else {
	}
%>