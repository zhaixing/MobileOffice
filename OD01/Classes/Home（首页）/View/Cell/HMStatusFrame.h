//
//  HMStatusFrame.h
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//  一个frame包括一个cell内部所有子控件的frame数据和显示数据

#import <Foundation/Foundation.h>
#import "HMGlobal.h"
@class HMStatus, HMStatusDetailFrame;

@interface HMStatusFrame : NSObject
/** 子控件的frame数据 */
@property (nonatomic, assign) CGRect toolbarFrame;
@property (nonatomic, strong) HMStatusDetailFrame *detailFrame;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 微博数据 */
@property (nonatomic, strong) HMStatus *status;
@end
