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
 
    ZMQContext *context = [[ZMQContext alloc] initWithIOThreads:1U];
 
    /* Get a socket to talk to the server */
 
    ZMQSocket *subscriber = [context socketWithType:ZMQ_SUB];
 
   if(![subscriber connectToEndpoint:@"tcp://127.0.0.1:2001"]) {
  
      NSLog(@"Error subscribing to the End Point");
    
      return;
   }

   const char *nameSubscribed = "PRIME";
 
   NSData *filterData =[NSData dataWithBytes:nameSubscribed length:strlen(nameSubscribed)];
 
   [subscriber setData:filterData forOption:ZMQ_SUBSCRIBE];
 
   // check that it is reading from the server by getting a value
 
   NSData *msg = [subscriber receiveDataWithFlags:0];
 
   const char *string = [msg bytes];
 
   NSLog(@"Message received %s ", string);
 
 
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View




@end
