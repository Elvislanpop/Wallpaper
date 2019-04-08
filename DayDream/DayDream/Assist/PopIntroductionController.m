//
//  PopIntroductionController.m
//  DayDream
//
//  Created by DayDream on 2019/3/5.
//  Copyright © 2019 蛤蛤. All rights reserved.
//
#define currentHeight   self.view.frame.size.width / 2.0
#import "PopIntroductionController.h"

@interface PopIntroductionController ()

@end

@implementation PopIntroductionController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Atom"]];
    
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(10);
        make.width.height.mas_equalTo(40.0);
    }];
    
    UILabel *title = [[UILabel alloc]init];
    title.textColor = [UIColor blackColor];
    title.text = @"DayDream";
    title.font = [UIFont boldSystemFontOfSize:21.f];
    [self.view addSubview:title];
    
    title.textAlignment = NSTextAlignmentCenter;
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.top.equalTo(imageView.mas_bottom).offset(5.0);
    }];
    
    UILabel *version = [[UILabel alloc]init];
    version.text = @" V1.0.0";
    version.textColor = [UIColor lightGrayColor];
    version.font = [UIFont systemFontOfSize:16.f];
    [self.view addSubview:version];
    [version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.top.equalTo(title.mas_bottom).offset(5.0);
        
    }];
    
    UIButton *website = [UIButton buttonWithType:UIButtonTypeCustom];
    [website setTitle:@" Visit daydream.top" forState:UIControlStateNormal];
    [website setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    website.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [self.view addSubview:website];
    [website mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(version.mas_bottom).offset(10.0);
        make.left.equalTo(self.view).offset(5.0);
        
    }];
    
    UIButton *license = [UIButton buttonWithType:UIButtonTypeCustom];
    [license setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [license setTitle:@" License" forState:UIControlStateNormal];
    license.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [self.view addSubview:license];
    [license mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(website.mas_bottom).offset(5.0);
        make.leading.equalTo(website);
    }];
    
//    UIView *maskView = [[UIView alloc]init];
//    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
//    [self.view addSubview:maskView];
//    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
}



@end
