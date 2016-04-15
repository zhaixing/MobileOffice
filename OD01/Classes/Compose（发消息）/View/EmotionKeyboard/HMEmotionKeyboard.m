//
//  HMEmotionKeyboard.m
//  猫头鹰助理
//
//  Created by sam on 16/4/14.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionKeyboard.h"
#import "HMEmotionListView.h"
#import "HMGlobal.h"
#import "MJExtension.h"
#import "HMEmotion.h"
#import "HMEmotionToolbar.h"
//
//#define HMEmotionToolbarButtonMaxCount 4

@interface HMEmotionKeyboard()
/** 表情列表 */
@property (nonatomic, weak) HMEmotionListView *listView;
/** 表情工具条 */
@property (nonatomic, weak) UIView *toollbar;
///** 记录当前选中的按钮 */
//@property (nonatomic, weak) UIButton *selectedButton;


/** 默认表情 */
@property (nonatomic, strong) NSArray *defaultEmotions;
/** emoji表情 */
@property (nonatomic, strong) NSArray *emojiEmotions;
/** 浪小花表情 */
@property (nonatomic, strong) NSArray *lxhEmotions;
@end

@implementation HMEmotionKeyboard
//
//+ (instancetype)keyboard
//{
//    return [[self alloc] init];
//}
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // 1.添加表情列表
//        HMEmotionListView *listView = [[HMEmotionListView alloc] init];
//        listView.backgroundColor = [UIColor greenColor];
//        [self addSubview:listView];
//        self.listView = listView;
//        
//        // 2.添加表情工具条
//        UIView *toollbar = [[UIView alloc] init];
//        [self addSubview:toollbar];
//        self.toollbar = toollbar;
//        
//        // 3.添加4个工具条按钮
//        [self setupToolbarButton:@"最近"];
//        UIButton *defaultButton = [self setupToolbarButton:@"默认"];
//        [self setupToolbarButton:@"Emoji"];
//        [self setupToolbarButton:@"浪小花"];
//        
//        // 4.默认选中“默认”按钮
//        [self toolbarButtonClick:defaultButton];
//    }
//    return self;
//}
//
///**
// *  添加工具条按钮
// *
// *  @param title 按钮文字
// */
//- (UIButton *)setupToolbarButton:(NSString *)title
//{
//    UIButton *button = [[UIButton alloc] init];
//    
//    // 文字
//    [button setTitle:title forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
//    [button addTarget:self action:@selector(toolbarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    button.titleLabel.font = [UIFont systemFontOfSize:13];
//    
//    // 添加按钮
//    [self.toollbar addSubview:button];
//    
//    // 设置背景图片
//    int count = self.toollbar.subviews.count;
//    if (count == 1) { // 第一个按钮
//        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_left_normal"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_left_selected"] forState:UIControlStateSelected];
//    } else if (count == HMEmotionToolbarButtonMaxCount) { // 最后一个按钮
//        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_right_normal"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_right_selected"] forState:UIControlStateSelected];
//    } else { // 中间按钮
//        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_mid_normal"] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_mid_selected"] forState:UIControlStateSelected];
//    }
//    
//    return button;
//}
//
///**
// *  监听工具条按钮点击
// */
//- (void)toolbarButtonClick:(UIButton *)button
//{
//    self.selectedButton.selected = NO;
//    button.selected = YES;
//    self.selectedButton = button;
//}
//
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    // 1.设置工具条的frame
//    self.toollbar.width = self.width;
//    self.toollbar.height = 35;
//    self.toollbar.y = self.height - self.toollbar.height;
//    
//    // 2.设置表情列表的frame
//    self.listView.width = self.width;
//    self.listView.height = self.toollbar.y;
//    
//    // 3.设置工具条按钮的frame
//    CGFloat buttonW = self.toollbar.width / HMEmotionToolbarButtonMaxCount;
//    CGFloat buttonH = self.toollbar.height;
//    for (int i = 0; i<HMEmotionToolbarButtonMaxCount; i++) {
//        UIButton *button = self.toollbar.subviews[i];
//        button.width = buttonW;
//        button.height = buttonH;
//        button.x = i * buttonW;
//    }
//}
//@end


- (NSArray *)defaultEmotions
{
    if (!_defaultEmotions) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        self.defaultEmotions = [HMEmotion objectArrayWithFile:plist];
    }
    return _defaultEmotions;
}

- (NSArray *)emojiEmotions
{
    if (!_emojiEmotions) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        self.emojiEmotions = [HMEmotion objectArrayWithFile:plist];
    }
    return _emojiEmotions;
}

- (NSArray *)lxhEmotions
{
    if (!_lxhEmotions) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
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