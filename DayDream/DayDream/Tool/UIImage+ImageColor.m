//
//  UIImage+ImageColor.m
//  DayDream
//
//  Created by DayDream on 2019/4/9.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "UIImage+ImageColor.h"

@implementation UIImage (ImageColor)
- (UIImage *)imageWithColor:(UIColor *)color {
    
    //创建1像素区域并开始图片绘图
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    
    //创建画板并填充颜色和区域
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    //从画板上获取图片并关闭图片绘图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
