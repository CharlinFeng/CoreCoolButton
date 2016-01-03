//
//  ViewController.m
//  CoreCoolButton
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CoreCoolButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CoreCoolButton *btn;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn.btnTintColor = [UIColor redColor];
    
    self.btn.title = @"注册账号";
    self.btn.titleColor = [UIColor whiteColor];
}

- (IBAction)btnClick:(id)sender {
    
    NSLog(@"点击了按钮");
}


@end
