//
//  HMUserTool.m
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMUserTool.h"
#import "MJExtension.h"
#import "HMHttpTool.h"

@implementation HMUserTool
+ (void)userInfoWithParam:(HMUserInfoParam *)param success:(void (^)(HMUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/users/show.json" param:param resultClass:[HMUserInfoResult class] success:success failure:failure];
}

+ (void)unreadCountWithParam:(HMUnreadCountParam *)param success:(void (^)(HMUnreadCountResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" param:param resultClass:[HMUnreadCountResult class] success:success failure:failure];
}
@end
