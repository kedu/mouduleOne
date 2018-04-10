//
//  UIView+MJCornerRadius.m
//  MJCornerRadius
//
//  Created by none on 17/3/21.
//  Copyright © 2017年 mj. All rights reserved.
//

#import "UIView+MJCornerRadius.h"

@implementation UIView (MJCornerRadius)


/**
 设置圆角和边框

 @param radius 圆角
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 */
- (void)mj_setCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor AndBorderWidth:(CGFloat)borderWidth{
    
    CGSize viewSize = self.frame.size;
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = CGRectMake(0, 0, viewSize.width, viewSize.height);
    
    //设置边框
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, viewSize.width, viewSize.height);
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = borderColor.CGColor;
    shapeLayer.lineWidth = borderWidth;
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, viewSize.width, viewSize.height) cornerRadius:radius];
    shapeLayer.path = path.CGPath;
    maskLayer.path = path.CGPath;
    
    [self.layer insertSublayer:shapeLayer atIndex:0];//设置边框
    [self.layer setMask:maskLayer];//设置圆角
}
- (void)mj_setCornerRadius:(CGFloat)radius{
    [self mj_setCornerRadius:radius borderColor:nil AndBorderWidth:0];
}


- (UIImage*)doSomeThing:(CGSize)size  andradius:(CGFloat)radius {
    

    
    UIGraphicsBeginImageContextWithOptions(size, false, [UIScreen mainScreen].scale);//开启图形上下文
    
    CGContextRef context =  UIGraphicsGetCurrentContext();//拿到当前上下文
    
    CGContextMoveToPoint(context, size.width, 0);
    
    
    CGContextAddArcToPoint(context, size.width/2.f, 0, size.width, size.height/2.f, radius);
    
    CGContextAddArcToPoint(context, size.width, size.height/2.f , size.width/2.f, size.height, radius);
    
    CGContextAddArcToPoint(context, size.width/2.f, size.height, 0, size.height/2.f, radius);
    
    CGContextAddArcToPoint(context, 0, size.height/2.f, size.width/2.f, 0, radius);
    
    //路线有了

    //开始画圆
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    //关闭图形上下文
    
    UIGraphicsEndImageContext();
    
    
    
    
    return image;
    
    
    
    
    

    
    
}

- (void)kt_addCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor*)backgroundColor  borderColor:(UIColor*)borderColor{
    
    UIImageView*imageView = [[UIImageView alloc]init];
    
    imageView.image = [imageView doSomeThing:imageView.size andradius:5];
    
    [self insertSubview:imageView atIndex:0];//插入一个视图
    


    
}


//extension UIImage {
//    func kt_drawRectWithRoundedCorner(radius radius: CGFloat, _ sizetoFit: CGSize) -> UIImage {

//        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
//
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)

//        CGContextAddPath(UIGraphicsGetCurrentContext(),
//                         UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners,
//                                      cornerRadii: CGSize(width: radius, height: radius)).CGPath)

//        CGContextClip(UIGraphicsGetCurrentContext())
//
//        self.drawInRect(rect)

//        CGContextDrawPath(UIGraphicsGetCurrentContext(), .FillStroke)

//        let output = UIGraphicsGetImageFromCurrentImageContext();

//        UIGraphicsEndImageContext();
//
//        return output
//    }
//}


























@end
