//
//  HMHomeStatusesResult.h
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//  封装加载首页微博数据的返回结果

#import <Foundation/Foundation.h>

@interface HMHomeStatusesResult : NSObject
/** 微博数组（装着HMStatus模型） */
@property (nonatomic, strong) NSArray *statuses;

/** 近期的微博总数 */
@property (nonatomic, assign) int total_number;
@end

