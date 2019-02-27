//
//  ExploreViewModel.h
//  DayDream
//
//  Created by DayDream on 2019/2/26.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ExploreViewModel : NSObject
@property (nonatomic,strong) EZRMutableNode <NSDictionary *> *param;
@property (nonatomic,strong) EZRNode <NSArray *> *result;
@property (nonatomic,strong) EZRNode <NSError *> *error;

-(instancetype)init;
@end

NS_ASSUME_NONNULL_END
