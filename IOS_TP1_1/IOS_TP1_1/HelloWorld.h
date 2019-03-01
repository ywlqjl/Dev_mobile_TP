//
//  HelloWorld.h
//  IOS_TP1_1
//
//  Created by Yanwenli on 25/01/2019.
//  Copyright © 2019 Yanwenli_LOG_C_TP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
//NS_ASSUME_NONNULL_BEGIN


@interface HelloWorld : NSObject

@property (nonatomic, retain) NSString * text;

- (void) printHelloWorld;
- (void) printHello:(NSString *) string : (NSString *) string2;

@end

//NS_ASSUME_NONNULL_END
