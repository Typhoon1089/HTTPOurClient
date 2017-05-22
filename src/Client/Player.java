package Client;

import java.util.Timer;
import java.util.TimerTask;

public class Player extends Thread{
	
	private final long INTERVAL = 100;

	private final byte PLAY_STATE         = 1;
	private final byte BUFFERING_STATE    = 2;
	private       byte curState           = BUFFERING_STATE;

	private Buffer buffer;
	
	private static Player instance = new Player();
	public static Player getInstance () {
		return instance;
	}

	public Player () {
		buffer = Buffer.getInstance();
	} 

	public void run(){
		while(true){
			switch(curState){
			case PLAY_STATE:
				playState();
				curState = BUFFERING_STATE;
				break;
			case BUFFERING_STATE:
				bufferingState();
				curState = PLAY_STATE;
				break;
			default:    
			}
		}   
	}

	public void playState(){

		System.out.println("\n**** Player has entered into Play State ****\n");

		final Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run(){
				buffer.decreaseBufferSize (INTERVAL) ;
			}        
		},0, INTERVAL); 

		while (true){               
			/** if Buf is empty then stop playing */
			if ( buffer.isBufferEmpty() ) {
				System.out.println("\n**** Player has entered into Buffering State ****\n");

				timer.cancel();
				break;
			}        
			/** Do not leave the while loop with nothing, it will increase the CPU usage 25% */
			try {Thread.sleep(1);
			} catch (InterruptedException ex) {}            
		} 
	}       

	public void bufferingState(){
		/** Wait until Bufsize > BUFFER_UNDERRUN_LENGTH then resume playing */
		while ( buffer.isBufferUnderRun() ){
			/** Do not leave the while loop with nothing, it will increase the CPU usage 25% */
			try {Thread.sleep(1);
			} catch (InterruptedException ex) {}
		} 
	}    

}
