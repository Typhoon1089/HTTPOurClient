package EstimationLogic;

import Client.Downloader;
import Client.Manifest;

public class EstimationLogic {
	public int EST_ALGORITHM = 0;
	public boolean PRINT = false;
	
	private Manifest manifest;
		
	private int currentSegment; 
	private double[] segmentThrps;
	private long[] RTT;
	
	private double[] estimatedSegmentThrps;

	public EstimationLogic(Downloader downloader){
		manifest = Manifest.getInstance();
		init();
	}
	
	/*
	 * Initialize 
	 */
	private void init() {
		segmentThrps = new double[manifest.FRAGMENT_INDEX_MAX];
		RTT 		 = new long[manifest.FRAGMENT_INDEX_MAX];
		
		estimatedSegmentThrps = new double [manifest.FRAGMENT_INDEX_MAX];
	}
	
	/*
	 * Throughput Estimation
	 */
	public double throughputEstimation(int index) {
		currentSegment = index;
		switch (EST_ALGORITHM) {
			case 0:
				aggressiveAlgorithm(); 
				break;
		}
		return estimatedSegmentThrps[currentSegment];
	}
	
	public double getThroughputEstimation(int index) {
		return estimatedSegmentThrps[currentSegment];
	}
	
	private void aggressiveAlgorithm(){
		if(currentSegment == 0)
			estimatedSegmentThrps[0] = 0;
		else
			estimatedSegmentThrps[currentSegment] = segmentThrps[currentSegment-1];
	}
	
	
	/*
	 * *********************************************************************************************************
	 */
	/*
	 * get & set
	 */
	public void setSegmentThrp(int index, double _segmentThrp){
		segmentThrps[index] = _segmentThrp;
	}
	public void setRTT(int index, long _RTT) {
		RTT[index] = _RTT;
	}
	public double getEstimatedThroughput(int index) {
		return estimatedSegmentThrps[index];
	}
}
