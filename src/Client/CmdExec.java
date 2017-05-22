package Client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class CmdExec extends Thread{
	private String cmd;

	public CmdExec (String cmd){
		this.cmd = cmd;
	}

	public void run(){
		try {
			String s = null;
			Process p = Runtime.getRuntime().exec(cmd);

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
			BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));

			System.out.println("********************************************************");
			System.out.println("Batch File Start!");
			System.out.println("********************************************************");

			//read the output from the command
			System.out.println("Here is the standard output of the command:\n");
			while ((s = stdInput.readLine()) != null) {
				System.out.println(s);
			}

			// read any errors from the attempted command
			System.out.println("Here is the standard error of the command (if any):\n");
			while ((s = stdError.readLine()) != null) {
				System.out.println(s);            
			}  

			System.out.println("********************************************************");
			System.out.println("Batch File Finished!");
			System.out.println("********************************************************");             
		}
		catch (IOException e) {
			System.out.println("********************************************************");
			System.out.println("Batch File Exception!");
			System.out.println("********************************************************");  
			e.printStackTrace();
		} 
	}            

}
