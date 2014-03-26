//
//  ViewController.h
//  iPhone-ZeroMQ
//
//  Created by David Black on 12/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UniversaliOS/zmq.h>
#import "ZMQObjC.h"

@interface ViewController : UIViewController 
 
@property(weak,nonatomic) IBOutlet UILabel *textLabel;

-(NSInteger)convertStringToInteger:(const char *)num;


@end
