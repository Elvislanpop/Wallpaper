//
//  ViewController.m
//  DayDream
//
//  Created by DayDream on 2019/2/19.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "ViewController.h"
#import  "HomeScrollView.h"
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
    // Do any additional setup after loading the view, typically from a nib.
}


@end
