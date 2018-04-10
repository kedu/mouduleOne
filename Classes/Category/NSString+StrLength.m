//
//  NSString+StrLength.m
//  ProtectEyesGreatMaster
//
//  Created by Apple on 2017/9/5.
//  Copyright © 2017年 李康滨,工作qq:1218773641. All rights reserved.
//

#import "NSString+StrLength.h"



@implementation NSString (StrLength)

+ (NSString*)nameLength:(NSString*)name  maxLength:(NSInteger)maxLength equalLength:(NSInteger)equalLength  strType:(NSString*)strType{

    if (0>=name.length) {
        
        return nil;
    }
    
    if ([NSString unicodeLengthOfString:name] <= maxLength) {
        
        return name;
    }
    
    // 4+1  5+0
    
    
    if (maxLength>=equalLength&&equalLength>0) {
        
        
//        name=[name substringToIndex:equalLength];//截取 4个字符
        //循环截取
        
        NSString*tmp;
        
        for (int i=0; i<name.length; i++) {
            
            tmp=name.mutableCopy;
            
            tmp=[tmp substringToIndex:i];
            
            
            NSLog(@"[NSString unicodeLengthOfString:tmp] ---- %lu",(unsigned long)[NSString unicodeLengthOfString:tmp]);
            
            
            
            if ([NSString unicodeLengthOfString:tmp] >= equalLength) {// 9>8
                
                int j = i;
                
                
                if (++j < name.length ) {
                    
                    NSString*temp = [name mutableCopy];
                    
                    temp = [temp substringToIndex:j];
                    
                    //+1 -1
                    if ([NSString unicodeLengthOfString:temp] >= equalLength && [NSString unicodeLengthOfString:temp] <= equalLength){
                        
                        
//                        break;
                        
                    }else{
                        
                        
                        break;
                    }
                    
                    
                    
                    
                }else {
                    
                    
                    break;
                }
               
//                break;
                

                
                
            }
            
            
            
        }
        
        
        name=tmp;
        
        
        
        
        name =[NSString stringWithFormat:@"%@%@",name,strType];
        
        
 
        
        return name;
    }
    
   

    return nil;



}


+ (NSString*)getDefaultLengthStr:(NSString *)str{



    
    return [NSString nameLength:str maxLength:8 equalLength:8 strType:@""];


}

//即：ASCII和Unicode混合文本长度
+ (NSUInteger) unicodeLengthOfString: (NSString *) text
{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < text.length; i++) {
        
        unichar uc = [text characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
        
        
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    
    if(asciiLength % 2) {//这里是抛上去了  对2取余 有1就再加一,能取整就不加了
        
        unicodeLength++;
        
    }
    
    return unicodeLength;
    
}




/**
 * 计算文字高度，可以处理计算带行间距的
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:size options:options context:nil];
    
    //    NSLog(@"size:%@", NSStringFromCGSize(rect.size));
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([self containChinese:self]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paragraphStyle.lineSpacing);
        }
    }
    
    
    
    return rect.size;
}



//判断如果包含中文
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){ int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}



/**
 *  计算最大行数文字高度,可以处理计算带行间距的
 */
- (CGFloat)boundingRectWithSize:(CGSize)size font:(UIFont*)font  lineSpacing:(CGFloat)lineSpacing maxLines:(NSInteger)maxLines{
    
    if (maxLines <= 0) {
        return 0;
    }
    
    CGFloat maxHeight = font.lineHeight * maxLines + lineSpacing * (maxLines - 1);
    
    CGSize orginalSize = [self boundingRectWithSize:size font:font lineSpacing:lineSpacing];
    
    if ( orginalSize.height >= maxHeight ) {
        
        return maxHeight;
        
    }else{
        
        return orginalSize.height;
        
    }
}



/**
 *  计算是否超过一行   用于给Label 赋值attribute text的时候 超过一行设置lineSpace
 */
- (BOOL)isMoreThanOneLineWithSize:(CGSize)size font:(UIFont *)font lineSpaceing:(CGFloat)lineSpacing{
    
    if ( [self boundingRectWithSize:size font:font lineSpacing:lineSpacing].height > font.lineHeight  ) {
        return YES;
    }else{
        return NO;
    }
}




@end
