/*
 * Sep-7
 */
package AdaptationLogic;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import Client.Downloader;
import Client.Scenario;

public class WiLoAlgorithm extends AdaptationLogic{
	private double MARGIN 		= Scenario.getInstance().methodMargin;
	private long STARTSEGMENTS 	= Scenario.getInstance().methodStartSegments;
	private int START_BITRATE 	= Scenario.getInstance().methodStartBitrate;
	
	public WiLoAlgorithm(Downloader downloader) {
		super(downloader);
		
		buffer.setBufOptThreshold(Scenario.getInstance().methodBufOptThreshold);
		
		margin = 0;
		if (STARTSEGMENTS == -1)
			startsegments = buffer.getBufOptThreshold() / manifest.FRAGMENT_DURATION;
		else if (STARTSEGMENTS == 0) {
			buffer.setBufferSize(Scenario.getInstance().methodStartBuffer);
			selectedBitrates[0] = START_BITRATE;
		}
		
		if (STARTSEGMENTS == -1) {	// need to revise for this case
			refBuf = 0;
			upperBuf = (long) (refBuf + 10000 <= 0.99 * buffer.getBufOptThreshold() ? refBuf + 10000 : 0.99 * buffer.getBufOptThreshold());
			lowerBuf = (long) (0.8 * refBuf <= 0.64 * buffer.getBufOptThreshold() ? 0.8 * refBuf : 0.64 * buffer.getBufOptThreshold());	
		} else {
			refBuf = Scenario.getInstance().methodStartBuffer;
			smoothedBuf[0] = Scenario.getInstance().methodStartBuffer;
			upperBuf = upperBuf < smoothedBuf[0] ? smoothedBuf[0] : upperBuf;
			lowerBuf = (long) (lowerBuf < 0.8 * smoothedBuf[0] ? 0.8 * smoothedBuf[0] : lowerBuf);
		}
	}

	public enum State {
		startup,
//		panic,
		recovery,
		steady
	}
	private State state = State.startup;
	
	double ALPHA = 0.5;
	
	double minThrp, smoothedThrp, stdThrp, estThrp;
	double downloadRatio;
	double[] thrpSample = new double[manifest.FRAGMENT_INDEX_MAX-1];	
	
	long refBuf, upperBuf, lowerBuf;
	long[] smoothedBuf = new long[manifest.FRAGMENT_INDEX_MAX];
	long[] buf = new long[manifest.FRAGMENT_INDEX_MAX-1];
	long[] upBuf = new long[manifest.FRAGMENT_INDEX_MAX];
	
	int lastChangeIndex = 1;
	
	long startTime = 0;
	long[] time = new long[manifest.FRAGMENT_INDEX_MAX];
	
	final double UNLIMITED = 20000000;
	
	final long OBTAINED_THRP_DURATION = 60000;
	final int OBTAINED_BUF_SEGs = 3;
	
	int getIndexByTime(long curTime) {
		int index;
		for (index = 0; index < manifest.FRAGMENT_INDEX_MAX; index++)
			if (time[index] > curTime) break;
		return index;
	}
	
	void updateThroughputStats(int curIndex) {
		int startThrpIndex = getIndexByTime(time[curIndex] - OBTAINED_THRP_DURATION);
		// average and minimum throughput
		double sumThrps = 0;
		minThrp = UNLIMITED;
		for (int i = startThrpIndex; i < curIndex; i++) {
			sumThrps += thrpSample[i];
			if (thrpSample[i] < minThrp) 
				minThrp = thrpSample[i];
		}
		smoothedThrp = sumThrps / (curIndex - startThrpIndex);
		
		// standard deviation
		double sumErrors = 0;
		for (int i = startThrpIndex; i < curIndex; i++) {
			sumErrors += (thrpSample[i] - smoothedThrp) * (thrpSample[i] - smoothedThrp);
		}
		stdThrp = Math.sqrt(sumErrors / (curIndex - startThrpIndex));
		
		// estimated throughput
		estThrp = smoothedThrp - 0.5 * stdThrp;
	}
	
