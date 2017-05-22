package Client;
public class Client {

	/**
	 * @param args
	 * @throws InterruptedException 
	 */
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws InterruptedException {
		// DummyNet Script
		String testNo = "real1-500";
		System.out.println("########## Test : " + testNo);
		CmdExec cmdExec=new CmdExec("cmd /C start Output\\dummynet_script.bat");
		cmdExec.setDaemon(true);
		cmdExec.start();
		Thread.sleep(800);	// more than 1000ms waiting dummyNet
		
		// Initialize all elements
		Thread playerThread = new Thread(Player.getInstance());
		Downloader downloader = new Downloader();
		Thread downloaderThread = new Thread(downloader);
		
		downloaderThread.start();
		playerThread.start();
		
		// Finish working
		downloaderThread.join();
		playerThread.stop();
	}

}
