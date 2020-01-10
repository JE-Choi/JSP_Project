package jspbook.ch14;

// (1) 로깅을 하기 위한 라이브러리 import
import org.slf4j.*;

public class LogTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String msg = "Hello!!! Log!!!";
		// (2) 인자는 누구에 의한 로그임? : 나 자신을 위한 로그임! > 자기 클래스 명.class
		Logger logger = LoggerFactory.getLogger(LogTest.class);
		// (3) 인자는 어떤 로그를 찍을 건지 임의로 넣은 거임.
		//logger.info("test log");
		// 여기에서는 로그 메세지는 똑같이 출력해도된다. 
		// 변수를 넣고 싶다면 {대괄호}를 치고 뒤에 콤마찍고 변수명 적기.
		//logger.warn("test log{}",msg);
		
//		실행할 때는 run as server가 아니라
//		얘는 자바 프로그램이기 때문에, java Application으로 실행해야 한다. 


	}

}
