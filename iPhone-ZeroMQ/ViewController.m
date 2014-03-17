//
//  ViewController.m
//  iPhone-ZeroMQ
//
//  Created by David Black on 12/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import "ViewController.h"
#import "ZMQObjC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    NSLog(@"View loaded");
 
    ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1U];
 
    /* Get a socket to talk to the server */
 
    NSLog(@"Connecting to prime number server ...");
    static NSString *const kEndpoint = @"tcp://127.0.0.1:3000";
    ZMQSocket *requestor = [ctx socketWithType:ZMQ_REQ];
 
    BOOL didBind = [requestor connectToEndpoint:kEndpoint];
 
    NSLog(@"Value of Boolean %i endpoint [%@].", didBind, kEndpoint);
 
   if(!didBind) {
     NSLog(@"*** Failed to bind to endpoint [%@].", kEndpoint);
   }
 
   static const int kMaxRequest = 10;
   NSData *const request = [@"Hello from the iOS client" dataUsingEncoding:NSUTF8StringEncoding];
   for (int request_nbr = 0; request_nbr < kMaxRequest; ++request_nbr) {
  
   NSLog(@"Sending request %d.", request_nbr);
  [requestor sendData:request withFlags:0];
  
   NSData *reply = [requestor receiveDataWithFlags:0];
   NSString *text = [[NSString alloc]
                    initWithData:reply encoding:NSUTF8StringEncoding];
   NSLog(@"Received reply %d: %@", request_nbr, text);
 }
 
  // close the socket on the server
 
  NSData *const close = [@"close" dataUsingEncoding:NSUTF8StringEncoding];
  [requestor sendData:close withFlags:0];
 
 // close the socket
 
 [requestor close];

 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
