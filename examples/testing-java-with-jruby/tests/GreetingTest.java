import static org.junit.Assert.assertEquals;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class GreetingTest {
	Greeting greeting;
	String date;

	@Test
	public void testSayHello() {
		greeting = new Greeting("Mateus", "mateus@idopter.com");
		date = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
		assertEquals("Hello, Mateus. Your email: mateus@idopter.com. Date: " + date, greeting.sayHello());
	}

}
