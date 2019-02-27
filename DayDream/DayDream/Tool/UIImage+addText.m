//
//  UIImage+addText.m
//  drawRect
//
//  Created by DayDream on 2019/2/27.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "UIImage+addText.h"
#import "NSString+StringSize.h"
@implementation UIImage (addText)

+ (UIImage *)imageWithText:(NSString *)text
                  textFont:(NSInteger)fontSize
                 textColor:(UIColor *)textColor
                 textFrame:(CGRect)textFrame
               originImage:(UIImage *)image
    imageLocationViewFrame:(CGRect)viewFrame {
    
    if (!text)      {  return image;   }
    if (!fontSize)  {  fontSize = 17;   }
    if (!textColor) {  textColor = [UIColor blackColor];   }
    if (!image)     {  return nil;  }
    if (viewFrame.size.height==0 || viewFrame.size.width==0 || textFrame.size.width==0 || textFrame.size.height==0 ){return nil;}
    
    NSString *mark = text;
    CGFloat height = [mark sizeWithPreferWidth:textFrame.size.width font:[UIFont systemFontOfSize:fontSize]].height; // 此分类方法要导入头文件
    if ((height + textFrame.origin.y) > viewFrame.size.height) { // 文字高度超出父视图的宽度
        height = viewFrame.size.height - textFrame.origin.y;
    }
    
    //    CGFloat w = image.size.width;
    //    CGFloat h = image.size.height;
    UIGraphicsBeginImageContext(viewFrame.size);
    [image drawInRect:CGRectMake(0, 0, viewFrame.size.width, viewFrame.size.height)];
    NSDictionary *attr = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName : textColor };
    //位置显示
    [mark drawInRect:CGRectMake(textFrame.origin.x, textFrame.origin.y, textFrame.size.width, height) withAttributes:attr];
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aimg;
}

@end
