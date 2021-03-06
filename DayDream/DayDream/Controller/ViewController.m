//
//  ViewController.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "ViewController.h"
#import  "HomeScrollView.h"
#import "SearchTableView.h"
#import "PopIntroductionController.h"
#import "ThemeViewController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate,UISearchControllerDelegate>
@property (nonatomic,strong) HomeScrollView *MainScrollView;
@property (nonatomic,strong) UISearchController *searchVC;

@end

@implementation ViewController
-(UISearchController *)searchVC
{
    if (!_searchVC) {
        _searchVC = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchVC.delegate = self;
        _searchVC.dimsBackgroundDuringPresentation = NO;
        SearchTableView *searchView = [[SearchTableView alloc]initWithFrame:CGRectMake(0, IPhoneX?88:64, ScreenWidth, IPhoneX?ScreenHeight-88:ScreenHeight -64)];
        [_searchVC.view addSubview:searchView];
        _searchVC.searchBar.searchBarStyle = UISearchBarStyleMinimal;
      
    }
    return _searchVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.MainScrollView = [[HomeScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.MainScrollView];

    
    if (@available(iOS 11,*)) {
        [self.MainScrollView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    else
    {
         [self automaticallyAdjustsScrollViewInsets];
    }
    
   
    [self setListenObject];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBar];

}
-(void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setLargeTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
}
-(void)setNavigationBar
{
    self.title = @"Photos for everyone";
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    [self.navigationController.navigationBar setLargeTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIColor *color = [[UIColor redColor] colorWithAlphaComponent:0.0];
    UIImage *image = [UIImage new];
    
    [self.navigationController.navigationBar setBackgroundImage:[image imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
  //  self.navigationItem.hidesSearchBarWhenScrolling =NO;
    
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
   
    clearView.frame = CGRectMake(0, 0, ScreenWidth, 44.0);
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"Atom"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 40, 40);
    [clearView addSubview:button];

    UIButton *setting =[UIButton buttonWithType:UIButtonTypeCustom];
    [setting setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    [setting addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    setting.frame = CGRectMake(ScreenWidth -50, 0, 40, 40);
    [clearView addSubview:setting];
    
    
    self.navigationItem.titleView = clearView;
    self.navigationItem.searchController = self.searchVC;
    
}

-(void)setListenObject
{
    [[self.MainScrollView.TapNode listenedBy:self] withBlock:^(UITapGestureRecognizer*  _Nullable sender) {
        
        NSLog(@"---%ld ---",[sender view].tag);
        if ([sender view].tag < 200) {
            ThemeViewController *theme = [ThemeViewController new];
            theme.requestTitle =  [self.MainScrollView.exploreTitle objectAtIndex:[sender view].tag -100];
            [self.navigationController pushViewController:theme animated:YES];
        }
        
    } on:dispatch_get_main_queue()];
    
    [[self.MainScrollView.offsetYNode listenedBy:self] withBlock:^(NSNumber * _Nullable offsetY) {
        NSLog(@"%ff",[offsetY floatValue]);
         UIImage *image = [UIImage new];
        if ([offsetY floatValue] > 15) {
            UIColor *color = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
           
            [self.navigationController.navigationBar setBackgroundImage:[image imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        }
        else
        {
            UIColor *color = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
            [self.navigationController.navigationBar setBackgroundImage:[image imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        }
    
    }];
    
}
-(void)buttonClick:(UIButton *)button
{
    
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
}


#pragma POPDelegate

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
