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


-(NSInteger)convertStringToInteger:(const char *) num{
 
   // Convert from string to NSString
 
   NSString *value = [NSString stringWithUTF8String:num];
 
   // Get the length of the NSString
 
   NSUInteger stringLength = [value length];
 
   // Extract the integers from the NSString
 
   NSString *intString = [value substringWithRange:NSMakeRange(8, (stringLength - 8))];
 
   // Convert sub NSString to a number using literals
 
   NSNumber *number = @([intString intValue]);
 
   // Convert NSNumber to NSInteger and return
 
   return [number integerValue];
 
}

- (void)viewDidLoad
{
 

  NSLog(@"View Loaded... ");
 
  self.textLabel.text = @"Hello World";
 
 // Get messages from the server on another thread
 
 __block NSString *stringValue; // value that will returned to the main thread
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
  
  ZMQContext *context = [[ZMQContext alloc] initWithIOThreads:1U];
  
  ZMQSocket *subscriber = [context socketWithType:ZMQ_SUB];
  
  if(![subscriber connectToEndpoint:@"tcp://127.0.0.1:2001"]) {
   
   NSLog(@"Error subscribing to the End Point");
   
   return;
  }
  
  const char *nameSubscribed = "PRIME";
  
  NSData *filterData = [NSData dataWithBytes:nameSubscribed length:strlen(nameSubscribed)];
  
  [subscriber setData:filterData forOption:ZMQ_SUBSCRIBE];
 
  NSInteger myInteger = [self convertStringToInteger:[[subscriber receiveDataWithFlags:0] bytes]];
  
  // Add the next 14 prime numbers
  
  for (int i = 0; i < 15; i++) {
   
   myInteger = myInteger + [self convertStringToInteger:[[subscriber receiveDataWithFlags:0] bytes]];
   
  }
  
  NSLog(@"Integer = %ld", (long)myInteger);
  
  // Convert NSInteger to NSString ready to display
  
  NSString *string = @(myInteger).stringValue; // Using literals for converstion
  
  stringValue = string;
  
  // Close the connection to the server
  
  [subscriber close];
  
  dispatch_async(dispatch_get_main_queue(), ^{
   
   // Return to the main thread so that tha UILabel text can be updated

   self.textLabel.text = stringValue;

  });
 
});
 

 [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
