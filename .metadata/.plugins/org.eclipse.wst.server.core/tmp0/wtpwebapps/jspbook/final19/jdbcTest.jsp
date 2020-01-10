<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.sql.*,javax.sql.*, javax.naming.*"%>
	<% request.setCharacterEncoding("utf-8"); 
	%>
<script type="text/javascript">
	function orderBy(){
		document.location.href = "jdbcTest.jsp?action=orderby";
	}
	
	function search(){
		search_grade = prompt('검색하고자 하는 학년을 넣으세요(전체는 0)');
		document.location.href = "jdbcTest.jsp?action=search&search_grade="+search_grade;
	}
</script>
	<%request.setAttribute("test", "기말고사1");
	request.setAttribute("test", "기말고사1");%>


	<%
		// 데이터베이스 연결 관련 변수 선언
		Connection conn = null;
		// 데이터베이스 연결로 부터 SQL문을 수행할 수 있도록 해주는 클래스
		PreparedStatement pstmt = null;
		
		/* MySQL 연결정보  -> 0429 최신 버전으로 수정*/ 
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		// 데이터 베이스 이름
		String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		
		try{
			// 1단계: JDBC 드라이버 로깅
			Class.forName(jdbc_driver);
			
			// 2단계: 데이터베이스 연결
			// Connection 클래스 인스턴스 레퍼런스 얻기
			// 유저 이름
			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
			
			// 3단계: Statement생성
			String sql = "insert into addrbook_table (name, tel, address, grade) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,request.getParameter("name"));
			pstmt.setString(2, request.getParameter("tel"));
			pstmt.setString(3, request.getParameter("address"));
			pstmt.setString(4, request.getParameter("grade"));
			
			// 4단계: SQL문 전송
			if(request.getParameter("name") != null){
				pstmt.executeUpdate();
			}
			
			
		}catch(Exception e){
			System.out.println(e);
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 관리</title>
</head>
<body>
	<div align="center">
	<h2>데이터베이스 관리</h2>
	<hr/>
	
	<p>
	<form name=form1 method=post action=jdbcTest.jsp>

	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" maxlength="15"></td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="tel" maxlength="15"></td>
		</tr>
		
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" maxlength="15"></td>
		</tr>
		
		<tr>
			<td>학년</td>
			<td><input type="text" name="grade" maxlength="15"></td>
		</tr>
	
	</table>
	<input type=submit value="추가"/>
	</form>
	</p>
	<p>
	<%
	String action = request.getParameter("action");
	String select_sql = "";
	 try{
		 if(action == null){
			 select_sql = "select * from addrbook_table"; 
		 } else if(action.equals("orderby")){
			 select_sql = "select * from addrbook_table order by name asc";
		 } else if(action.equals("search")){
			 String search_grade = request.getParameter("search_grade");
			 int grade = Integer.parseInt(search_grade);
			 System.out.println(grade);
			 if(grade == 0){
				 select_sql = "select * from addrbook_table"; 
			 } else{
				 select_sql = "select * from addrbook_table where grade="+grade; 
			 }
		 }
		 pstmt = conn.prepareStatement(select_sql);
		 
		 ResultSet rs = pstmt.executeQuery();
		 %>
			<table border="1">
				<tr><th>ID</th>
				<th><a href="javascript:orderBy()">이름</a></th>
				<th>전화번호</th><th>주소</th>
				<th><a href="javascript:search()">학년</a></th></tr>
				
		
	
		 <%
		 // 마지막 데이터까지 반복
		 while(rs.next()){
			 String id = rs.getString("id");
			 String name = rs.getString("name");
			 String tel = rs.getString("tel");
			 String address = rs.getString("address");
			 String grade = rs.getString("grade");
			%>
			<tr>
			<td><%=id%></td>
			<td><%=name %></td>
			<td><%=tel %></td>
			<td><%=address %></td>
			<td><%=grade %></td>
			</tr>
		<% } %>
	 		</table>
		 <%
		 
		 // 사용 완료 후 자원 반납
		 rs.close();
		 pstmt.close();
		 conn.close();
	 }catch(Exception e){
		 System.out.println(e);
	 }
	%>
	

	</p>
	</div>
	
</body>
</html>