//
//  HMEmotionToolbar.h
//  猫头鹰助理
//
//  Created by sam on 16/4/15.
//  Copyright © 2016年 sam. All rights reserved.
//  表情底部的工具条

#import <UIKit/UIKit.h>
@class HMEmotionToolbar;

typedef enum {
    HMEmotionTypeRecent, // 最近
    HMEmotionTypeDefault, // 默认
    HMEmotionTypeEmoji, // Emoji
    HMEmotionTypeLxh // 浪小花
} HMEmotionType;

@protocol HMEmotionToolbarDelegate <NSObject>

@optional
- (void)emotionToolbar:(HMEmotionToolbar *)toolbar didSelectedButton:(HMEmotionType)emotionType;
@end

@interface HMEmotionToolbar : UIView
@property (nonatomic, weak) id<HMEmotionToolbarDelegate> delegate;
@end
