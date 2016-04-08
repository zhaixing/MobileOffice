//
//  HMStatus.m
//  猫头鹰助理
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMStatus.h"
#import "MJExtension.h"
#import "HMPhoto.h"

@implementation HMStatus
-(NSDictionary *)objectClassInArray
{
    return @{@"pic_ruls":[HMPhoto class]};
}
@end
