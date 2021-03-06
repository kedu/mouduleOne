//
//  UIButton+ActionBlock.m
//  ProtectEyesGreatMaster
//
//  Created by Apple on 2017/9/28.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "UIButton+ActionBlock.h"
#import<objc/runtime.h>

@implementation UIButton (ActionBlock)


- (void)setBlock:(void(^)(UIButton*btn))block

{
    
    objc_setAssociatedObject(self,@selector(block), block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}

- (void(^)(UIButton*btn))block

{
    
    return objc_getAssociatedObject(self,@selector(block));
    
}




- (void)addTapBlock:(void(^)(UIButton*btn))block

{
    
    self.block= block;
    
    [self addTarget:self  action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)click:(UIButton*)btn

{

    
    if(self.block) {
     
        btn.userInteractionEnabled=NO;//先禁止交互
        
//        NSLog(@"开始");
        
        self.block(btn);
    
//        NSLog(@"结束");
        
        btn.userInteractionEnabled=YES;//事件结束了再把交互开启
        
    }
    
    
    
    
}


@end
