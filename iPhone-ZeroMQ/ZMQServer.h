//
//  ZMQServer.h
//  iPhone-ZeroMQ
//
//  Created by David Black on 19/03/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UniversaliOS/zmq.h>
#import "ZMQObjC.h"

@class ZMQServer;

@protocol ZMQServerDelegate <NSObject>

- (void)getMessage:(NSString *)msg;

@end

@interface ZMQServer : NSObject 

@property(nonatomic, assign) id <ZMQServerDelegate> delegate;

- (void)connectToServer;

@end
