//
//  HMGlobal.h
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMHttpTool.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"

// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 是否为4inch
#define FourInch ([UIScreen mainScreen].bounds.size.height == 568.0)

#define HMRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//#10a984
#define themeColor [UIColor colorWithRed:17/255.0 green:169/255.0 blue:132/255.0 alpha:1.0]


#define HMNavigationTitleFont [UIFont boldSystemFontOfSize:17]

//打印，如果调试就有打印信息，如果发布就没有打印信息
#ifdef DEBUG//调试状态
#define HMLog(...) NSLog(__VA_ARGS__)
#else//发布状态
#define HMLog(...)
#endif

#define HMAppKey @"558495401"
#define HMAppSecret @"862e3e02417afdf4bdbbb07751551b08"
#define HMRedirectURI @"http://www.baidu.com"


// 屏幕尺寸
#define HMScreenW [UIScreen mainScreen].bounds.size.width

// cell的计算参数
// cell的内边距
#define HMStatusCellInset 10

// 原创微博昵称字体
#define HMStatusOrginalNameFont [UIFont systemFontOfSize:14]
// 原创微博时间字体
#define HMStatusOrginalTimeFont [UIFont systemFontOfSize:12]
// 原创微博来源字体
#define HMStatusOrginalSourceFont HMStatusOrginalTimeFont
// 原创微博正文字体
#define HMStatusOrginalTextFont [UIFont systemFontOfSize:15]

// 转发微博昵称字体
#define HMStatusRetweetedNameFont HMStatusOrginalNameFont
// 转发微博正文字体
#define HMStatusRetweetedTextFont HMStatusOrginalTextFont


@interface HMGlobal : NSObject

@end
