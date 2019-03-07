//
//  ViewController.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "ViewController.h"
#import  "HomeScrollView.h"
#import "SearchViewController.h"
#import "PopIntroductionController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property (nonatomic,strong) HomeScrollView *MainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.MainScrollView = [[HomeScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.MainScrollView];
//    [self.MainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    if (@available(iOS 11,*)) {
        [self.MainScrollView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    else
    {
         [self automaticallyAdjustsScrollViewInsets];
    }
    
    
    
    
    UIView *topNavigationBarView = [UIView new];
    topNavigationBarView.userInteractionEnabled = NO;
    [self.view addSubview:topNavigationBarView];
    [topNavigationBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(IPhoneX?88:64);
    }];
    
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.backgroundImage = [UIImage new];
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.alpha = 0;
    [topNavigationBarView addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topNavigationBarView).offset(20.0);
        make.right.equalTo(topNavigationBarView).offset(-20.0);
      
        make.top.equalTo(topNavigationBarView).offset(IPhoneX?34:20);
        make.bottom.equalTo(topNavigationBarView).offset(-5.0);
    }];
    
    //receive listen
    
    [[self.MainScrollView.offsetYNode listenedBy:self] withBlock:^(NSNumber * _Nullable number) {
        CGFloat offset = [number floatValue];
        CGFloat height = HeaderImageHeight;
        CGFloat alpha = offset/height;
        topNavigationBarView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:(1.0- alpha)* 0.95];
        searchBar.alpha = 1.0 - alpha;
        if (searchBar.alpha  >0.8) {
            topNavigationBarView.userInteractionEnabled = YES;
        }
        else
            topNavigationBarView.userInteractionEnabled = NO;
    }];
    
    [[self.MainScrollView.searchBarNode listenedBy:self] withBlock:^(UISearchBar * _Nullable next) {
        
        SearchViewController *VC = [[SearchViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }];
    
    [[self.MainScrollView.buttonNode listenedBy:self] withBlock:^(UIButton * _Nullable button) {
        PopIntroductionController *VC = [[PopIntroductionController alloc]init];
        //  弹出视图的显示样式
        VC.modalPresentationStyle = UIModalPresentationPopover;
        VC.preferredContentSize = CGSizeMake(ScreenWidth/4.0 * 3.0, ScreenWidth/2.0);
        UIPopoverPresentationController *popVC = [VC popoverPresentationController];
        popVC.delegate = self;
        popVC.permittedArrowDirections = UIPopoverArrowDirectionUp;//设置箭头位置
        
        popVC.sourceView = button;//设置目标视图
        popVC.sourceRect = button.bounds;//弹出视图显示位置
        popVC.backgroundColor = [UIColor whiteColor];//设置弹窗背景颜色(效果图里红色区域)
        [self presentViewController:VC animated:YES completion:nil];
    }];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}
-(void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (BOOL) popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
    return YES;
    
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
    return UIModalPresentationNone;
    
}
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
    NSLog(@"dismissed");
    
}
@end
