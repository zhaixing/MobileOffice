//
//  HMCommonGroup.h
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//  用一个HMCommonGroup模型来描述每组的信息：组头、组尾、这组的所有行模型

#import <Foundation/Foundation.h>

@interface HMCommonGroup : NSObject
/** 组头 */
@property (nonatomic, copy) NSString *header;
/** 组尾 */
@property (nonatomic, copy) NSString *footer;
/** 这组的所有行模型(数组中存放的都是HMCommonItem模型) */
@property (nonatomic, strong) NSArray *items;

+ (instancetype)group;
@end
