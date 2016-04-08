//
//  HMUser.m
//  猫头鹰助理
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMUser.h"

@implementation HMUser

+ (instancetype)userWithDict:(NSDictionary *)dict
{
    HMUser *user = [[self alloc] init];
    user.name = dict[@"name"];
    user.profile_image_url = dict[@"profile_image_url"];
    return user;
}
@end
