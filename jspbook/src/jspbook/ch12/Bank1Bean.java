package jspbook.ch12;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

// bank2와 다른건 한개의 메소드가 다르다. 
public class Bank1Bean {
	
	// 멤버 선언 + getter함수 존재
	private int aid;
	private String aname;
	private int balance;
	

	// 데이터베이스 관련 객체 선언
	//String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	//String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	public int getAid() {
		return aid;
	}

	public String getAname() {
		return aname;
	}

	public int getBalance() {
		return balance;
	}

	// JNDI를 통한 연결
	// 지금까지 쓰던 connect와 disconnect와 동일함. 
	// 실행하다가 안되면, 커넥션 풀말고 원래 하던 방식대로 해도돼요.
	public void connect() {
		try {
			// JDBC 드라이버 로드
			//Class.forName(jdbc_driver);
			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			//conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");
			conn = ds.getConnection();
		}

		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

	// connection  반환
	public void disconnect() {
		try {
			if (conn != null)
				conn.close();
		}
		catch (SQLException e) {
			System.out.println(e);
		}
		System.out.println("close");
	}

	// bank1 테이블 데이터 가져오는 메서드
	public void getData() {
		connect();
		try {
			stmt = conn.createStatement();
			// 원래는 하나의 레코드만 뽑아야 해서 where절이 필요한데, 우리는 한행밖에 테이블에 없으니까 생략 한 거임.
			ResultSet rs = stmt.executeQuery("select * from bank1");
			rs.next();
			aid = rs.getInt("aid");
			aname = rs.getString("aname");
			balance = rs.getInt("balance");
		}
		catch (Exception e) {
			System.out.println(aid + aname + balance);
			System.out.println(e);
		}
		finally {
			disconnect();
		}
	}

	// 이체 처리 메서드
	// 트랜잭션 개념 적용된 것임.
	public boolean transfer(int bal) {
		connect();
		try {
			conn.setAutoCommit(false); // 오토커밋 끔.
			// 입력받은 이체 값만큼 감소시키고, 증가시켜 거래를 진행시킨다. 
//			pstmt = conn
//			.prepareStatement("update bank1 set balance = balance-? where aid=101");
//			pstmt.setInt(1, bal);
////			pstmt.executeUpdate();
//			//addBatch()사용하기
//			// prepareStatement의 다른 명령어면 addBatch()이건 일괄처리 못함
//			// 다른 명령어 인데 일괄서리 하고 싶은 경우에는
//			pstmt.addBatch();
//			int[] cnt = pstmt.executeBatch();
//			pstmt = conn
//			.prepareStatement("update bank2 set balance = balance+? where aid=201");
//
//			pstmt.setInt(1, bal);
////			pstmt.executeUpdate();
//			pstmt.addBatch();
//			cnt = pstmt.executeBatch();
//			
//			
			stmt = conn.createStatement();
			// state로 되어있기 때문에 명령어가 달라도 일과처리가 가능하다. 
			// stmt = conn.createStatement(); 이후에 해야 한다. 
			// ★? 물음표를 기준으로 해서 나눠 줘야한다. 물음표 자리에 변수명을 넣는다. 
			// where앞에는 무조건 한칸 띄어져 있어야 한다. 
			stmt.addBatch("update bank1 set balance = balance-"+bal+" where aid=101");
			stmt.addBatch("update bank2 set balance = balance+"+bal+" where aid=201");
			int[] cnt = stmt.executeBatch();

			ResultSet rs = stmt
			.executeQuery("select balance from bank2 where aid=201");

			rs.next();
			// 이 사용자의 한계값은 100으로 지정했기 때문에, 100초과면 거래를 취소한다. 
			// pdf는 40으로 되어있음.
			if (rs.getInt(1) > 100) {
				conn.rollback();
				return false;
			}
			else
				conn.commit();
		}
		catch (Exception e) {
				System.out.println(e);
		}
		finally {
			disconnect();
		}
		return true;
	}


}