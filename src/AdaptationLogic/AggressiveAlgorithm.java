/*
 * Updated on May 22nd, 2017
 */

package AdaptationLogic;

import Client.Downloader;

public class AggressiveAlgorithm extends AdaptationLogic{
	public double MARGIN = 0.2;
	public long STARTSEGMENTS = 0;	// default when set = -1

	public AggressiveAlgorithm(Downloader downloader) {
		super(downloader);
		buffer.setBufOptThreshold(16000);
		buffer.setBufHighThreshold(buffer.getBufOptThreshold());
		margin = MARGIN;
		if (STARTSEGMENTS == -1)
			startsegments = buffer.getBufOptThreshold() / manifest.FRAGMENT_DURATION;
		else if (STARTSEGMENTS == 0) {
			buffer.setBufferSize(buffer.getBufOptThreshold());
			selectedBitrates[0] = 2600;
		} else {
			startsegments = STARTSEGMENTS; 
		}
			
	}

	@Override
	void algorithm (int index) {
		if (ThrpBasedCandidateBitrates[index] > selectedBitrates[index-1]) {
			selectedBitrates[index] = manifest.nextBitrate(selectedBitrates[index-1]);
		} else 
			selectedBitrates[index] = ThrpBasedCandidateBitrates[index];
		// delay if buffer < buffer_opt (by wait if download_time < Media_segment_time)
		long time = manifest.FRAGMENT_DURATION - totalDownloadTimes[index-1];
		delayBeforeDownTimes[index] = (!buffer.isBufferUnderOpt(1.0) && time>0) ? time : 0;
	}

}
