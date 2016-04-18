//
//  HMEmotionPopView.m
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMEmotionPopView.h"
#import "HMEmotionView.h"
#import "HMGlobal.h"

@interface HMEmotionPopView()
@property (weak, nonatomic) IBOutlet HMEmotionView *emotionView;


@end
@implementation HMEmotionPopView

+(instancetype)popView{
    return [[[NSBundle mainBundle] loadNibNamed:@"HMEmotionPopView" owner:nil options:nil] lastObject];
}


- (void)showFromEmotionView:(HMEmotionView *)fromEmotionView
{
    // 1.显示表情
    self.emotionView.emotion = fromEmotionView.emotion;
    
    // 2.添加到窗口上
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    
    // 3.设置位置
    CGFloat centerX = fromEmotionView.center.x;
    CGFloat centerY = fromEmotionView.center.y - self.height * 0.5;
    CGPoint center = CGPointMake(centerX, centerY);
    self.center = [window convertPoint:center fromView:fromEmotionView.superview];
}

- (void)dismiss
{
    [self removeFromSuperview];
}

-(void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"emoticon_keyboard_magnifier"] drawInRect:rect];
}
@end
