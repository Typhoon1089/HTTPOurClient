package Client;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import AdaptationLogic.*;
import EstimationLogic.EstimationLogic;

import sun.net.www.MessageHeader;

public class Downloader extends Thread{
	// setup mode
	private enum Streaming {
	    LIVE, VOD
	}
	private enum Algorithm {
		AGGRESSIVE, BERLIN, FESTIVE, FINLAND,  
		GUIDING_TREE, DEVIATION_TREE, DEVIATION_TREE_JND, DEVIATION_TREE_UP, 
		VOD_TRELLIS, 
		LIVE_AGGRESSIVE
	}
	private final Streaming MODE = Streaming.LIVE;
	private final Algorithm ALGORITHM = Algorithm.AGGRESSIVE;
	public boolean PRINT = false;
	
	// local variable
	private long fragSize;
	private long startRequestTime, startReceiveTime, finishReceiveTime;
	private long finishAdapTime;
	private long startDownloadProcess;
	
	// input; after adaptation
	private String url;
	private long delayBeforeDownload;
	
	// output; after download finish
	private double segmentThrp, dataThrp;
	private long totalDownloadTime, dataDownloadTime, RTT;
	
	private int currentDownloadSegment;
	
	// for print
	private boolean writeDownloadInfoTitleFrag = false;	
	private long curBuffer;
	private long revSizeInByte;
	
	public Buffer buffer;
	public AdaptationLogic adaptationLogic;
	public EstimationLogic estimationLogic;
	public Manifest manifest;
	public Player player;

	public Downloader() {
		manifest = Manifest.getInstance();
		buffer = Buffer.getInstance();
		estimationLogic = new EstimationLogic(this);

		switch (ALGORITHM) {
			case AGGRESSIVE:
				adaptationLogic = (AdaptationLogic)(new AggressiveAlgorithm(this));
				break;
			case BERLIN:
				adaptationLogic = (AdaptationLogic)(new BerlinAlgorithm(this));
				break;
//			case FESTIVE:
//				adaptationLogic = (AdaptationLogic)(new FestiveAlgorithm(this));
//				break;
//			case FINLAND:
//				adaptationLogic = (AdaptationLogic)(new FinlandAlgorithm(this));
//				break;
//				
//			case GUIDING_TREE:
//				adaptationLogic = (AdaptationLogic)(new GuidingTreeAlgorithm(this));
//				break;
//			case DEVIATION_TREE:
//				adaptationLogic = (AdaptationLogic)(new DeviationTreeAlgorithm(this));
//				break;
//			case DEVIATION_TREE_JND:
//				adaptationLogic = (AdaptationLogic)(new DeviationTreeJNDAlgorithm(this));
//				break;
//			case DEVIATION_TREE_UP:
//				adaptationLogic = (AdaptationLogic)(new DeviationTreeUpAlgorithm(this));
//				break;
//	
//			case VOD_TRELLIS:
//				adaptationLogic = (AdaptationLogic)(new VoDTrellis(this));
//				break;
//				
//			case LIVE_AGGRESSIVE:
//				adaptationLogic = (AdaptationLogic)(new LiveAggressive(this));
//				break;
		}
	}

	public void run(){
		try{
			ClientSocket socket = new ClientSocket(manifest.url_base);
			
			// adaptationLogic.START_SEGMENTS => free download, don't play
			if (adaptationLogic.startsegments > 0) {
				revSizeInByte = 0;
				startDownloadProcess = System.currentTimeMillis();
				for(currentDownloadSegment = 0; currentDownloadSegment < adaptationLogic.startsegments; currentDownloadSegment++){
					url = adaptationLogic.getUrl(currentDownloadSegment);// get url for the next request using aggressive algorithm
					downloadFrag(socket, currentDownloadSegment);		// buffer here is if play
				}
				buffer.setBufferSize(adaptationLogic.startsegments * manifest.FRAGMENT_DURATION);	// restore buffer because don't play
			}
			
			// Adaptation - Delay - Download media segments
			revSizeInByte = 0;
			startDownloadProcess = System.currentTimeMillis();
			finishReceiveTime = 0;
			for(currentDownloadSegment = (int)adaptationLogic.startsegments; currentDownloadSegment < manifest.FRAGMENT_INDEX_MAX; currentDownloadSegment++){
				// get url
				url = adaptationLogic.getUrl(currentDownloadSegment);// get url for the next request, calculate the Delay time based on the last segment
				
				// Video on demand
				if (MODE == Streaming.VOD) {
					finishAdapTime = System.currentTimeMillis() - startDownloadProcess;
					delayBeforeDownload = adaptationLogic.getDelayBeforDownTime(currentDownloadSegment);
					if (finishAdapTime - finishReceiveTime < delayBeforeDownload)
						Thread.sleep(delayBeforeDownload - (finishAdapTime - finishReceiveTime));
				// Live-Streaming
				} else if (MODE == Streaming.LIVE) {
					if (buffer.isBufferUpperOpt(1.00))
						delayBeforeDownload = buffer.getBufferSize()-buffer.getBufOptThreshold();
					else
						delayBeforeDownload = 0;
					Thread.sleep(delayBeforeDownload);
				}
				
				// download & update
				downloadFrag(socket, currentDownloadSegment);
			}
			
		}
		catch(Exception e) {e.printStackTrace();}
	}

