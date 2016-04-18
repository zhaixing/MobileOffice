//
//  HMEmotionKeyboard.m
//  猫头鹰助理
//
//  Created by sam on 16/4/14.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionKeyboard.h"
#import "HMEmotionListView.h"
#import "HMEmotionToolbar.h"
#import "MJExtension.h"
#import "HMEmotion.h"
#import "HMGlobal.h"
#import "HMEmotionTool.h"

@interface HMEmotionKeyboard() <HMEmotionToolbarDelegate>
/** 表情列表 */
@property (nonatomic, weak) HMEmotionListView *listView;
/** 表情工具条 */
@property (nonatomic, weak) HMEmotionToolbar *toollbar;
@end

@implementation HMEmotionKeyboard

+ (instancetype)keyboard
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"emoticon_keyboard_background"]];
        
        // 1.添加表情列表
        HMEmotionListView *listView = [[HMEmotionListView alloc] init];
        listView.backgroundColor=[UIColor whiteColor];
        [self addSubview:listView];
        self.listView = listView;
        
        // 2.添加表情工具条
        HMEmotionToolbar *toollbar = [[HMEmotionToolbar alloc] init];
        toollbar.delegate = self;
        [self addSubview:toollbar];
        self.toollbar = toollbar;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置工具条的frame
    self.toollbar.width = self.width;
    self.toollbar.height = 35;
    self.toollbar.y = self.height - self.toollbar.height;
    
    // 2.设置表情列表的frame
    self.listView.width = self.width;
    self.listView.height = self.toollbar.y;
}

#pragma mark - HMEmotionToolbarDelegate
- (void)emotionToolbar:(HMEmotionToolbar *)toolbar didSelectedButton:(HMEmotionType)emotionType
{
    switch (emotionType) {
        case HMEmotionTypeDefault:// 默认
            self.listView.emotions = [HMEmotionTool defaultEmotions];
            break;
            
        case HMEmotionTypeEmoji: // Emoji
            self.listView.emotions = [HMEmotionTool emojiEmotions];
            break;
            
        case HMEmotionTypeLxh: // 浪小花
            self.listView.emotions = [HMEmotionTool lxhEmotions];
            break;
            
        case HMEmotionTypeRecent: // 最近
            self.listView.emotions = [HMEmotionTool recentEmotions];
            break;
    }


    
//    HMLog(@"%d %@", self.listView.emotions.count, [self.listView.emotions firstObject]);
}
@end