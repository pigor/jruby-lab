import java.text.SimpleDateFormat;
import java.util.Date;

public class Greeting{
	private String name;
	private String email;

	public Greeting(String name, String email){
		this.name = name;
		this.email = email;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return this.name;
	}

	public void setEmail(String email){
		this.email = email;
	}

	public String getEmail(){
		return this.email;
	}

	public String sayHello(){
		String hello = "Hello, " + this.name;
		hello += ". Your email: " + this.email;
		hello += ". Date: " + new SimpleDateFormat("dd/MM/yyyy").format(new Date());

		return hello;
	}
}
