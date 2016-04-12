//
//  HMUser.m
//  猫头鹰助理
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMUser.h"

@implementation HMUser
-(BOOL)isVip
{
    //是会员
    return self.mbtype >2;
}
@end
