//
//  HMBaseParam.m
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMBaseParam.h"
#import "HMAccountTool.h"
#import "HMAccount.h"

@implementation HMBaseParam
- (id)init
{
    if (self = [super init]) {
        self.access_token = [HMAccountTool account].access_token;
    }
    return self;
}

+ (instancetype)param
{
    return [[self alloc] init];
}
@end
