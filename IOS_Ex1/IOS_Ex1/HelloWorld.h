//
//  HelloWorld.h
//  IOS_Ex1
//
//  Created by Yanwenli on 25/01/2019.
//  Copyright © 2019 Yanwenli_LOG_C_TP. All rights reserved.
//

#ifndef HelloWorld_h
#define HelloWorld_h

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//NS_ASSUME_NONNULL_BEGIN


@interface Helloworld : NSObject

@property (nonatomic, retain) NSString * text;

- (void) printHelloWorld;

@end

#endif
//NS_ASSUME_NONNULL_END
