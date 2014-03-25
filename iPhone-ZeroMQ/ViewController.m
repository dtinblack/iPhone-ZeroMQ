//
//  ViewController.m
//  iPhone-ZeroMQ
//
//  Created by David Black on 12/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize textLabel;

/*

-(void) updateDisplay:(NSString *)str
{
 //self.textLabel.text = str;
 //[self.textLabel setNeedsDisplay];
 
//  NSLog(@"Call to updateDisplay");
 
 [self.textLabel performSelectorOnMainThread : @ selector(setText : ) withObject:str waitUntilDone:YES];

}
 
*/

- (void)viewDidLoad
{
 

  NSLog(@"View Loaded... ");
 
  self.textLabel.text = @"Hello World";
 
  ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1U];
 
 
 // Experiment with Block Programming
 
 NSLog( @"main thread: %@",
       [[NSThread currentThread] isMainThread] ? @"YES" : @"NO" );
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
  

  
  NSLog( @"dispatch_async thread: %@",
        [[NSThread currentThread] isMainThread] ? @"NO": @"YES" );
  
  NSLog(@"Done doing something long and involved");
  
  
  dispatch_async(dispatch_get_main_queue(), ^{
   
   NSLog( @"main thread: %@",
         [[NSThread currentThread] isMainThread] ? @"YES" : @"NO" );
 
   
   self.textLabel.text = @"Done something";
  });
 });
 
 

 /*
 
 ZMQContext *ctx = [[ZMQContext alloc] initWithIOThreads:1U];
 
 NSLog(@"Connecting to hello world server ...");
 static NSString *const kEndpoint = @"tcp://127.0.0.1:3000";
 ZMQSocket *requestor = [ctx socketWithType:ZMQ_REQ];
 
 BOOL didBind = [requestor connectToEndpoint:kEndpoint];
 
 NSLog(@"Value of Boolean %i endpoint [%@].", didBind, kEndpoint);
 
 if(!didBind) {
  NSLog(@"*** Failed to bind to endpoint [%@].", kEndpoint);
  return;
 }
 
 static const int kMaxRequest = 10;
 NSData *const request = [@"Hello from the client" dataUsingEncoding:NSUTF8StringEncoding];
 for (int request_nbr = 0; request_nbr < kMaxRequest; ++request_nbr) {
  
  NSLog(@"Sending request %d.", request_nbr);
  [requestor sendData:request withFlags:0];
  
  NSData *reply = [requestor receiveDataWithFlags:0];
  NSString *text = [[NSString alloc]
                    initWithData:reply encoding:NSUTF8StringEncoding];
  NSLog(@"Received reply %d: %@", request_nbr, text);
  
  
  [self updateDisplay:[NSString stringWithFormat:@" %@: %d", text, request_nbr]];
  
  
 }
 
 [requestor close];

*/
 
 
 [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
