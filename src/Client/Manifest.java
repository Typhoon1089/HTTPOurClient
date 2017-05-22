package Client;

public class Manifest {
	public int   BITRATE_INDEX_MAX  ;
	public long  FRAGMENT_DURATION  ;
	public long  VIDEO_DURATION;
	public int   FRAGMENT_INDEX_MAX ;
	public int   STEP_SIZE;

	public String   url_base ;
	public int[]    bitrate_array ;
	public String[] url_bitrate   ;
	public String[] url_fragment  ;

	public Manifest(){
		BITRATE_INDEX_MAX = 15;
		FRAGMENT_DURATION = 2*1000;
		VIDEO_DURATION = 420*1000;
		
		FRAGMENT_INDEX_MAX = (int) (VIDEO_DURATION / FRAGMENT_DURATION);
		bitrate_array = new int[BITRATE_INDEX_MAX];
		url_bitrate = new String[BITRATE_INDEX_MAX];
		url_fragment = new String[FRAGMENT_INDEX_MAX];
		
//		bitrate_array[0] = 222;
//		bitrate_array[1] = 260;
//		bitrate_array[2] = 322;		
//		bitrate_array[3] = 427;
//		bitrate_array[4] = 550;
//		bitrate_array[5] = 640;
//		bitrate_array[6] = 773;
//		bitrate_array[7] = 1038;
//		bitrate_array[8] = 1495;
//		bitrate_array[9] = 3000;
//		url_base = "http://127.0.0.1/HTTPStreaming/bitrate_jnd-3M-1.5_football/";
		
//		bitrate_array[0] = 62;
//		bitrate_array[1] = 87;
//		bitrate_array[2] = 108;		
//		bitrate_array[3] = 144;
//		bitrate_array[4] = 202;
//		bitrate_array[5] = 306;
//		bitrate_array[6] = 482;
//		bitrate_array[7] = 1500;
//		url_base = "http://127.0.0.1/HTTPStreaming/bitrate_jnd-3M-1.5_harbour/";
		
//		bitrate_array[0] = 209;
//		bitrate_array[1] = 235;
//		bitrate_array[2] = 260;		
//		bitrate_array[3] = 296;
//		bitrate_array[4] = 341;
//		bitrate_array[5] = 427;
//		bitrate_array[6] = 513;
//		bitrate_array[7] = 578;
//		bitrate_array[8] = 640;
//		bitrate_array[9] = 727;
//		bitrate_array[10] = 861;
//		bitrate_array[11] = 1038;
//		bitrate_array[12] = 1350;
//		bitrate_array[13] = 1641;
//		bitrate_array[14] = 3000;
//		url_base = "http://127.0.0.1/HTTPStreaming/bitrate_jnd-3M/";
		
//		String ip = "192.168.9.31";	String test = "bitrate_256_256_4096/";
//		for (int i = 0; i < BITRATE_INDEX_MAX; i++) {
//			bitrate_array[i] = (i+1) * 256;
//		}
		
		String ip = "192.168.9.31";	String test = "bitrate_100_100_5000/";
		for (int i = 0; i < BITRATE_INDEX_MAX; i++) {
			bitrate_array[i] = (i+1) * 200;
		}
		
		url_base = "http://" + ip + "/HTTPStreaming/" + FRAGMENT_DURATION/1000 + "s/" + test;
		for(int i=0; i<BITRATE_INDEX_MAX; i++)
			url_bitrate[i] = Integer.toString(bitrate_array[i]);
		for(int i=0; i<FRAGMENT_INDEX_MAX; i++)
			url_fragment[i] = "";    	
		
	}	
	
	private static Manifest instance = new Manifest();  
	
	public static Manifest getInstance() {
		return instance;
	}
	
	public boolean isMaxBitrate(int bitrate) {
		return (bitrate == bitrate_array[BITRATE_INDEX_MAX-1]);
	}
	
	public boolean isMinBitare(int bitrate) {
		return (bitrate == bitrate_array[0]);
	}
	
	public long getFragSize(int bitrate) {
		return (long)bitrate * 1000 / 8 * (FRAGMENT_DURATION / 1000);
	}
	
//	public int selectIndexbyBitrate (int cBitrate) {
//		int i=BITRATE_INDEX_MAX-1;
//		while(i>0 && bitrate_array[i]>cBitrate) i--;
//		return i;
//	}
	public int getIndexbyBitrate (int cBitrate) {
		int i=BITRATE_INDEX_MAX-1;
		while(i>0 && bitrate_array[i]!=cBitrate) i--;
		return i;
	}
	
	public int nextBitrate(int cBitrate){
		int i=0;
		while(i<BITRATE_INDEX_MAX-1 && bitrate_array[i]<=cBitrate) i++;
		return bitrate_array[i];
	}
	public int preBitrate(int cBitrate){
		int i=BITRATE_INDEX_MAX-1;
		while(i>0 && bitrate_array[i] >= cBitrate) i--;
		return bitrate_array[i];
	}
	public int selectBitrate(double Thrp){ // selecting the bitrate that below than a specific throughput value
		int i=BITRATE_INDEX_MAX-1;
		while(i>0 && bitrate_array[i]>Thrp) i--;
		return bitrate_array[i];
	}
	public int roundBitrate(double Thrp){
		int pre = selectBitrate(Thrp);
		int next = nextBitrate(pre);
		if (next - Thrp < Thrp - pre)
			return next;
		else 
			return pre;
	}
	public int ceilBitrate(double Thrp){
		int pre = selectBitrate(Thrp);
		return nextBitrate(pre);
	}
}

