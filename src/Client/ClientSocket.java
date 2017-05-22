package Client;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.InetSocketAddress;
import java.net.Socket;

public class ClientSocket {
	 public Socket  socket;
	    public String  hostName;
	    public InputStream is = null;  
	    public BufferedInputStream bis = null;  
	    public OutputStream os = null;
	    private int     port = 80;            
	    
	    public ClientSocket (String url)
	    {
	        this.hostName = getHostName(url);
	        createSocket();
	    }

	    public void createSocket()
	    {
	        try
	        {
	            socket = new Socket();
	            socket.connect(new InetSocketAddress(hostName, port)); 
	            socket.setKeepAlive(true);   
	            socket.setTcpNoDelay(true);
	            System.out.println("Socket created! Host: " + hostName + "; port: " + port+ "; LocalHost: " + socket.getLocalPort());
	            is = socket.getInputStream();
	            bis = new BufferedInputStream(socket.getInputStream());
	            String encoding = System.getProperty("file.encoding","ISO8859_1");
	            os = new PrintStream(new BufferedOutputStream(
	                    socket.getOutputStream()),true, encoding);            
	        }
	        catch (IOException e) {}    
	    }
	            
	    public String getHostName(String url)
	    {
	        int i = url.indexOf('/',7);
	        String hostName = url.substring(7, i);
	        return hostName;
	    }

	    public void close() 
	    {
	        try{
	            is.close();
	            bis.close();
	            os.close();
	            socket.close();            
	        }catch (IOException e) {} 
	    }

}
