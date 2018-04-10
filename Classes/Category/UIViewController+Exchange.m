//
//  UIViewController+Exchange.m
//  Template
//
//  Created by Apple on 2017/10/30.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "UIViewController+Exchange.h"

#import <objc/runtime.h>


@implementation UIViewController (Exchange)

+ (void)load{
    
    Method m1 = class_getInstanceMethod([UIViewController class], @selector(presentViewController:animated:completion:));
    
    Method m2 = class_getInstanceMethod([UIViewController class], @selector(custormPresentViewController:animated:completion:));
    
    method_exchangeImplementations(m1, m2);
    
}

- (void)custormPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    
    
    NSLog(@"控制器被推出来了");
    
    
    [self custormPresentViewController:viewControllerToPresent animated:flag completion:completion];
    
    
    
}







@end
