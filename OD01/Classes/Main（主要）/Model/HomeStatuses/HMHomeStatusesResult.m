//
//  HMHomeStatusesResult.m
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMHomeStatusesResult.h"
#import "MJExtension.h"
#import "HMStatus.h"

@implementation HMHomeStatusesResult
- (NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [HMStatus class]};
}
@end
