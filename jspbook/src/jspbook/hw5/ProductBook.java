package jspbook.hw5;

public class ProductBook {
	//물품 정보 관리 
	
	private int product_id; // 물품 id
	private String product_name; // 물품명
	private String product_type; // 물품  종류
	private int product_price; // 물품 가격
	private String product_dealer; // 물품 판매처
	private String product_explanation; // 물품 설명
	private String product_url; // 물품  url주소

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_dealer() {
		return product_dealer;
	}
	public void setProduct_dealer(String product_dealer) {
		this.product_dealer = product_dealer;
	}
	public String getProduct_explanation() {
		return product_explanation;
	}
	public void setProduct_explanation(String product_explanation) {
		this.product_explanation = product_explanation;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}

}
