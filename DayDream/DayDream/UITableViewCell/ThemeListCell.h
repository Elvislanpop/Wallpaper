//
//  ThemeListCell.h
//  DayDream
//
//  Created by DayDream on 2019/4/9.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThemeListCell : UITableViewCell
@property (nonatomic,strong) NSDictionary *dic;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end

NS_ASSUME_NONNULL_END
