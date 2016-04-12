//
//  HMStatusOriginalFrame.h
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import <Foundation/Foundation.h>
@class HMStatus;

@interface HMStatusOriginalFrame : NSObject
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 来源 */
@property (nonatomic, assign) CGRect sourceFrame;
/** 时间 */
@property (nonatomic, assign) CGRect timeFrame;
/** 头像 */
@property (nonatomic, assign) CGRect iconFrame;
/** 会员图标 */
@property (nonatomic, assign) CGRect vipFrame;
/** 自己的frame */
@property (nonatomic, assign) CGRect frame;

/** 微博数据 */
@property (nonatomic, strong) HMStatus *status;
@end