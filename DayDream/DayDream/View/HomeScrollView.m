//
//  HomeScrollView.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "HomeScrollView.h"
@interface HomeScrollView()
@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIScrollView * ExploreScrollView;

@end
@implementation HomeScrollView

/**
 init MainScrollView

 @param frame Viewcontroller Setting
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       // self.contentSize = CGSizeMake(ScreenWidth, ScreenHeight *2.0);
        self.backgroundColor = [UIColor whiteColor];
        [self setShowsVerticalScrollIndicator:NO];
        //add contentView
        self.contentView  =[[UIView alloc]init];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.mas_equalTo(ScreenWidth);
            
        }];
        
        //add  ImageView - > headerImageView
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scene"]];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.contentView);
            make.height.mas_equalTo(ScreenHeight /2.0);
            
        }];
        _headerImageView = imageView;
        
        //add Explore Title (static)
        
        UILabel *explore = [[UILabel alloc]init];
        explore.font = [UIFont boldSystemFontOfSize:19.f];
        explore.text = @"  Explore";
        explore.textColor =[UIColor blackColor];
        explore.textAlignment =NSTextAlignmentLeft;
        [self.contentView addSubview:explore];
        [explore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).offset(10.0);
            make.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(20.0);
        }];
        
        //add Explore View
        UIScrollView *scrollView =[[UIScrollView alloc]init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        [self.contentView addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(explore.mas_bottom).offset(10.0);
            make.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(ScreenHeight/5.0);
        }];
        
        UIView *exploreView =[[UIView alloc]init];
        [scrollView addSubview:exploreView];
        [exploreView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.height.mas_equalTo(ScreenHeight/5.0);
        }];
        
        for (int i = 0 ; i < 10; i++) {
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor whiteColor];
            [exploreView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(exploreView);
                make.left.equalTo(exploreView).offset( ScreenWidth * i);
                make.width.mas_equalTo(ScreenWidth);
            }];
            
            UIImageView *insideImageView = [[UIImageView alloc]init];
            insideImageView.image  = [UIImage imageNamed:@"cat"];
            [view addSubview:insideImageView];
            [insideImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view).offset(10.0);
                make.right.equalTo(view).offset(-10.0);
                make.top.bottom.equalTo(view);
            }];
            insideImageView.layer.cornerRadius = 10.f;
            insideImageView.layer.masksToBounds = YES;
            
            
        }
       
        [exploreView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(ScreenWidth * 10);
        }];
        
        //add New Title
        UILabel *NewLabel = [[UILabel alloc]init];
        NewLabel.text =@"  New";
        NewLabel.font = [UIFont boldSystemFontOfSize:19.f];
        NewLabel.textColor =[UIColor blackColor];
        NewLabel.textAlignment =NSTextAlignmentLeft;
        [self.contentView addSubview:NewLabel];
        [NewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(scrollView.mas_bottom).offset(10.0);
            make.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(20.0);
        }];
        
        //add New View
        UIView *endView = [UIView new];
        for (int j = 0; j < 10; j++) {
            UIImageView *newView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cat"]];
            
            [self.contentView addSubview:newView];
            [newView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(NewLabel.mas_bottom).offset(10.0 + ScreenHeight/2.0 *j);
                make.left.right.equalTo(self.contentView);
                make.height.mas_equalTo(ScreenHeight/2.0 -2);
            }];
            if (j == 9) {
                endView = newView;
            }
        }
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(endView.mas_bottom);
        }];
    }
    return self;
}



@end
