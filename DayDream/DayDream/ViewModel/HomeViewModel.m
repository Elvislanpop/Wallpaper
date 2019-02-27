//
//  HomeViewModel.m
//  DayDream
//
//  Created by DayDream on 2019/2/24.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "HomeViewModel.h"

@implementation HomeViewModel
-(instancetype)init
{
    if (self = [super init]) {
        _param = [EZRMutableNode new];
       
        EZRNode *resultNode =  [_param flattenMap:^EZRNode * _Nullable(NSDictionary * _Nullable param) {
            EZRMutableNode *returnNode = [EZRMutableNode new];
            [HYDNetwork GETWithURL:[NSString stringWithFormat:@"%@/photos/random",APIBasePath] parameters:param cachePolicy:HYDCachePolicyIgnoreCache callback:^(id responseObject, NSError *error) {
                if (error) {
                    returnNode.value = error;
                }
                else
                {
                    if ([responseObject isKindOfClass:NSDictionary.class]) {
                        ExampleModelName *rootModel = [ExampleModelName mj_objectWithKeyValues:responseObject];
                        returnNode.value = rootModel;
                    }
                }
            }];
            return returnNode;
            
        }];
        
        
        EZRIFResult *SeparationNode = [resultNode if:^BOOL(id  _Nullable result) {
            return [result isKindOfClass:ExampleModelName.class];
        }];
        _result = SeparationNode.thenNode;
        _error = SeparationNode.elseNode;
    }
    return self;
}
@end
