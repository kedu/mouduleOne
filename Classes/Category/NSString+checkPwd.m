//
//  NSString+checkPwd.m
//  ProtectEyesGreatMaster
//
//  Created by Apple on 17/4/5.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "NSString+checkPwd.h"

@implementation NSString (checkPwd)

-(BOOL)checkPassWord
{
    
    //6-20位数字和字母组成
//    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSString*regex=@"^[0-9A-Za-z]{6,20}$";
    NSPredicate *  pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self]) {
        return YES ;
    }else
        return NO;
    
    
    
}


- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font lineSpan:(NSInteger)lineSpan
{
    NSDictionary *atts = nil;
    if (lineSpan != 0) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = lineSpan;
        atts = @{NSFontAttributeName : font, NSParagraphStyleAttributeName : style};
    }else{
        atts = @{NSFontAttributeName : font};
    }
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font lineSpan:(NSInteger)lineSpan
{
    return [text sizeOfTextWithMaxSize:maxSize font:font lineSpan:lineSpan];
}

+ (NSURL*)urlWithString:(NSString*)string{
    
    if (string.length <= 0) {
        return nil;
    }
    
    
    string = [domin stringByAppendingString:string];
    
    NSURL*url = [NSURL URLWithString:string];
    
    
    return url;
}






@end
