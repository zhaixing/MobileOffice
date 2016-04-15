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
@interface HMEmotionKeyboard() <HMEmotionToolbarDelegate>
/** 表情列表 */
@property (nonatomic, weak) HMEmotionListView *listView;
/** 表情工具条 */
@property (nonatomic, weak) HMEmotionToolbar *toollbar;

/** 默认表情 */
@property (nonatomic, strong) NSArray *defaultEmotions;
/** emoji表情 */
@property (nonatomic, strong) NSArray *emojiEmotions;
/** 浪小花表情 */
@property (nonatomic, strong) NSArray *lxhEmotions;
@end

@implementation HMEmotionKeyboard

- (NSArray *)defaultEmotions
{
    if (!_defaultEmotions) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"iinfo.plist" ofType:nil];
        self.defaultEmotions = [HMEmotion objectArrayWithFile:plist];
    }
    return _defaultEmotions;
}

- (NSArray *)emojiEmotions
{
    if (!_emojiEmotions) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"emojiinfo.plist" ofType:nil];
//        HMLog(@"路径a%@",plist);
        self.emojiEmotions = [HMEmotion objectArrayWithFile:plist];
        
//        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"emojiinfo.plist" ofType:nil];
//        HMLog(@"路径%@",plistPath);
//        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
//        NSLog(@"键盘emoji%@", data);//直接打印数据。
    }
    return _emojiEmotions;
}

- (NSArray *)lxhEmotions
{
    if (!_lxhEmotions) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"lxh_info.plist" ofType:nil];
        self.lxhEmotions = [HMEmotion objectArrayWithFile:plist];
    }
    return _lxhEmotions;
}

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
            self.listView.emotions = self.defaultEmotions;
            break;
            
        case HMEmotionTypeEmoji: // Emoji
            self.listView.emotions = self.emojiEmotions;
            break;
            
        case HMEmotionTypeLxh: // 浪小花
            self.listView.emotions = self.lxhEmotions;
            break;
            
        default:
            break;
    }
    
    HMLog(@"%d %@", self.listView.emotions.count, [self.listView.emotions firstObject]);
}
@end