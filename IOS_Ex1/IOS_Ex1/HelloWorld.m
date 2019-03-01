//
//  HelloWorld.m
//  IOS_Ex1
//
//  Created by Yanwenli on 25/01/2019.
//  Copyright © 2019 Yanwenli_LOG_C_TP. All rights reserved.
//


#import "HelloWorld.h"


@implementation HelloWorld : NSObject

@synthesize text;

- (void) printHelloWorld {
    
    self.text = @"Hello World";
    
    NSLog(@"Mon premier texte console : %@", self.text);
    
}

@end


