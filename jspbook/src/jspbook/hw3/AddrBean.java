package jspbook.hw3;

import java.sql.*;
import java.util.*;

public class AddrBean { 
	// 여러개의 addrBook을 관리하는 부분
	// 데이터베이스 연동
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	/* MySQL 연결정보  -> 최신 버전으로 수정*/ 
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	// DB연결 메서드
	void connect() {
		try {
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);
			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 모든 자원들이 사용되었다다면 자원 반납.
	void disconnect() {
		// 객체가 null이면 할당 받은 상태가 아니니 if문으로 거름.
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 수정된 주소록 내용 갱신을 위한 메서드
	// 입력값은 AddrBook형태로 전달된다. 
	// 즉, AddrBook의 getter함수를 이용해서 객체의 속성값들을 가져오는 것임.
	public boolean updateDB(AddrBook addrbook) {
		connect();
		
		String sql ="update addrbook set ab_name=?, ab_email=?, ab_birth=?, ab_tel=?, ab_comdept=?, ab_memo=?, ab_pwd=? where ab_id=?";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			// where절 인자 설정
			pstmt.setString(1,addrbook.getAb_name());
			pstmt.setString(2,addrbook.getAb_email());
			pstmt.setString(3, addrbook.getAb_birth());
			pstmt.setString(4,addrbook.getAb_tel());
			pstmt.setString(5,addrbook.getAb_comdept());
			pstmt.setString(6,addrbook.getAb_memo());
			pstmt.setString(7,addrbook.getAb_pwd());
			pstmt.setString(8,addrbook.getAb_id());
			
			// select, insert, delete할때는 executeQuery()함수 사용하는데
			// update는 다름
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 특정 주소록 게시글 삭제 메서드
	public boolean deleteDB(String ab_id) {
		connect();
		
		String sql ="delete from addrbook where ab_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,ab_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 신규 주소록 메시지 추가 메서드
	public boolean insertDB(AddrBook addrbook) {
		connect();
		
		// id부분은 자동증가라 필드에 포함 안 시킴.		
		String sql ="insert into addrbook(ab_name,ab_email,ab_birth,ab_tel,ab_comdept,ab_memo,ab_id,ab_pwd) values(?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,addrbook.getAb_name());
			pstmt.setString(2,addrbook.getAb_email());
			pstmt.setString(3, addrbook.getAb_birth());
			pstmt.setString(4,addrbook.getAb_tel());
			pstmt.setString(5,addrbook.getAb_comdept());
			pstmt.setString(6,addrbook.getAb_memo());
			pstmt.setString(7, addrbook.getAb_id());
			pstmt.setString(8, addrbook.getAb_pwd());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}

	// 특정 주소록 게시글 가져오는 메서드
	public AddrBook getDB(String ab_id) {
		connect();
		
		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrbook = new AddrBook();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,ab_id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행됨.
			rs.next();
			addrbook.setAb_id(rs.getString("ab_id"));
			addrbook.setAb_pwd(rs.getString("ab_pwd"));
			addrbook.setAb_name(rs.getString("ab_name"));
			addrbook.setAb_email(rs.getString("ab_email"));
			addrbook.setAb_birth(rs.getString("ab_birth"));
			addrbook.setAb_tel(rs.getString("ab_tel"));
			addrbook.setAb_comdept(rs.getString("ab_comdept"));
			addrbook.setAb_memo(rs.getString("ab_memo"));
			
			// 자원 반납.
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return addrbook;
	}
	
	// 전체 주소록 목록을 가져오는 메서드
	// 전체 데이터 추출한다고 할때 ResultSet형태로 front로 보내주는 게 아니라, arrayList에 저장해서 반환.
	public ArrayList<AddrBook> getDBList() {
		connect();
		ArrayList<AddrBook> datas = new ArrayList<AddrBook>();
		// asc는 오름순, desc는 내림차순
		String sql = "select * from addrbook order by ab_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrbook = new AddrBook();
				
				addrbook.setAb_id(rs.getString("ab_id"));
				addrbook.setAb_pwd(rs.getString("ab_pwd"));
				addrbook.setAb_name(rs.getString("ab_name"));
				addrbook.setAb_email(rs.getString("ab_email"));
				addrbook.setAb_comdept(rs.getString("ab_comdept"));
				addrbook.setAb_birth(rs.getString("ab_birth"));
				addrbook.setAb_tel(rs.getString("ab_tel"));
				addrbook.setAb_memo(rs.getString("ab_memo"));
				datas.add(addrbook);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	public boolean checkUser(String ab_id, String ab_pwd) {
		connect();
		String sql = "select * from addrbook where ab_id=?";
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,ab_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
		if(ab_id.equals(rs.getString("ab_id"))&&ab_pwd.equals(rs.getString
		("ab_pwd"))){
		rs.close(); // 이거 없음 오류남.
		// 내가 입력한 id가 db에 존재하고, 비밀번호고 일치한다. 
		return true;
		}
		rs.close();
		} catch (SQLException e) {e.printStackTrace();}
		finally {disconnect();}
		return false;
	}
	
}