//
//  HMEmotionGridView.h
//  猫头鹰助理
//
//  Created by sam on 16/4/15.
//  Copyright © 2016年 sam. All rights reserved.
//  一个HMEmotionGridView展示一页的表情

#import <UIKit/UIKit.h>

@interface HMEmotionGridView : UIView
/** 需要展示的所有表情 */
@property (nonatomic, strong) NSArray *emotions;
@end