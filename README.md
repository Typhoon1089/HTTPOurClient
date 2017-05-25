# HTTPOurClient - An complete packet to deploy HTTP Adaptive Streaming Testbed

## Motivations
I developed this testbed in April 2012 as a part of my research project, namely *Efficient Adaptation for HTTP Adaptive Streaming*. At the start of the project, researchers usually used simulation tools such as Network Simulator 2 (NS2) or MATLAB to evaluate their proposed schemes. As these schemes are only tested in simulation environments (not in real environments), such research studies have limited contributions and they are rarely used in practice. Therefore, I decided to develop my own testbed. In fact, this testbed was used in many our team's major publications.

Although HTTP Adaptive Streaming remains the de facto standard of streaming video over the Internet, the testbed was a bit outdated and I have already developed another testbed for HTTP/2, a new version of HTTP. Nevertheless, this testbed is still meaningful for new researchers/developers, who are interested in this topic and want develop their own streaming system.

* Short development time: Some parts of a streaming system were intentionally ignored for the shortest development time.
* Easy to implement new ideas: Some abstract functions were developed so that a new adaptation method can be easily employed.

## Testbed organization
I consider the simple streaming system architecture with a HTTP streaming server (i.e., a standard Web server), an HTTP streaming client, and IP networks. In lab environment, I store video content in an Apache HTTP server. The DummyNet tool is used to emulate the network characteristics and it is included in the client. As for the client, there are three main components: Player, Downloader and Adaptation engine. 

<div class="imgcap">
 <img src ="/fig_Testbed.png" align = "center" width = "400">
 <div class = "thecap">Figure 1: Testbed organization </div>
</div>

## HTTP Adaptive Streaming Client
In video streaming, the client downloads and playbacks video segments simultaneously. Therefore, I employed the client with two main threads one is player and another is downloader. Both the player and downloader share the same client buffer.

The key component that we focus on is Adaptation engine. As with HTTP/1.1-based streaming, the client downloads the video segment and then makes decisions on which video quality should be requested for the next segment. Therefore, the adaptation engine is employed as a function in the downloader-related class. 
 
## How to implement a new adaptation method in HTTPOurClient
For the purpose of extensibility, I created the abstract class called AdaptationLogic. A proposed adaptation method can be employed by inheriting this class. In this project, I included three adaptation methods, namely Aggressive method [[1](http://ieeexplore.ieee.org/document/6774590)], Berlin method [[2](http://ieeexplore.ieee.org/document/6229732)], and Wilo method [[3](http://ieeexplore.ieee.org/document/6825039)].

In conclusion, I don't aim my best effort at making my testbed to be well-known and optimal one because Internet streaming technologies are always improved quickly, but I hope that some people will encourage my ideas including inside it. 

*Happy coding with HTTPOurClient*
