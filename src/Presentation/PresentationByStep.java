package Presentation;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class PresentationByStep {
	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		final int STEP_BITRATE = 100;
		final int LOWEST_BITRATE = 100;
		final int HIGHEST_BITRATE = 5000;
		final int SEGMENT_DURATION = 2;
		
		FileWriter outBatFile = new FileWriter("Output\\Presentation.bat");
		FileWriter outTxtFile = new FileWriter("Output\\Presentation.txt");
		PrintWriter outBatStream = new PrintWriter(outBatFile);
		PrintWriter outTxtStream = new PrintWriter(outTxtFile);
		
	    for (int i = LOWEST_BITRATE; i <= HIGHEST_BITRATE; i+=STEP_BITRATE) {
	    	int dataSize = i * 1000 / 8 * SEGMENT_DURATION;
	    	outBatStream.println("fsutil file createnew " + "Presentation\\"+i+" "+dataSize);
	    	outTxtStream.println(i + "\t" + dataSize);
	    }
		outBatStream.close();
		outTxtStream.close();
	}

}
