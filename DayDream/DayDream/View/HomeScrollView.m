//
//  HomeScrollView.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#define HeaderImageHeight ScreenHeight / 2.7
#import "HomeScrollView.h"
#import "HomeViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface HomeScrollView()<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIScrollView * ExploreScrollView;
@property (nonatomic,strong) UILabel *location;

@end
@implementation HomeScrollView

/**
 init MainScrollView

 @param frame ViewController Setting
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.contentInset = UIEdgeInsetsMake(HeaderImageHeight, 0, 0, 0);
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
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"scene"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        
       
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(HeaderImageHeight);
            make.top.equalTo(self.contentView).offset(-HeaderImageHeight);

        }];
        
       
         _headerImageView = imageView;
        
        
        UILabel *location = [[UILabel alloc]init];
        location.textColor =[UIColor whiteColor];
        location.font = [UIFont boldSystemFontOfSize:13.f];
        [imageView addSubview:location];
        [location mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(imageView).offset(-5.0);
            make.centerX.equalTo(imageView);
        }];
        _location = location;
        
        UILabel *mainTitle = [[UILabel alloc]init];
        mainTitle.textColor = [UIColor whiteColor];
        mainTitle.text =@"Photos for everyone";
        mainTitle.font = [UIFont boldSystemFontOfSize:25.f];
        [imageView addSubview:mainTitle];
        [mainTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(imageView);
        }];
       
        UISearchBar *searchBar = [[UISearchBar alloc]init];
        searchBar.placeholder =@"Search photos";
        searchBar.searchBarStyle = UISearchBarIconSearch;
        searchBar.backgroundImage = [UIImage new];
        searchBar.barStyle = UISearchBarStyleDefault;
        [imageView addSubview:searchBar];
        [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(mainTitle.mas_bottom).offset(5.0);
            make.centerX.equalTo(imageView);
            make.width.mas_equalTo(ScreenWidth - 40);
            make.height.mas_equalTo(40.0);
        }];
        
        
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
        scrollView.clipsToBounds = NO;
        scrollView.pagingEnabled = YES;
        [self.contentView addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(explore.mas_bottom).offset(10.0);
            make.left.equalTo(self.contentView).offset(20.0);
            make.right.equalTo(self.contentView).offset(-20.0);
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
            [exploreView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(exploreView);
                make.left.equalTo(exploreView).offset((ScreenWidth -40) * i);
                make.width.mas_equalTo(ScreenWidth-40);
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
        
       // [self loadNetworking];
    }
    return self;
}

-(void)loadNetworking
{
    HomeViewModel *HomeVM = [HomeViewModel new];
    HomeVM.param.value = @{@"collections":@"",@"client_id":API_Client_ID};
   
  
    [[HomeVM.result listenedBy:self] withBlock:^(ExampleModelName * _Nullable rootModel) {
        Urls *urlGroups = rootModel.urls;
        User *user = rootModel.user;
      
    //添加滴水动画
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:urlGroups.full] placeholderImage:self.headerImageView.image options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            CATransition *transition = [[CATransition alloc]init];
            transition.type = @"rippleEffect";
            transition.duration = 1.0;
            [self.headerImageView.layer addAnimation:transition forKey:@"rain"];
            self.location.text = [NSString stringWithFormat:@"Photo by %@",user.name];
        }];
       
    }];
   
     NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:15.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
         HomeVM.param.value = @{@"collections":@"",@"client_id":API_Client_ID};

    }];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
   
    // HeadImageView  stretching
    if (offsetY < -HeaderImageHeight) {
        [self.headerImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(offsetY);
            make.height.mas_equalTo(-offsetY);
        }];
    }
}

@end
