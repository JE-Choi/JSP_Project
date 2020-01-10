package jspbook.ch12;

//클래스 import
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class Bank2Bean {
	
	// 멤버 선언
	private int aid;
	private String aname;
	private int balance;

	// 데이터베이스 관련 객체 선언
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;

	// JNDI를 통한 연결
	public void connect() {

		try {
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);
			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
			//Context initContext = new InitialContext();
			//Context envContext = (Context) initContext.lookup("java:/comp/env");
			//DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");
			//conn = ds.getConnection();
		}

		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

	// connection 연결종료
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
			ResultSet rs = stmt.executeQuery("select * from bank2");
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

	// getXxx 메서드
	public int getAid() {
		return aid;
	}

	public String getAname() {
		return aname;
	}

	public int getBalance() {
		return balance;
	}
}