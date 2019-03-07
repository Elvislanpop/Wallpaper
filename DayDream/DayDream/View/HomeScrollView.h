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
@property (nonatomic,strong) EZRMutableNode <UISearchBar *>*searchBarNode;
@property (nonatomic,strong) EZRMutableNode <NSNumber *> *offsetYNode;
@property (nonatomic,strong) EZRMutableNode <UIButton *> *buttonNode;

-(instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
