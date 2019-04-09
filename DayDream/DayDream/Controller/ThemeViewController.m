//
//  ThemeViewController.m
//  DayDream
//
//  Created by DayDream on 2019/4/8.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "ThemeViewController.h"
#import "ThemeListCell.h"
#import "ThemeViewModel.h"
@interface ThemeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) ThemeViewModel *themeVM;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation ThemeViewController
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, IPhoneX?88:64, ScreenWidth, ScreenHeight - (IPhoneX?88:64)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ThemeListCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title =  self.requestTitle;
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.themeVM = [ThemeViewModel new];
    self.themeVM.param.value = [NSDictionary dictionaryWithObjectsAndKeys:API_Client_ID,@"client_id",self.requestTitle,@"query",@"1",@"page",@"10",@"per_page", nil];
    [[self.themeVM.result listenedBy:self] withBlock:^(NSArray * _Nullable resultArray) {
        self.dataArray = resultArray;
        [self.tableView reloadData];
    } on:dispatch_get_main_queue()];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getRandomNumber:250 to:500];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[ThemeListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.dic = [self.dataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
     CGFloat offsetY = scrollView.contentOffset.y;
     UIImage *image = [UIImage new];

}

-(int)getRandomNumber:(int)from to:(int)to

{
    int num = to -from+1;
    return (int)(from + (arc4random() % num));
    //+1,result is [from to]; else is [from, to)!!!!!!!
    
}
@end
