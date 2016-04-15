//
//  HMComposeToolBar.m
//  猫头鹰助理
//
//  Created by sam on 16/4/9.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMComposeToolBar.h"
#import "UIView+Extension.h"
@interface HMComposeToolbar()
@property (nonatomic, weak) UIButton *emotionButton;
@end
@implementation HMComposeToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_bottom_bg"]];
        
        // 添加所有的子控件
        [self addButtonWithIcon:@"anon_chat_bottom_photo_nor" highIcon:@"anon_chat_bottom_photo_press" tag:HMComposeToolBarButtonTypePicture];
        [self addButtonWithIcon:@"anon_chat_bottom_Camera_nor" highIcon:@"anon_chat_bottom_Camera_press" tag:HMComposeToolBarButtonTypeCamera];
        [self addButtonWithIcon:@"compose_mentionbutton_background_os7" highIcon:@"compose_mentionbutton_background_highlighted_os7" tag:HMComposeToolBarButtonTypeMention];
        [self addButtonWithIcon:@"anon_chat_bottom_PTT_nor" highIcon:@"anon_chat_bottom_PTT_press" tag:HMComposeToolBarButtonTypeAudio];
        [self addButtonWithIcon:@"chat_bottom_PTV_nor" highIcon:@"chat_bottom_PTV_press" tag:HMComposeToolBarButtonTypeCamaro];
//        [self addButtonWithIcon:@"anon_chat_bottom_emotion_nor" highIcon:@"anon_chat_bottom_emotion_press" tag:HMComposeToolBarButtonTypeEmotion];
        self.emotionButton = [self addButtonWithIcon:@"anon_chat_bottom_emotion_nor" highIcon:@"anon_chat_bottom_emotion_press" tag:HMComposeToolBarButtonTypeEmotion];
    }
    return self;
}

- (void)setShowEmotionButton:(BOOL)showEmotionButton
{
    _showEmotionButton = showEmotionButton;
    if (showEmotionButton) { // 显示表情按钮
        [self.emotionButton setImage:[UIImage imageNamed:@"anon_chat_bottom_emotion_nor"] forState:UIControlStateNormal];
        [self.emotionButton setImage:[UIImage imageNamed:@"anon_chat_bottom_emotion_press"] forState:UIControlStateHighlighted];
    } else { // 切换为键盘按钮
        [self.emotionButton setImage:[UIImage imageNamed:@"anon_group_chat_bottom_keyboard_nor"] forState:UIControlStateNormal];
        [self.emotionButton setImage:[UIImage imageNamed:@"anon_group_chat_bottom_keyboard_press"] forState:UIControlStateHighlighted];
    }
}

/**
 *  添加一个按钮
 *
 *  @param icon     默认图标
 *  @param highIcon 高亮图标
 */
- (UIButton *)addButtonWithIcon:(NSString *)icon highIcon:(NSString *)highIcon tag:(HMComposeToolbarButtonType)tag
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    [self addSubview:button];
    return button;
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(composeTool:didClickedButton:)]) {
        [self.delegate composeTool:self didClickedButton:button.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    CGFloat buttonW = self.width / count;
    CGFloat buttonH = self.height;
    for (int i = 0; i<count; i++) {
        UIButton *button = self.subviews[i];
        button.y = 0;
        button.width = buttonW;
        button.height = buttonH;
        button.x = i * buttonW;
    }
}
@end
