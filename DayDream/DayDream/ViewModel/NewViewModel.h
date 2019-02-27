//
//  NewViewModel.h
//  DayDream
//
//  Created by DayDream on 2019/2/25.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewViewModel : NSObject

@property (nonatomic,strong) EZRMutableNode <NSDictionary *> *param;
@property (nonatomic,strong) EZRNode <NSArray *> *result;
@property (nonatomic,strong) EZRNode <NSError *> *error;

-(instancetype)init;
@end

NS_ASSUME_NONNULL_END
