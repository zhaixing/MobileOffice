//
//  HMEmotionView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/15.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionView.h"
#import "HMEmotion.h"
#import "HMGlobal.h"

@implementation HMEmotionView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted=NO;
    }
    return self;
    
}
-(void)setEmotion:(HMEmotion *)emotion
{
    _emotion = emotion;
    
    if (emotion.code) { // emoji表情
        // 取消动画效果
        [UIView setAnimationsEnabled:NO];
        // 设置emoji表情
        self.titleLabel.font = [UIFont systemFontOfSize:32];
        [self setTitle:emotion.emoji forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
        // 再次开启动画
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView setAnimationsEnabled:YES];
        });
    } else { // 图片表情
        NSString *icon = [NSString stringWithFormat:@"%@%@", emotion.directory, emotion.png];
        UIImage *image = [UIImage imageWithName:icon];
        if (iOS7) { // 不需要进行蓝色的渲染
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        [self setImage:image forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
    }
}

@end
