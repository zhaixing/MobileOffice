//
//  HMEmotionPopView.h
//  猫头鹰助理
//
//  Created by sam on 16/4/18.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMEmotionView;
@interface HMEmotionPopView : UIView
+(instancetype)popView;

/**
 *  显示表情弹出控件
 *
 *  @param emotionView 从哪个表情上面弹出
 */
- (void)showFromEmotionView:(HMEmotionView *)fromEmotionView;
- (void)dismiss;
@end
