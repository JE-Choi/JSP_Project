package jspbook.productbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jspbook.addrbook.AddrBook;

public class ProductBean {
	
	// 데이터베이스 연동
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// 최신버전 MySQL 연결정보
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
	
	// 자원 사용 완료시 반납.
	void disconnect() {
		// 객체가 null일 경우 처리 진행하지 않음.
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
	
	// 전체 상품 목록을 가져오는 메서드 : front-end쪽에 ResultSet형태가 아닌 arrayList형태로 결과를 보내준다. 
	public ArrayList<ProductBook> getDBList() {
		connect(); // 연결
		ArrayList<ProductBook> datas = new ArrayList<ProductBook>();
		// id의 오름차순으로 정렬 : asc
		String sql = "select * from mymall order by product_id asc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBook productbook = new ProductBook();
				
				productbook.setProduct_id(rs.getInt("product_id"));
				productbook.setProduct_name(rs.getString("product_name"));
				productbook.setProduct_type(rs.getString("product_type"));
				productbook.setProduct_price(rs.getInt("product_price"));
				productbook.setProduct_dealer(rs.getString("product_dealer"));
				productbook.setProduct_explanation(rs.getString("product_explanation"));
				productbook.setProduct_url(rs.getString("product_url"));
			
				datas.add(productbook);
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
	
	// 신규 물품 메시지 추가 메서드
	public boolean insertDB(ProductBook productbook) {
		connect(); // 연결
		String sql ="insert into mymall (product_name, product_type, product_price, product_dealer, product_explanation, product_url) values (?, ?, ?,?, ?, ?); ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,productbook.getProduct_name());
			pstmt.setString(2,productbook.getProduct_type());
			pstmt.setInt(3, productbook.getProduct_price());
			pstmt.setString(4,productbook.getProduct_dealer());
			pstmt.setString(5,productbook.getProduct_explanation());
			pstmt.setString(6,productbook.getProduct_url());
			
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
	
	public boolean updateDB(ProductBook productbook) {
		connect();
		
		String sql ="update mymall set product_name = ?, product_type = ?,  product_price = ?, product_dealer = ?, product_explanation = ?, product_url = ? where product_id = ?;";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,productbook.getProduct_name());
			pstmt.setString(2,productbook.getProduct_type());
			pstmt.setInt(3, productbook.getProduct_price());
			pstmt.setString(4,productbook.getProduct_dealer());
			pstmt.setString(5,productbook.getProduct_explanation());
			pstmt.setString(6,productbook.getProduct_url());
			pstmt.setInt(7,productbook.getProduct_id());
			
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
	public boolean deleteDB(int gb_id) {
		connect();
		
		String sql ="delete from mymall where product_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
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
	public ProductBook getDB(int gb_id) {
		connect();
		
		String sql = "select * from mymall where product_id=?";
		ProductBook productbook = new ProductBook();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			productbook.setProduct_id(rs.getInt("product_id"));
			productbook.setProduct_name(rs.getString("product_name"));
			productbook.setProduct_type(rs.getString("product_type"));
			productbook.setProduct_price(rs.getInt("product_price"));
			productbook.setProduct_dealer(rs.getString("product_dealer"));
			productbook.setProduct_explanation(rs.getString("product_explanation"));
			productbook.setProduct_url(rs.getString("product_url"));
			
			// 자원 반납.
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return productbook;
	}
	

}
