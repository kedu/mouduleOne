//
//  NSString+StrLength.h
//  ProtectEyesGreatMaster
//
//  Created by Apple on 2017/9/5.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StrLength)

+ (NSString*)nameLength:(NSString*)name  maxLength:(NSInteger)maxLength equalLength:(NSInteger)equalLength  strType:(NSString*)strType;


//看文字长度
+ (NSUInteger) unicodeLengthOfString: (NSString *) text;

+ (NSString*)getDefaultLengthStr:(NSString*)str;


/**
 *  计算最大行数文字高度,可以处理计算带行间距的
 */
- (CGFloat)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines;




@end
