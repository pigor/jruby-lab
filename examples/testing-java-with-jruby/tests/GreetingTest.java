import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;

public class GreetingTest {
	Greeting greeting;
	String date;

	@Before
	public void before(){
		greeting = new Greeting("Mateus", "mateus@idopter.com");
		date = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
	}

	@Test
	public void testSayHello() {
		assertEquals("Hello, Mateus. Your email: mateus@idopter.com. Date: " + date, greeting.sayHello());
	}

}
