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
@interface ViewController ()
@property (nonatomic,strong) HomeScrollView *MainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.MainScrollView = [[HomeScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    if (@available(iOS 11,*)) {
        [self.MainScrollView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    else
    {
         [self automaticallyAdjustsScrollViewInsets];
    }
    
    
    [self.view addSubview:self.MainScrollView];
    
    [[self.MainScrollView.searchBarNode listenedBy:self] withBlock:^(UISearchBar * _Nullable next) {
        
        SearchViewController *VC = [[SearchViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }];
    // Do any additional setup after loading the view, typically from a nib.
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
@end
