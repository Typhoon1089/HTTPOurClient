/*
 * March 1st, 2015
 * time = ...
 */
package AdaptationLogic;

import Client.Downloader;
import Client.Scenario;

public class BerlinAlgorithm extends AdaptationLogic{
	private double MARGIN 		= Scenario.getInstance().methodMargin;
	private long STARTSEGMENTS 	= Scenario.getInstance().methodStartSegments;
	private int START_BITRATE 	= Scenario.getInstance().methodStartBitrate;
										// default when set = -1 ( will = buffer / segment time)
										// the number of segment with Aggressive Algorithm

	public BerlinAlgorithm(Downloader downloader) {
		super(downloader);
		
		buffer.setBufOptThreshold(Scenario.getInstance().methodBufOptThreshold);
		buffer.setBufHighThreshold(Scenario.getInstance().methodBufHighThreshold);
		buffer.setBufLowThreshold(Scenario.getInstance().methodBufLowThreshold);
		buffer.setBufMinThreshold(Scenario.getInstance().methodBufMinThreshold);

		margin = MARGIN;
		if (STARTSEGMENTS == -1)
			startsegments = buffer.getBufOptThreshold() / manifest.FRAGMENT_DURATION;
		else if (STARTSEGMENTS == 0) {
			buffer.setBufferSize(Scenario.getInstance().methodStartBuffer);
			selectedBitrates[0] = START_BITRATE;
		}
		
		MaxBitrate = new MaximumOfBitrate(downloader);
	}
	
	@SuppressWarnings("unused")
	private MaximumOfBitrate MaxBitrate;

	double alpha5 = 1 - Scenario.getInstance().methodMargin;	// dong vai tro nhu margin
	double useMARGIN = 1 - Scenario.getInstance().methodMargin;	// lieu co them margin vao Low~High khong????
	int deltaT = 1;			// * duration
	
	@Override
	void algorithm(int index) {
		
		double averageThroughput = 0;
		int start = 0;
		if (index > deltaT + 1)
			start = index-deltaT;
		double sum = 0;
		for (int i = start; i < index; i++)
			sum += segmentThrps[i];
		averageThroughput = sum / (index-start);
		System.out.println(averageThroughput);
		
		long curBuf = buffer.getBufferSize();
		selectedBitrates[index] = selectedBitrates[index-1];
		
		if (selectedBitrates[index-1] == 2000)
			index = index * 1;
		
		if (curBuf < buffer.getBufMinThreshold()) {
			selectedBitrates[index] = manifest.bitrate_array[0];
		} else if (curBuf < buffer.getBufLowThreshold()) {
			if (!manifest.isMinBitare(selectedBitrates[index-1]) && selectedBitrates[index-1] > segmentThrps[index-1] * useMARGIN) {
				selectedBitrates[index] = manifest.preBitrate(selectedBitrates[index-1]);
			}
		} else if (curBuf < buffer.getBufHighThreshold()) {
			if (manifest.isMaxBitrate(selectedBitrates[index-1]) || manifest.nextBitrate(selectedBitrates[index-1]) >= alpha5 * averageThroughput) {
				long time = curBuf - Math.max(curBuf - manifest.FRAGMENT_DURATION, buffer.getBufOptThreshold());
				delayBeforeDownTimes[index] = (time > 0) ? time : 0;
			}
		} else {
			if (manifest.isMaxBitrate(selectedBitrates[index-1]) || manifest.nextBitrate(selectedBitrates[index-1]) >= alpha5 * averageThroughput) {
				long time = curBuf - Math.max(curBuf - manifest.FRAGMENT_DURATION, buffer.getBufOptThreshold());
				delayBeforeDownTimes[index] = (time > 0) ? time : 0; 
			} else {
				selectedBitrates[index] = manifest.nextBitrate(selectedBitrates[index-1]);
				
			}
		}
	}

}
