# Exploring ZeroMQ and iOS

A Nodejs based server generates prime numbers that are displayed on the app to explore[ZeroMQ](http://zeromq.org/) and iOS.

# Software
 
* Operating System : Mac OS 10.9 ( Maverick )
* Node Version : v0.10.0 
* Node Package Manager ( NPM ) : v1.2.14 
* XCode : v5.1


## Development of a Universal iOS Framework

TODO

- Two Blogs ( + others for background )
- Used Source Code + Includes from ZeroMQ version 4.0.4.
- Compiling the software produced warnings about the use of [tempnam](https://developer.apple.com/library/mac/documentation/Darwin/Reference/Manpages/man3/tempnam.3.html) and loss of accuracy due to implicit conversions.
- Transfered the Universal iOS Framework to the project.
- Added the source and headers from the [Objective-C](https://github.com/jeremy-w/objc-zmq) binding and replaced the #include <zmq.h> with #include<UniversaliOS/zmq.h>  modifications and use <> headers.

## Installation of Nodejs binding for ZeroMQ

TODO
    
    npm install zmq
    
## Run

<ol>
<li>TODO</li>
<li>TODO</li>
<li>TODO</li>
</ol>

# Thanks

TODO

Many people to thank, however a special mention to: the team behind ZeroMQ, ...

[Jeremy W Sherman](https://jeremywsherman.com/) for the [Objective-C](https://github.com/jeremy-w/objc-zmq) binding, [Justin Tulloss](http://justin.harmonize.fm) for [Nodejs bindings](https://github.com/JustinTulloss/zeromq.node).

