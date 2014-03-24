//
//  ZMQServer.m
//  iPhone-ZeroMQ
//
//  Created by David Black on 19/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import "ZMQServer.h"

@implementation ZMQServer
@synthesize delegate;

- (void)connectToServer{
 

 NSLog( @"delegate on main thread: %@",
       [[NSThread currentThread] isMainThread] ? @"YES" : @"NO" );

 // Setup the context for Server
 
  ZMQContext *context = [[ZMQContext alloc] initWithIOThreads:1U];
 
 // Setup subscriber to the Server
 
  ZMQSocket *subscriber = [context socketWithType:ZMQ_SUB];
 
if(![subscriber connectToEndpoint:@"tcp://127.0.0.1:2001"]) {
  
    NSLog(@"Error subscribing to the end point");
  
    return;
  
}

 
 // Setup label for pub/sub
 
 

  const char *nameSubscribed = "PRIME";
 
  NSData *filterData = [NSData dataWithBytes:nameSubscribed length:strlen(nameSubscribed)];
 
  [subscriber setData:filterData forOption:ZMQ_SUBSCRIBE];
 
 int count = 0;
 
 while(TRUE) {
  
  count++;
 
 
   [delegate getMessage:[NSString stringWithFormat:@"msg from server %i", count]];
  
//  [delegate getMessage:[[subscriber receiveDataWithFlags:0] bytes]];
  
  
 }
 

//  NSData *msg = [subscriber receiveDataWithFlags:0];
 
//  const char *string = [msg bytes];
 


//while(TRUE) {
 
//  NSLog(@"Message received %s", [[subscriber receiveDataWithFlags:0] bytes]);
 
// [delegate getMessage:[[subscriber receiveDataWithFlags:0] bytes]];
 

 
 // call the getMessage
 

 

 

 
}

@end

