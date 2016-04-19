//
//  HMCommonItem.h
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//  用一个HMCommonItem模型来描述每行的信息：图标、标题、子标题、右边的样式（箭头、文字、数字、开关、打钩）

#import <Foundation/Foundation.h>

@interface HMCommonItem : NSObject
/** 图标 */
@property (nonatomic, copy) NSString *icon;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 子标题 */
@property (nonatomic, copy) NSString *subtitle;

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;
@end
