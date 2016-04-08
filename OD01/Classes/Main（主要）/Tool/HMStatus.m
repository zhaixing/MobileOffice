//
//  HMStatus.m
//  猫头鹰助理
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatus.h"
#import "HMUser.h"

@implementation HMStatus

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    HMStatus *status = [[self alloc] init];
    
    status.text = dict[@"text"];
    
    status.user = [HMUser userWithDict:dict[@"user"]];
    
    NSDictionary *retweetedDict = dict[@"retweeted_status"];
    if (retweetedDict) {
        status.retweeted_status = [HMStatus statusWithDict:retweetedDict];
    }
    
    return status;
}
@end
