//
//  HomeScrollView.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "HomeScrollView.h"
#import "HomeViewModel.h"
#import "NewViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ExploreViewModel.h"

@interface HomeScrollView()<UIScrollViewDelegate,UISearchBarDelegate,UISearchControllerDelegate>

/**
 顶部图片视图 可缩放，
 */
@property (nonatomic,strong) UIImageView *headerImageView;

/**
 主滑动视图的内容视图 加载主页所有内容
 */
@property (nonatomic,strong) UIView *contentView;

/**
 中部 Explore 滑动视图
 */
@property (nonatomic,strong) UIScrollView * ExploreScrollView;

/**
 顶部图片视图 label ,用来显示制作者
 */
@property (nonatomic,strong) UILabel *headImageViewName;

/**
 New 图片视图 数组
 */
@property (nonatomic,strong) NSMutableArray *NewImageGroups;


/**
 New 图片 作者
 */
@property (nonatomic,strong) NSMutableArray *authorLabel;


@property (nonatomic,assign) NSInteger per_page;


/**
 Explore 图片数组
 */
@property (nonatomic,strong) NSMutableArray *insideImageViewGroup;

/**
 Explore 主题标题
 */
@property (nonatomic,strong) NSMutableArray *themeGroup;

@property (nonatomic,strong) UISearchController *searchVC;




@end
@implementation HomeScrollView


