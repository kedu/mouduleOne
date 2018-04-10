//
//  NSString+checkPwd.h
//  ProtectEyesGreatMaster
//
//  Created by Apple on 17/4/5.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (checkPwd)

-(BOOL)checkPassWord;

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font lineSpan:(NSInteger)lineSpan;

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font lineSpan:(NSInteger)lineSpan;


+ (NSURL*)urlWithString:(NSString*)string;



@end
