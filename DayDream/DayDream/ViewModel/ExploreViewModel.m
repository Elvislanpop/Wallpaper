//
//  ExploreViewModel.m
//  DayDream
//
//  Created by DayDream on 2019/2/26.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import "ExploreViewModel.h"

@implementation ExploreViewModel
-(instancetype)init
{
    if (self = [super init]) {
        _param = [EZRMutableNode new];
        
        EZRNode *resultNode =  [_param flattenMap:^EZRNode * _Nullable(NSDictionary * _Nullable param) {
            EZRMutableNode *returnNode = [EZRMutableNode new];
            [HYDNetwork GETWithURL:[NSString stringWithFormat:@"%@/collections",APIBasePath] parameters:param cachePolicy:HYDCachePolicyIgnoreCache callback:^(id responseObject, NSError *error) {
                if (error) {
                    returnNode.value = error;
                }
                else
                {
                    if ([responseObject isKindOfClass:NSArray.class]) {
                       // NSArray *array  = [ExampleModelName mj_objectArrayWithKeyValuesArray:responseObject];
                    
                        returnNode.value = responseObject;
                        
                    }
                }
            }];
            return returnNode;
            
        }];
        
        
        EZRIFResult *SeparationNode = [resultNode if:^BOOL(id  _Nullable result) {
            return [result isKindOfClass:NSArray.class];
        }];
        _result = SeparationNode.thenNode;
        _error = SeparationNode.elseNode;
    }
    return self;
}
@end