	void updateBufferLevelStats(int curIndex) {
		// smoothed buffer level
		int startBufIndex = curIndex - OBTAINED_BUF_SEGs >= 0 ? curIndex - OBTAINED_BUF_SEGs : 0;
		double sumBufs = 0;
		for (int i = startBufIndex; i < curIndex; i++) {
			sumBufs += buf[i];
		}
		smoothedBuf[curIndex] = (long)(sumBufs / (curIndex - startBufIndex));
		
		// upperBuf and lowerBuf if the smoothed buffer level increases
		if (smoothedBuf[curIndex] > smoothedBuf[curIndex-1]) {
			upperBuf = upperBuf < smoothedBuf[curIndex] ? smoothedBuf[curIndex] : upperBuf;
			lowerBuf = (long) (lowerBuf < 0.8 * smoothedBuf[curIndex] ? 0.8 * smoothedBuf[curIndex] : lowerBuf);
			if (upperBuf > buffer.getBufOptThreshold()) upperBuf = buffer.getBufOptThreshold();
//			System.out.println("Smooth " + smoothedBuf[curIndex] + " " + upperBuf + " " + lowerBuf + " Smoothed avg " + smoothedThrp);
		}
		
		// download time ratio
		if (curIndex > 0)
			downloadRatio = totalDownloadTimes[curIndex-1]/(double)manifest.FRAGMENT_DURATION;
		
		// for monitoring
			upBuf[curIndex] = upperBuf;
	}

	final long HANGOVER_TIME = 15000;
	final long HANGOVER_TIME_FOR_STARTUP = 5000;
	long hangoverIndexTimer = HANGOVER_TIME_FOR_STARTUP;
	int hangoverIndex;
	
	void resetHangoverTimer(int curIndex) {
		if (state == State.startup)
			hangoverIndexTimer = HANGOVER_TIME_FOR_STARTUP;
		else if (state == State.recovery) 
			hangoverIndexTimer = 30000;
		else if (state == State.steady) 
			hangoverIndexTimer = HANGOVER_TIME;
		hangoverIndex = curIndex;
	}
	
	boolean isThereAPanic(long curBuf, long smoothedBuf, double downloadRatio) {
		return (curBuf < 5000 || smoothedBuf < 0.5 * lowerBuf || downloadRatio >= 2.5);
	}
	
