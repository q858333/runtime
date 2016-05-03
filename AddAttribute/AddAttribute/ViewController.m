//
//  ViewController.m
//  AddAttribute
//
//  Created by DengBin on 16/5/3.
//  Copyright © 2016年 DB. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+DBButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.db_time=1;
    NSLog(@"1111");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
