//
//  ViewController.m
//  iPhone-ZeroMQ
//
//  Created by David Black on 12/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import "ViewController.h"
#import "ZMQServer.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textLabel;
@synthesize myServer;

-(void) updateDisplay:(NSString *)str
{
 //self.textLabel.text = str;
 //[self.textLabel setNeedsDisplay];
 
  NSLog(@"Call to updateDisplay");
 
 [self.textLabel performSelectorOnMainThread : @ selector(setText : ) withObject:str waitUntilDone:YES];

}

- (void)viewDidLoad
{

    [super viewDidLoad];
 
    myServer = [[ZMQServer alloc]init];
 
    myServer.delegate = self;
 
    [myServer connectToServer];
 

 
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ZMQServer getMessage

- (void) getMessage:(NSString *)msg{
 
   NSLog(@"Message sent to label: %@", msg);
 
  [self updateDisplay:msg];
 
 
}




@end
