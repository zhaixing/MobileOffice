//
//  HMUserTool.h
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMUserInfoParam.h"
#import "HMUserInfoResult.h"
#import "HMUnreadCountParam.h"
#import "HMUnreadCountResult.h"
#import "HMBaseTool.h"

@interface HMUserTool : HMBaseTool
/**
 *  加载用户的个人信息
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)userInfoWithParam:(HMUserInfoParam *)param success:(void (^)(HMUserInfoResult *result))success failure:(void (^)(NSError *error))failure;
+ (void)unreadCountWithParam:(HMUnreadCountParam *)param success:(void (^)(HMUnreadCountResult *result))success failure:(void (^)(NSError *error))failure;
@end
