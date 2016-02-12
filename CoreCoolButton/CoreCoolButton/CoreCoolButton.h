//
//  CoreCoolButton.h
//  CoreCoolButton
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface CoreCoolButton : UIView

@property (nonatomic,copy) void (^ClickAction)();

-(void)setBgColor:(UIColor *)bgColor title:(NSString *)title titleColor:(UIColor *)titleColor fontPoint:(CGFloat)fontPoint progressColor:(UIColor *)progressColor;

-(void)anim:(BOOL)anim isMainThread:(BOOL)isMainThread completeBlock:(void(^)())completeBlock;




@end
