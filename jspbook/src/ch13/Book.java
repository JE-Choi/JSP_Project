package ch13;

/**
 * @author skskj
 *
 */
public class Book {
	// 멤버변수 선언
	private String title;
	private String author;
	private int price;
	private String publisher;
	
	// 기본 생성자, 파라미터로 데이터 초기화
		public Book(String title,String author, int price, String publisher) {
			this.title = title;
			this.author = author;
			this.price = price;
			this.publisher = publisher;
		}
		
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

}