	@Override
	void algorithm (int index){
		curSegment = index;
		int curBitrate = selectedBitrates[index-1];
		
		if (startTime == 0) {
			startTime = System.currentTimeMillis();
			for (int i = 0; i < index; i++) 
				time[i] = 0;
		}
		time[index] = System.currentTimeMillis() - startTime;
		
		long curBuf = buffer.getBufferSize();
		double curThrp = segmentThrps[index-1];
		
		if (index > 0) {
			buf[index-1] = curBuf;
			thrpSample[index-1] = segmentThrps[index-1];
		}
		
		if (index == 4) 
			index += 0;
		
		// Update smoothed buffer, upper and lower buffer thresholds
		updateBufferLevelStats(index);
		
		// Update smoothed throughput, throughput estimate, download ratio
		updateThroughputStats(index);
		
		// check if the hangover timer need to be reset because of fullness
		if (smoothedBuf[index] <= upperBuf) {
			// check 
			boolean forgiven = false;
			// smoothedBuf[i] >= upperBuf at least 1 out of 3 downloads for the duration of the hangover time
			for (int start_duration = hangoverIndex; start_duration < index-3; start_duration++) {
				int finish_duration =  start_duration + 3 >= index ? index : start_duration + 3;
				forgiven = false;
				for (int i = start_duration; i < finish_duration; i++)
					if (smoothedBuf[i] >= upperBuf) 
						forgiven = true;
				if (!forgiven) break;
			}
			// more than 2 download in a row
			for (int i = hangoverIndex; i < index-2; i++)
				if (smoothedBuf[i] < upperBuf && smoothedBuf[i+1] < upperBuf)
					forgiven = false;
			// reset timer if not forgive
			if (!forgiven) 
				resetHangoverTimer(index);
		}
		
		// reset the hangover timer if the bandwidth is too low.
		if (estThrp < manifest.nextBitrate(curBitrate)) 
			resetHangoverTimer(index);
		
		// rate increase logic		
		if (smoothedBuf[index] > upperBuf) {
			if (smoothedBuf[index] < manifest.nextBitrate(curBitrate)) {
				selectedBitrates[index] = curBitrate;
			} else if (time[index] - time[hangoverIndex] < hangoverIndexTimer) {
				selectedBitrates[index] = curBitrate;
			} else if (curThrp < estThrp) {
				selectedBitrates[index] = curBitrate;
			} else {
				// one-step increase
				selectedBitrates[index] = manifest.nextBitrate(curBitrate);
				// fast increase
				if (selectedBitrates[index] < manifest.selectBitrate(minThrp)) 
					selectedBitrates[index] = manifest.selectBitrate(minThrp);
				// good network conditions
				int count = 0;				
				for (int i = lastChangeIndex; i < index; i++)
					if (buf[i] <= upperBuf) count++;
				if (count <= 2 && selectedBitrates[index] < manifest.selectBitrate(estThrp)) 
					selectedBitrates[index] = manifest.selectBitrate(estThrp);
				// in Startup state, 1-step rule is not enforced
				if (state == State.startup) 
					selectedBitrates[index] = manifest.selectBitrate(estThrp);
			}
		// rate decrease logic
		} else if (smoothedBuf[index] <= lowerBuf || isThereAPanic(curBuf, smoothedBuf[index], downloadRatio)){
			// if panic condition exists
			if (isThereAPanic(curBuf, smoothedBuf[index], downloadRatio)) {
				// set the smoothed throughput
				estThrp = smoothedThrp - 2.0 * stdThrp;
				if (estThrp < minThrp) 
					estThrp = minThrp;
				if (curBuf < 5000 ) {
					estThrp = estimatedThrp[index]; // cai nay tu them vao! neu khong thi khong chay duoc
					// replacing the values
					int startThrpIndex = getIndexByTime(time[index] - OBTAINED_THRP_DURATION);
					for (int i = startThrpIndex; i < index; i++)
						thrpSample[i] = estThrp;
				}
			}
			// decrease the bitrate
			selectedBitrates[index] = manifest.selectBitrate(estThrp);
			// if the throughput is higher than current bitrate, decrease one step to increase the buffer level 
			if (estThrp > curBitrate)
				selectedBitrates[index] = manifest.preBitrate(curBitrate);
		} else {
			selectedBitrates[index] = curBitrate;
		}
		
		// if the bitrate changed, update the thresholds
		if (selectedBitrates[index] != curBitrate) {
			lastChangeIndex = index; 
			resetHangoverTimer(index);
			refBuf =  curBuf;
			upperBuf = (long) (refBuf + 10000 <= 0.99 * buffer.getBufOptThreshold() ? refBuf + 10000 : 0.99 * buffer.getBufOptThreshold());
			lowerBuf = (long) (0.8 * refBuf <= 0.64 * buffer.getBufOptThreshold() ? 0.8 * refBuf : 0.64 * buffer.getBufOptThreshold());
			System.out.println("Change " + upperBuf + " " + lowerBuf);
		}
		
		// change the state
		if (state == State.startup && time[index] < OBTAINED_THRP_DURATION) {
			// stay in startup state
		} else if (state == State.startup && (time[index] - time[lastChangeIndex] > 23000)) {
			state = State.steady;
		} else if (state != State.recovery && isThereAPanic(curBuf, smoothedBuf[index], downloadRatio)) {
			state = State.recovery;
		} else if (state == State.recovery && (time[index] - time[lastChangeIndex] > 50000)) {
			state = State.steady;
		}
		
		// delay if exceed the buffer size
		long delaytime = curBuf - Math.max(curBuf - manifest.FRAGMENT_DURATION, buffer.getBufOptThreshold());
		delayBeforeDownTimes[index] = (delaytime > 0) ? delaytime : 0; 
		
		// store the low threshold
		storedLowThreshold[index] = lowerBuf;
		if (index == manifest.FRAGMENT_INDEX_MAX-1)
			try {
				writeMoreData();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	private double[] storedLowThreshold = new double[manifest.FRAGMENT_INDEX_MAX];
	private void writeMoreData() throws IOException{
		int index = 10;
		String adaptationResultsFile = "WiLo_c" + index +".txt";
		while (true) {
			File f = new File(adaptationResultsFile);
			if(f.exists() && !f.isDirectory()) { index++; adaptationResultsFile = "WiLo_c" + index +".txt";}
			else break;
		}
		FileWriter fstream = new FileWriter(adaptationResultsFile);
		PrintWriter out = new PrintWriter(fstream);
		for (int i = 0; i < manifest.FRAGMENT_INDEX_MAX; i++) {
			out.println(storedLowThreshold[i]);
		}
		out.close();
	}

}