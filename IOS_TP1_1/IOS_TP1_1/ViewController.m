//
//  ViewController.m
//  IOS_TP1_1
//
//  Created by Yanwenli on 25/01/2019.
//  Copyright © 2019 Yanwenli_LOG_C_TP. All rights reserved.
//

#import "ViewController.h"
#import "HelloWorld.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HelloWorld * helloword = [[HelloWorld alloc] init];
    helloword.text = @"Hi !";
    [helloword printHelloWorld];
    [helloword printHello:@"yes" :@"ok"];
    
    _label1.text = @"YANWENLI";
    _label2.text = @"polytech";
//    _label1.textColor = @"##12314";
    
     [_label1 setFont:[UIFont boldSystemFontOfSize:14]];
     [_label1 sizeToFit];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
