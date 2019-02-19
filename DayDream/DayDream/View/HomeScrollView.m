//
//  HomeScrollView.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "HomeScrollView.h"

@implementation HomeScrollView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(ScreenWidth, ScreenHeight *2.0);
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


@end
