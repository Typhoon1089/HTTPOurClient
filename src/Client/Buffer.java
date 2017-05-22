package Client;

public class Buffer {
 		private long _bufLen = 0 * 1000;
 		private long _bufRunThreshold = 100;
 		private long _bufMinThreshold = 99 * 1000;
 		private long _bufLowThreshold = 99 * 1000;
 		private long _bufOptThreshold = 16 * 1000;	// default
 		private long _bufHighThreshold = 0 * 1000;
 		private long _bufMaxThreshold = _bufOptThreshold;
 		
 		private static Buffer instance = new Buffer();
 		
 		public static Buffer getInstance () {
 			return instance;
 		}
 		
 		// auto-decrease
	    private final Object lengthLock = new Object();
	    
	    public long getBufferSize() 
	    {
	        synchronized (lengthLock) {
	            return _bufLen;
	        }    
	    } 
	    
	    public void setBufferSize(long _buf) 
	    {
	        _bufLen = _buf;
	    }
	    
	    public void displayBufferSize() 
	    {
	        System.out.println("Curent Buffer size: " + (float)getBufferSize() + " ms");
	    }
	    
	    public void increaseBufferSize (long n) 
	    {
	        synchronized (lengthLock){
	        	System.out.println("#Increased buffer size from " + getBufferSize() + "ms to " + (getBufferSize() + n) + "ms");
	            _bufLen += n;
	        }
	    }
	    
	    public void decreaseBufferSize (long n) 
	    {
	        synchronized (lengthLock){
	            if (_bufLen > 0) 
	                _bufLen -= n;
	        }
	    }
	    
	    public boolean isBufferUnderOpt(double ratio)
	    {
	        return (getBufferSize() < _bufOptThreshold * ratio);
	    }
	    
	    public boolean isBufferUpperOpt(double ratio)
	    {
	        return (getBufferSize() > _bufOptThreshold * ratio);
	    }
	    
	    public boolean isBufferUnderRun()
	    {
	        return (getBufferSize() < _bufRunThreshold);
	    }
	    
	    public boolean isBufferEmpty()
	    {
	        return (getBufferSize() <= 0F);
	    }

	    // get & set
	    public long getBufRunThreshold() {
	    	return _bufRunThreshold;
	    }
	    public void setBufRunThreshold (long _buf) {
	    	_bufRunThreshold = _buf;
	    }
	    public long getBufMinThreshold() {
	    	return _bufMinThreshold;
	    } 
	    public void setBufMinThreshold (long _buf) {
	    	_bufMinThreshold = _buf;
	    }
	    public long getBufLowThreshold() {
	    	return _bufLowThreshold;
	    }
	    public void setBufLowThreshold (long _buf) {
	    	_bufLowThreshold = _buf;
	    }
	    public long getBufOptThreshold () {
	    	return _bufOptThreshold;
	    }
	    public void setBufOptThreshold (long _buf) {
	    	_bufOptThreshold = _buf;
	    }
	    public long getBufHighThreshold () {
	    	return _bufHighThreshold;
	    }
	    public void setBufHighThreshold (long _buf) {
	    	_bufHighThreshold = _buf;
	    }
	    public long getBufMaxThreshold () {
	    	return _bufMaxThreshold;
	    }
	    public void setBufMaxThreshold (long _buf) {
	    	_bufMaxThreshold = _buf;
	    }

}