#pragma getter
-(UISearchController *)searchVC
{
    if (!_searchVC) {
        _searchVC = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchVC.delegate = self;
        
        _searchVC.searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchVC.dimsBackgroundDuringPresentation = YES;
        
    }
    return _searchVC;
}
/**
 init MainScrollView

 @param frame ViewController Setting
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.TapNode = [EZRMutableNode new];
        //self.offsetYNode = [EZRMutableNode new];
        self.per_page = 30;
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
        imageView.userInteractionEnabled = YES;
        imageView.backgroundColor = [randomColor colorWithAlphaComponent:0.7];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self addSubview:imageView];
       
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.height.mas_equalTo(HeaderImageHeight);
            make.top.equalTo(self.contentView).offset(-HeaderImageHeight);

        }];
        
        
        //顶部遮罩视图
        UIView *bgHeaderImageView = [UIView new];
        bgHeaderImageView.userInteractionEnabled = NO;
        bgHeaderImageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [imageView addSubview:bgHeaderImageView];
        [bgHeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(imageView);
        }];
         _headerImageView = imageView;
        
        
        //顶部图片作者
        UILabel *location = [[UILabel alloc]init];
        location.textColor =[UIColor whiteColor];
        location.font = [UIFont boldSystemFontOfSize:13.f];
        [imageView addSubview:location];
        [location mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(imageView).offset(-5.0);
            make.centerX.equalTo(imageView);
        }];
        _headImageViewName = location;
    

        
    
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
        self.insideImageViewGroup = [NSMutableArray array];
        self.themeGroup = [NSMutableArray array];
        for (int i = 0 ; i < self.per_page; i++) {
            UIView *view = [[UIView alloc]init];
            [exploreView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(exploreView);
                make.left.equalTo(exploreView).offset((ScreenWidth -40) * i);
                make.width.mas_equalTo(ScreenWidth-40);
            }];
            
            UIImageView *insideImageView = [[UIImageView alloc]init];
            insideImageView.userInteractionEnabled =YES;
            insideImageView.backgroundColor = randomColor;
            
            
            [view addSubview:insideImageView];
            [insideImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view).offset(10.0);
                make.right.equalTo(view).offset(-10.0);
                make.top.bottom.equalTo(view);
            }];
            
            insideImageView.layer.cornerRadius = 10.f;
            insideImageView.layer.masksToBounds = YES;
            [self.insideImageViewGroup addObject:insideImageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
            insideImageView.tag = 100 + i;
            [insideImageView addGestureRecognizer:tap];
            
            UIView *maskView = [UIView new];
            maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
            maskView.userInteractionEnabled =NO;
            [insideImageView addSubview:maskView];
            [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(insideImageView);
            }];
            
            
            UILabel *theme = [[UILabel alloc]init];
            theme.font = [UIFont boldSystemFontOfSize:23.f];
            theme.textColor = [UIColor whiteColor];

            theme.textAlignment = NSTextAlignmentCenter;
            [insideImageView addSubview:theme];
            [theme mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(insideImageView);
            }];


            [self.themeGroup addObject:theme];
        }
       
        [exploreView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo((ScreenWidth -40) * self.per_page -1);
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
        self.NewImageGroups = [NSMutableArray array];
        self.authorLabel = [NSMutableArray array];
        for (int j = 0; j < self.per_page; j++) {
            UIImageView *newView = [[UIImageView alloc]init];
            newView.backgroundColor = [randomColor colorWithAlphaComponent:0.8];
            newView.userInteractionEnabled = YES;
            [self.contentView addSubview:newView];
            [newView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(NewLabel.mas_bottom).offset(10.0 + ScreenHeight/2.0 *j);
                make.left.right.equalTo(self.contentView);
                make.height.mas_equalTo(ScreenHeight/2.0 -2);
            }];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
            newView.tag = 200 + j;
            [newView addGestureRecognizer:tap];
            
            
            UILabel *author = [[UILabel alloc]init];
            author.textColor = [UIColor whiteColor];
            author.font = [UIFont systemFontOfSize:13.f];
            [newView addSubview:author];
            [author mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(newView).offset(-5.0);
                make.left.equalTo(newView).offset(5.0);
            }];
            [self.authorLabel addObject:author];
            
            [self.NewImageGroups addObject:newView];
            if (j == self.per_page -1) {
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
    //header Image Request
    HomeViewModel *HomeVM = [HomeViewModel new];
    HomeVM.param.value = @{@"collections":@"",@"client_id":API_Client_ID};
    [[HomeVM.result listenedBy:self] withBlock:^(ExampleModelName * _Nullable rootModel) {
        Urls *urlGroups = rootModel.urls;
        User *user = rootModel.user;

    //添加滴水动画
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:urlGroups.regular] placeholderImage:self.headerImageView.image options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            CATransition *transition = [[CATransition alloc]init];
            transition.type = @"rippleEffect";
            transition.duration = 1.0;
            [self.headerImageView.layer addAnimation:transition forKey:@"rain"];
            self.headImageViewName.text = [NSString stringWithFormat:@"Photo by %@",user.name];
        }];

    }];

    NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:15.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
         HomeVM.param.value = @{@"collections":@"",@"client_id":API_Client_ID};

    }];


    //New Image Groups
    NewViewModel *newVM = [NewViewModel new];
    newVM.param.value = @{@"client_id":API_Client_ID,@"page":@"",@"per_page":[NSNumber numberWithInteger:self.per_page],@"order_by":@""};
    [[newVM.result listenedBy:self] withBlock:^(NSArray * _Nullable array) {
        for (int i = 0; i < self.NewImageGroups.count; i++) {
            UIImageView *imageView = [self.NewImageGroups objectAtIndex:i];
            UILabel *label = [self.authorLabel objectAtIndex:i];
            ExampleModelName *rootModel = [array objectAtIndex:i];
            Urls *urls = rootModel.urls;
            User *user = rootModel.user;
            label.text  = user.name;
            [imageView sd_setImageWithURL:[NSURL URLWithString:urls.full] placeholderImage:nil options:SDWebImageRetryFailed];
        }
    }];
    
    // Explore Request
    ExploreViewModel *ExploreVM = [[ExploreViewModel alloc]init];
   
    ExploreVM.param.value = @{@"client_id":API_Client_ID,@"page":@"",@"per_page":[NSNumber numberWithInteger:self.per_page]};
   
    [[ExploreVM.result listenedBy:self] withBlock:^(NSArray * _Nullable array) {
        for (int i = 0; i < array.count; i++) {
            NSDictionary *dic = array[i];
            NSDictionary *url = dic[@"cover_photo"][@"urls"];

            UIImageView *imageView = [self.insideImageViewGroup objectAtIndex:i];
            UILabel *title  = [self.themeGroup objectAtIndex:i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:url[@"regular"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       title.text = dic[@"title"];
            }];

        }
    }];
}
#pragma scrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
  
    // HeadImageView  stretching
    if (offsetY < 0) {
        CGFloat value = -offsetY;
        CGFloat MAX = HeaderImageHeight;
       // self.headerImageView.alpha = value/MAX;
        [self.headerImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(offsetY);
            make.height.mas_equalTo(-offsetY);
        }];
        //self.offsetYNode.value = [NSNumber numberWithFloat:value];
    }
    
}

-(void)tapClick:(UITapGestureRecognizer *)sender
{
    
    self.TapNode.value = sender;
}
@end
