//
//  CoreCoolButton.m
//  CoreCoolButton
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "CoreCoolButton.h"
#import "DeformationButton.h"

@interface CoreCoolButton ()

@property (nonatomic,strong) DeformationButton *innerBtn;

@end

@implementation CoreCoolButton

-(void)btnClick{
    
    if(self.tag == 0){
        if(self.ClickAction != nil) self.ClickAction();
    }else{
        if(self.innerBtn.isLoading) return;
        [self anim:YES isMainThread:NO completeBlock:^{
           if(self.ClickAction != nil) self.ClickAction(); 
        }];
    }
}

-(void)setBgColor:(UIColor *)bgColor title:(NSString *)title titleColor:(UIColor *)titleColor fontPoint:(CGFloat)fontPoint progressColor:(UIColor *)progressColor{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    self.backgroundColor = [UIColor clearColor];
    if(self.innerBtn.title == nil){
    
        self.innerBtn.isLoading = NO;
        [self addSubview:self.innerBtn];
        [self.innerBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        self.innerBtn.btnTintColor = bgColor;
        self.innerBtn.title = title;
        self.innerBtn.titleColor = titleColor;
        [self.innerBtn.forDisplayButton setTitleColor:titleColor forState:UIControlStateNormal];
        self.innerBtn.forDisplayButton.titleLabel.font = [UIFont systemFontOfSize:fontPoint];
        self.innerBtn.progressColor = progressColor == nil ? titleColor : progressColor;
        self.innerBtn.contentColor = bgColor;
    }
}



-(void)layoutSubviews{
    
    [super layoutSubviews];
    if(self.innerBtn == nil){
        self.innerBtn = [[DeformationButton alloc] initWithFrame:self.bounds];
        self.innerBtn.frame = self.bounds;
        self.innerBtn.forDisplayButton.frame = self.bounds;
    }
}




-(void)anim:(BOOL)anim isMainThread:(BOOL)isMainThread completeBlock:(void(^)())completeBlock{

    if(isMainThread){
    
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(anim){
            
                [self.innerBtn startLoading];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if(completeBlock != nil) completeBlock();
                });
                
            }else{
                [self.innerBtn stopLoading];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if(completeBlock != nil) completeBlock();
                });
            }
            
            
        });
        
    }else{
        
        if(anim){
            
            [self.innerBtn startLoading];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if(completeBlock != nil) completeBlock();
            });
        }else{
            [self.innerBtn stopLoading];
            self.innerBtn.isLoading = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.innerBtn.isLoading = NO;
                if(completeBlock != nil) completeBlock();
            });
        }
    }
}

@end
