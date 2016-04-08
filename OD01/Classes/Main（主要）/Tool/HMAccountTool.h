//
//  HMAccountTool.h
//  OD01
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HMAccount;

@interface HMAccountTool : NSObject

/**
 *  存储帐号
 */
+ (void)save:(HMAccount *)account;

/**
 *  读取帐号
 */
+ (HMAccount *)account;

@end
