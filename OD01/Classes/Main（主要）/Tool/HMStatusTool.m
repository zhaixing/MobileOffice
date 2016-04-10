//
//  HMStatusTool.m
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatusTool.h"
#import "HMHttpTool.h"
#import "MJExtension.h"

@implementation HMStatusTool

+ (void)homeStatusesWithParam:(HMHomeStatusesParam *)param success:(void (^)(HMHomeStatusesResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/statuses/home_timeline.json" param:param resultClass:[HMHomeStatusesResult class] success:success failure:failure];
}

+ (void)sendStatusWithParam:(HMSendStatusParam *)param success:(void (^)(HMSendStatusResult *))success failure:(void (^)(NSError *))failure
{
    [self postWithUrl:@"https://api.weibo.com/2/statuses/update.json" param:param resultClass:[HMSendStatusResult class] success:success failure:failure];
}

@end
