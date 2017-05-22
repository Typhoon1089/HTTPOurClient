package AdaptationLogic;

import Client.Buffer;
import Client.Downloader;
import Client.Manifest;
import EstimationLogic.EstimationLogic;

/*
 *  ALGORITHM:
 */
public class AdaptationLogic {
	public double margin = 0.05;
	public long startsegments = 0;	// default when set = -1
	
	protected Manifest manifest;
	protected Buffer buffer;
	protected EstimationLogic estimationLogic;
		
	protected double[] segmentThrps;
	protected long[] totalDownloadTimes;
	protected long[] fragSize;
	
	protected double[] estimatedThrp;
	protected int[] ThrpBasedCandidateBitrates;
	protected int[] selectedBitrates;		//public for create 1 state.
	protected long[] delayBeforeDownTimes;
	
	protected int curSegment = -1;			//don't initialise
			
	public AdaptationLogic(Downloader downloader){
		buffer = downloader.buffer;
		manifest = downloader.manifest;
		estimationLogic = downloader.estimationLogic;
		init();
	}
	
	/*
	 * Initialize
	 */
	private void init() {
		totalDownloadTimes = new long[manifest.FRAGMENT_INDEX_MAX];
		segmentThrps = new double[manifest.FRAGMENT_INDEX_MAX];
		fragSize = new long[manifest.FRAGMENT_INDEX_MAX];
		
		estimatedThrp = new double[manifest.FRAGMENT_INDEX_MAX];
		ThrpBasedCandidateBitrates=new int[manifest.FRAGMENT_INDEX_MAX];
		selectedBitrates = new int[manifest.FRAGMENT_INDEX_MAX];
		delayBeforeDownTimes = new long[manifest.FRAGMENT_INDEX_MAX];
	}
	
	/*
	 * getBitrate - main Process
	 */
	public int getBitrate(int index) {
		estimatedThrp[index] = estimationLogic.throughputEstimation(index);
		ThrpBasedCandidateBitrates[index]=manifest.selectBitrate(estimatedThrp[index] * (1 - margin));
		
		if (index > startsegments) {
			algorithm(index);
		}  else if (index != 0) {
			selectedBitrates[index] = manifest.selectBitrate(segmentThrps[index-1] * (1 - margin));
		}
		return selectedBitrates[index];
	}
	
	void algorithm (int index) {
		curSegment = index;	//...
		System.out.println("-------> Prototype <--------");
	}	
	
	/*
	 * Set & Get methods
	 */
	
	public void setSegmentThrp(int index, double _segmentThrp){
		segmentThrps[index] = _segmentThrp;
	}
	public void setTotalDownloadTime(int index, long _totalDownloadTime) {
		totalDownloadTimes[index] = _totalDownloadTime;
	}
	public void setFragSize(int index, long _fragSize) {
		fragSize[index] = _fragSize;
	}
	
	public int getSelectedBitrate(int index){
		return selectedBitrates[index];
	}
	
	public String getUrl(int index) {  // method for determine the next request bitrate.
		return manifest.url_base + getBitrate(index) + manifest.url_fragment[index];
	}
	
	public long getDelayBeforDownTime(int index) {
		return delayBeforeDownTimes[index];
	}
	
}

