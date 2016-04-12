//
//  HMStatusDetailFrame.h
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMGlobal.h"
#import <Foundation/Foundation.h>
@class HMStatus, HMStatusOriginalFrame, HMStatusRetweetedFrame;

@interface HMStatusDetailFrame : NSObject
@property (nonatomic, strong) HMStatusOriginalFrame *originalFrame;
@property (nonatomic, strong) HMStatusRetweetedFrame *retweetedFrame;

/** 微博数据 */
@property (nonatomic, strong) HMStatus *status;

/**
 *  自己的frame
 */
@property (nonatomic, assign) CGRect frame;
@end
