//
//  HMStatusToolbar.h
//  猫头鹰助理
//
//  Created by sam on 16/4/11.
//  Copyright © 2016年 sam. All rights reserved.
//  封装底部工具条

#import <UIKit/UIKit.h>
@class HMStatus;
@interface HMStatusToolbar : UIImageView
@property (nonatomic,assign) HMStatus *status;
@end
