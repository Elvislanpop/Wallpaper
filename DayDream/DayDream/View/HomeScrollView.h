//
//  HomeScrollView.h
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeScrollView : UIScrollView

/**
 偏移量监听节点
 */
@property (nonatomic,strong) EZRMutableNode <NSNumber *> *offsetYNode;

/**
 手势单词点击节点
 */
@property (nonatomic,strong) EZRMutableNode *TapNode;


/**
 Explore标题
 */
@property (nonatomic,strong) NSMutableArray *exploreTitle;

-(instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
