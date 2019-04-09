//
//  ThemeListCell.m
//  DayDream
//
//  Created by DayDream on 2019/4/9.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "ThemeListCell.h"
@interface ThemeListCell()
@property (nonatomic,strong) UIImageView *MainimageView;
@property (nonatomic,strong) UILabel *title;

@end
@implementation ThemeListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = randomColor;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        self.MainimageView = imageView;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"23131";
        title.font = [UIFont systemFontOfSize:14.f];
        title.textColor = [UIColor whiteColor];
        [imageView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imageView);
            make.bottom.equalTo(imageView).offset(-5.0);
        }];
        
        self.title = title;
    }
    return  self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    NSDictionary *url = dic[@"cover_photo"][@"urls"];
  
    [self.MainimageView sd_setImageWithURL:[NSURL URLWithString:url[@"regular"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.title.text = dic[@"title"];
    }];
}
@end
