//
//  UINavigationController+LoginPush.m
//  Template
//
//  Created by Apple on 2017/10/30.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "UINavigationController+LoginPush.h"

#import <objc/runtime.h>

@implementation UINavigationController (LoginPush)


+ (void)load{
    
    Method m1 = class_getInstanceMethod([UINavigationController class], @selector(pushViewController:animated:));
    
    Method m2 = class_getInstanceMethod([UINavigationController class], @selector(custormPushViewController:animated:));
    
    method_exchangeImplementations(m1, m2);
    
}

- (void)custormPushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
//    NSLog(@"我被交换了");
    if (![self.topViewController.className containsString:@"FileBrowser"]) {
        
        if ([self.topViewController isKindOfClass:[viewController class]]) {
            
            NSLog(@"有重复的push");
            
            return;
        }
        
    }

    
   
    
    
    if (self.viewControllers.count <= 0) {
        
         [self custormPushViewController:viewController animated:animated];
        
        return;
        
    }
    
    //如果没有登录,就去登录
    
    if(![DDGetUserInformationTool isLogin]){
        
        
        NSLog(@"没有登录");
        
    }else{
        
        
        //登录了就正常走下去
        
        [self custormPushViewController:viewController animated:animated];
        
    }
    
   
    
}



- (void)setPushVC:(UIViewController *)pushVC{
    
    
     objc_setAssociatedObject(self,@selector(pushVC), pushVC,OBJC_ASSOCIATION_ASSIGN);
    
}


- (UIViewController *)pushVC{
    
    
    
    return objc_getAssociatedObject(self,@selector(pushVC));
    
    
}





@end
