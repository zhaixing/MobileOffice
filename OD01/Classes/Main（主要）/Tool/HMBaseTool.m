//
//  HMBaseTool.m
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMBaseTool.h"
#import "HMHttpTool.h"
#import "MJExtension.h"

@implementation HMBaseTool
+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [HMHttpTool get:url params:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [HMHttpTool post:url params:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
