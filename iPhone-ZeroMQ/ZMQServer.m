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
 

 // Setup the context for Server
 
//  ZMQContext *context = [[ZMQContext alloc] initWithIOThreads:1U];
 
 // Setup subscriber to the Server
 
//  ZMQSocket *subscriber = [context socketWithType:ZMQ_SUB];
 
//if(![subscriber connectToEndpoint:@"tcp://127.0.0.1:2001"]) {
  
//    NSLog(@"Error subscribing to the end point");
  
//    return;
  
// }

 
 // Setup label for pub/sub
 
 
/*
  const char *nameSubscribed = "PRIME";
 
  NSData *filterData = [NSData dataWithBytes:nameSubscribed length:strlen(nameSubscribed)];
 
  [subscriber setData:filterData forOption:ZMQ_SUBSCRIBE];
 
 

  NSData *msg = [subscriber receiveDataWithFlags:0];
 
  const char *string = [msg bytes];
 
 
// while(TRUE) {
 
  NSLog(@"Message received %s", [[subscriber receiveDataWithFlags:0] bytes]);
 
*/
 
 // call the getMessage
 

 
//  [delegate performSelector:@selector(msgEvent)];
 

 
    NSLog(@"ZMQServer object created");

 
 for (int i = 0; i < 15; i++) {
  
    [NSThread sleepForTimeInterval:2];
 
    [self.delegate getMessage:[NSString stringWithFormat:@"Sending %i'th message", i]];
  

 }
 
}

@end

