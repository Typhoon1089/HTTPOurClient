package DummyNet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class GenerateScript {
	/**
	 * @param args
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@SuppressWarnings("resource")
	public static void main(String[] args) throws NumberFormatException, IOException {
		final int LOWEST_TIME = 1;
		final int HIGHEST_TIME = 420;
		final int MAX_TIME = 2000;
		final int SMOOTH_SECOND = 2;
		
		int[] realBW = new int[MAX_TIME];
		double[] time =  new double[MAX_TIME];
		int count = 0;
		
		// read
		BufferedReader inSream = new BufferedReader(new FileReader("Input\\Bandwidth-1.txt"));
		{
			String sCurrentLine;
			while ((sCurrentLine = inSream.readLine()) != null) {
				time[count] = Double.parseDouble(sCurrentLine.split("\t")[0]);
				realBW[count] = ((int)Double.parseDouble(sCurrentLine.split("\t")[1]))/1000;
				count++;
			}
		}
		
		// smooth
		int[] smoothBW = new int[MAX_TIME];
		{
			int temp = (SMOOTH_SECOND - 1) / 2;
			for (int i = temp; i < count-temp; i++) {
				int total = 0;
				for (int j = i-temp; j<i-temp+SMOOTH_SECOND; j++) {
					total += realBW[j];
				}
				smoothBW[i] = (int)(total / SMOOTH_SECOND);
			}
		}
		
		// print
		FileWriter outBatFile = new FileWriter("Output\\dummynet_script.bat");
		FileWriter outTxtFile = new FileWriter("Output\\dummynet_script.txt");
		PrintWriter outBatStream = new PrintWriter(outBatFile);
		PrintWriter outTxtStream = new PrintWriter(outTxtFile);
		{
			outBatStream.println("@echo on");
			outBatStream.println("@set CYGWIN=nodosfilewarning");
			outBatStream.println("@ipfw -q flush");
			outBatStream.println("@ipfw -q pipe flush");
			outBatStream.println("ipfw add pipe 3 ip from any to any");
			outBatStream.println();
			
			int i = 0;
			while (time[i] < LOWEST_TIME) i++;
			while (time[i] <= HIGHEST_TIME) {
				outBatStream.println("ipfw pipe 3 config bw " + smoothBW[i] + "Kbit/s delay 15ms"); 
				if (i > 0)
					outBatStream.println("ping 1.1.1.1 -n 1 -w " + (int) ((time[i] - time[i-1]) * 1000) + " >NUL");
				else
					outBatStream.println("ping 1.1.1.1 -n 1 -w " + (int) (time[i] * 1000) + " >NUL");
				outBatStream.println();
				outTxtStream.println(time[i] + "\t" + smoothBW[i]);
				i++;
			}
		}
		outBatStream.close();
		outTxtStream.close();
	}

}
