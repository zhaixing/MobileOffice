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
    _emotion=emotion;
    
    if (emotion.code) { // emoji表情
        // emotion.code == 0x1f603 --> \u54367
        // emoji的大小取决于字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:32];
        [self setTitle:emotion.emoji forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    } else { // 图片表情
        NSString *icon = [NSString stringWithFormat:@"%@%@", emotion.directory, emotion.png];
        [self setImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
