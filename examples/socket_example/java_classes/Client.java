import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;

public class Client implements Runnable{
	
	private Socket socket;
	
	public Client(Socket socket){
		System.out.println("Cliente inicializado...");
		this.socket = socket;
	}
	
	public void run(){
		try{
		  Scanner chat = new Scanner(System.in);
			Scanner input = new Scanner(socket.getInputStream());
			PrintWriter output = new PrintWriter(socket.getOutputStream());
			
			System.out.println("Iniciando chat...");
			while(true){	
				String message = chat.nextLine();
				output.println("Remote: "+message);
				output.flush();
				
				if(input.hasNext()){
				  System.out.println(input.nextLine());
			  }
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Erro na conexão");
		}
	}
	
	public static void main(String[] args) throws Exception{
		Client client = new Client(new Socket("localhost",1234));
		new Thread(client).start();
	}
}