	public int byteCount = 0;
	synchronized public void downloadFrag(ClientSocket socket, int index){
		try{
			MessageHeader response = new MessageHeader();
			PrintWriter opw = new PrintWriter(socket.os,false);
			byte[] buf = new byte[1024];
			byteCount = 0;
			
			// Send GET request
			startRequestTime = System.currentTimeMillis() - startDownloadProcess;
			sendGETRequest(socket, url, opw);
									
			// Receive data
			socket.is.read();
			startReceiveTime = System.currentTimeMillis() - startDownloadProcess;
			response.parseHeader(socket.is);
			
			// Read data from system buffer
			System.out.println("###Downloading Fragment(" + index + ")");
			fragSize = Integer.parseInt(response.findValue("content-length"));
			while(byteCount <= fragSize - 1024){
				byteCount += socket.is.read(buf);
			}
			int remainByte = (int) (fragSize - byteCount);
			while(remainByte > 0){
				remainByte -= socket.is.read(buf, 0, remainByte);
			}
			finishReceiveTime = System.currentTimeMillis() - startDownloadProcess;
			//System.out.println("^");
			
			// Update buffer
			buffer.increaseBufferSize(manifest.FRAGMENT_DURATION);
			
			// Calculate paramater
			dataDownloadTime = finishReceiveTime - startReceiveTime;
			totalDownloadTime = finishReceiveTime - startRequestTime;
			RTT = startReceiveTime - startRequestTime;
			segmentThrp = (fragSize * 8 / 1000) / ((double)totalDownloadTime/1000);
			dataThrp = (fragSize * 8 / 1000) / ((double)dataDownloadTime/1000);
						
			curBuffer = buffer.getBufferSize();
			revSizeInByte += fragSize;
			
			// Output
			updateAdaptationParameter(index);
			printDownloadInfo(index);
			writeDownloadInfo(index);
		} catch(Exception e) {
			System.out.println("Exception happened!");
			System.out.println("URL =" + url);
			e.printStackTrace();
		}
	}
	
	private void sendGETRequest(ClientSocket socket, String url, PrintWriter opw){
		opw.print("GET " + url + " HTTP/1.1\r\n");
		opw.print("User-Agent: HTTPClient\r\n");
		opw.print("Host: " + socket.hostName + "\r\n");         
		opw.print("Accept: text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2\r\n");
		opw.print("Connection: keep-alive\r\n");
		opw.print("\r\n");
		opw.flush();  
	}
	
	private void updateAdaptationParameter(int index) {
		adaptationLogic.setSegmentThrp(index, segmentThrp);
		adaptationLogic.setTotalDownloadTime(index, totalDownloadTime);
		adaptationLogic.setFragSize(index, fragSize);
		estimationLogic.setRTT(index, RTT);
		estimationLogic.setSegmentThrp(index, segmentThrp);
	}	

	private void printDownloadInfo(int index){
		if (PRINT) {
			System.out.println("#Finish Time:\t" + (float)(System.currentTimeMillis() - startDownloadProcess)/1000);
			System.out.println("$Bitrate    :\t" + adaptationLogic.getSelectedBitrate(index) + " Kbps");
			System.out.println("\t-DelayBeforeDownload = " + (float)delayBeforeDownload / 1000 + " s");
			System.out.println("\t-url = " + url);
			System.out.println("\t-RequestTime: " + (float) RTT / 1000 + " s");
			System.out.println("\t-DataDownloadTime: " + (float)dataDownloadTime / 1000 + " s");
			System.out.println("\t-TotalDowloadTime: " + (float)totalDownloadTime / 1000+ " s");			
			System.out.println("\t-FragmentSize: " + fragSize + " Bytes");
			System.out.println("\t-SegmentThroughput: " + (float)segmentThrp + " Kbps");
			System.out.println("\t-DataThroughput: " + (float)dataThrp + " Kbps");
			System.out.println();
		}
	}

	private void writeDownloadInfo(int index)throws IOException{
		if(!writeDownloadInfoTitleFrag){
			writeDownloadInfoTitleFrag = true;
			FileWriter fstream = new FileWriter("ThroughputResult.txt");
			PrintWriter out = new PrintWriter(fstream);
			out.println("Time\tSegmentThrp\tEstimateThrp\tBitrate\tBuffer\tData\tRTT\tDataTm\tDelayTm");
			out.close();
		}
		FileWriter fstream = new FileWriter("ThroughputResult.txt",true);
		PrintWriter out = new PrintWriter(fstream);
		if (index == adaptationLogic.startsegments && adaptationLogic.startsegments > 0) {
			out.println();
			out.println("Time\tSegmentThrp\tEstimateThrp\tBitrate\tBuffer\tData\tRTT\tDataTm\tDelayTm");
		}
		out.printf("%.1f\t%f\t%f\t%d\t%.1f\t%d\t", (float)finishReceiveTime/1000, segmentThrp, estimationLogic.getEstimatedThroughput(index), adaptationLogic.getSelectedBitrate(index) ,(float)curBuffer/1000, revSizeInByte/1024);
		out.printf("%.3f\t%.3f\t%.3f\t", (float)RTT/1000, (float)dataDownloadTime/1000, (float)delayBeforeDownload/1000);
		out.println();
		out.close();
	}

	/*
	 * ******************************************************************************************************
	 * Set & Get
	 */
	
	public int getCurrentDownloadSegment() {
		return currentDownloadSegment;
	}
	public double getSegmentThrp() {
		return segmentThrp;
	}
	public double getDataThrp () {
		return dataThrp;
	}
	public long getTotalDownloadTime() {
		return totalDownloadTime;
	}
	public long getDataDownloadTime() {
		return dataDownloadTime;
	}
	public double getRTT() {
		return RTT;
	}
	public long getStartDownloadTime() {
		return startDownloadProcess;
	}
	
}

