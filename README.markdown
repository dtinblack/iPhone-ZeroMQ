# Exploring ZeroMQ and iOS

A Nodejs based server generates prime numbers that are displayed on an app to explore [ZeroMQ](http://zeromq.org/) and iOS.

# Software
 
* Operating System : Mac OS 10.9 ( Mavericks )
* Node Version : v0.10.0 
* Node Package Manager ( NPM ) : v1.2.14 
* XCode : v5.1


## Development of a Universal iOS Framework

TODO

- Two Blogs that are key to developing a Universal iOS framework are: [Paolo's Blog](http://paolodenti.blog.com/) about developing ZeroMQ for iOS, and [Justin DeWind's blog](http://spin.atomicobject.com/2011/12/13/building-a-universal-framework-for-ios/) about building a Universal framework ( + others for background ). For those who want to deleve a bit further into the are of frameworks I found the following helpful: [Jay Mehta's Blog](http://jaym2503.blogspot.co.uk/2012/09/how-to-create-custom-ios-framework.html) about creating a custom framework, and [Diney Bomfin's]( http://blog.db-in.com/universal-framework-for-ios/ ) which gives a bit more detail on the flag settings.
- Used Source Code + Includes from ZeroMQ version 4.0.4.
- Compiling the software produced warnings about the use of [tempnam](https://developer.apple.com/library/mac/documentation/Darwin/Reference/Manpages/man3/tempnam.3.html) and loss of accuracy due to implicit conversions.
- Transfered the Universal iOS Framework to the project.
- Added the source and headers from the [Objective-C](https://github.com/jeremy-w/objc-zmq) binding and replaced the #include <zmq.h> with #include<UniversaliOS/zmq.h>  modifications and use <> headers.

## Installation of Nodejs binding for ZeroMQ

    npm install zmq

## Run

<ol>
<li>TODO</li>
<li>TODO</li>
<li>TODO</li>
</ol>

# Thanks

TODO

Many people to thank, however a special mention to: [Pieter Hintjens](http://en.wikipedia.org/wiki/Pieter_Hintjens) and everybody else involved with [ZeroMQ](http://zeromq.org/),[Paolo Denti](http://paolodenti.blog.com/) and [Justin DeWind](http://spin.atomicobject.com/2011/12/13/building-a-universal-framework-for-ios/) for their excellent blogs about building a Universal ZeroMQ framework for iOS, [Jeremy W Sherman](https://jeremywsherman.com/) for the [Objective-C](https://github.com/jeremy-w/objc-zmq) binding, [Justin Tulloss](http://justin.harmonize.fm) for [Nodejs bindings](https://github.com/JustinTulloss/zeromq.node).

