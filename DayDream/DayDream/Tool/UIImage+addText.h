//
//  UIImage+addText.h
//  drawRect
//
//  Created by DayDream on 2019/2/27.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (addText)

+ (UIImage *)imageWithText:(NSString *)text
                  textFont:(NSInteger)fontSize
                 textColor:(UIColor *)textColor
                 textFrame:(CGRect)textFrame
               originImage:(UIImage *)image
    imageLocationViewFrame:(CGRect)viewFrame;
@end

NS_ASSUME_NONNULL_END
