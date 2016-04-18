//
//  HMEmotionTool.h
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//  管理表情数据：加载表情数据、存储表情使用记录

#import <Foundation/Foundation.h>
@class HMEmotion;

@interface HMEmotionTool : NSObject
/**
 *  默认表情
 */
+ (NSArray *)defaultEmotions;
/**
 *  emoji表情
 */
+ (NSArray *)emojiEmotions;
/**
 *  浪小花表情
 */
+ (NSArray *)lxhEmotions;
/**
 *  最近表情
 */
+ (NSArray *)recentEmotions;
/**
 *  根据表情的文字描述找出对应的表情对象
 */
+ (HMEmotion *)emotionWithDesc:(NSString *)desc;


/**
 *  保存最近使用的表情
 */
+ (void)addRecentEmotion:(HMEmotion *)emotion;
@end
