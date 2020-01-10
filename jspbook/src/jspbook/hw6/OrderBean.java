package jspbook.hw6;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderBean {

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
		
		// 구매 목록 UPDATE
		public boolean updateDB(Order ord) {
			connect();
			
			String sql ="update myorder set ab_id=?,pd_id1=?,pd_num1=?,pd_id2=?,pd_num2=?,pd_id3=?,pd_num3=?,pd_id4=?,pd_num4=?,pd_id5=?,pd_num5=?,pd_total=? where o_id=?";
			 
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,ord.getAb_id());
				pstmt.setInt(2,ord.getPd_id1());
				pstmt.setInt(3, ord.getPd_num1());
				pstmt.setInt(4, ord.getPd_id2());
				pstmt.setInt(5, ord.getPd_num2());
				pstmt.setInt(6, ord.getPd_id3());
				pstmt.setInt(7, ord.getPd_num3());
				pstmt.setInt(8, ord.getPd_id4());
				pstmt.setInt(9, ord.getPd_num4());
				pstmt.setInt(10, ord.getPd_id5());
				pstmt.setInt(11, ord.getPd_num5());
				
				pstmt.setInt(12,ord.getPd_total());
				
				// 이거 추가함.
				pstmt.setInt(13,ord.getO_id());
				
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
		
		// 구매 요소 삭제
		public boolean deleteDB(int o_id) {
			connect();
			
			String sql ="delete from myorder where o_id=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,o_id);
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
		
		// 구매 목록 추가
		public boolean insertDB(Order ord) {
			connect(); // 연결
			String sql ="insert into myorder(ab_id,pd_id1,pd_num1,pd_id2,pd_num2,pd_id3,pd_num3,pd_id4,pd_num4,pd_id5,pd_num5,pd_total) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,ord.getAb_id());
				pstmt.setInt(2,ord.getPd_id1());
				pstmt.setInt(3, ord.getPd_num1());
				pstmt.setInt(4,ord.getPd_id2());
				pstmt.setInt(5, ord.getPd_num2());
				pstmt.setInt(6,ord.getPd_id3());
				pstmt.setInt(7, ord.getPd_num3());
				pstmt.setInt(8,ord.getPd_id4());
				pstmt.setInt(9, ord.getPd_num4());
				pstmt.setInt(10,ord.getPd_id5());
				pstmt.setInt(11, ord.getPd_num5());
				
				pstmt.setInt(12,ord.getPd_total());
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
		
		// 특정 구매요소 가져오는 메서드 : 고객모드
		public Order getDB(int o_id) {
			connect();
			
			String sql = "select * from myorder where o_id=?";
			// 쿼리로 받은 정보 저장할 객체 확보
			Order ord = new Order();
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,o_id);
				ResultSet rs = pstmt.executeQuery();
				
				// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
				rs.next();
				// DB에서 가져온 정보로 객체의 속성값을 SET한다. 
				ord.setO_id(rs.getInt("o_id"));
				ord.setAb_id(rs.getString("ab_id"));
				ord.setPd_id1(rs.getInt("pd_id1"));
				ord.setPd_num1(rs.getInt("pd_num1"));
				ord.setPd_id2(rs.getInt("pd_id2"));
				ord.setPd_num2(rs.getInt("pd_num2"));
				ord.setPd_id3(rs.getInt("pd_id3"));
				ord.setPd_num3(rs.getInt("pd_num3"));
				ord.setPd_id4(rs.getInt("pd_id4"));
				ord.setPd_num4(rs.getInt("pd_num4"));
				ord.setPd_id5(rs.getInt("pd_id5"));
				ord.setPd_num5(rs.getInt("pd_num5"));
				
				ord.setPd_total(rs.getInt("pd_total"));
				// 자원 반납.
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return ord;
		}
		
		// 전체 구매 목록을 가져오는 메서드 : front-end 쪽에 ResultSet 형태가 아닌 arrayList형태로 결과를 보내준다. -> 전체 사용자
		public ArrayList<Order> getDBList() {
				connect(); // 연결
				ArrayList<Order> datas = new ArrayList<Order>();
				// o_id의 내림차순으로 정렬 : desc
				String sql = "select * from myorder order by o_id desc";
				
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					// 한행씩 옮겨가며 데이터 get해서 객체에 set하기
					while(rs.next()) {
						Order ord = new Order();
						ord.setO_id(rs.getInt("o_id")); // 추후에 사용될 order를 관리하기 위해서
						ord.setAb_id(rs.getString("ab_id"));
						ord.setPd_id1(rs.getInt("pd_id1"));
						ord.setPd_num1(rs.getInt("pd_num1"));
						ord.setPd_id2(rs.getInt("pd_id2"));
						ord.setPd_num2(rs.getInt("pd_num2"));
						ord.setPd_id3(rs.getInt("pd_id3"));
						ord.setPd_num3(rs.getInt("pd_num3"));
						ord.setPd_id4(rs.getInt("pd_id4"));
						ord.setPd_num4(rs.getInt("pd_num4"));
						ord.setPd_id5(rs.getInt("pd_id5"));
						ord.setPd_num5(rs.getInt("pd_num5"));
						
						ord.setPd_total(rs.getInt("pd_total"));
						// 배열에 객체 추가
						datas.add(ord);
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
		
		// 전체 구매 목록을 가져오는 메서드 : front-end 쪽에 ResultSet 형태가 아닌 arrayList형태로 결과를 보내준다. -> 특정 사용자
		public ArrayList<Order> getDBList(String aid) {
			connect(); // 연결
			ArrayList<Order> datas = new ArrayList<Order>();
			// o_id의 내림차순으로 정렬 : desc
			String sql = "select * from myorder where ab_id= ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,aid);
				ResultSet rs = pstmt.executeQuery();
				
				// 한행씩 옮겨가며 데이터 get해서 객체에 set하기
				while(rs.next()) {
					Order ord = new Order();
					ord.setO_id(rs.getInt("o_id")); // 추후에 사용될 order를 관리하기 위해서
					ord.setAb_id(rs.getString("ab_id"));
					ord.setPd_id1(rs.getInt("pd_id1"));
					ord.setPd_num1(rs.getInt("pd_num1"));
					ord.setPd_id2(rs.getInt("pd_id2"));
					ord.setPd_num2(rs.getInt("pd_num2"));
					ord.setPd_id3(rs.getInt("pd_id3"));
					ord.setPd_num3(rs.getInt("pd_num3"));
					ord.setPd_id4(rs.getInt("pd_id4"));
					ord.setPd_num4(rs.getInt("pd_num4"));
					ord.setPd_id5(rs.getInt("pd_id5"));
					ord.setPd_num5(rs.getInt("pd_num5"));
					
					ord.setPd_total(rs.getInt("pd_total"));
					// 배열에 객체 추가
					datas.add(ord);
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
		
		
}
