//
//  HMGlobal.h
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HMRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define themeColor [UIColor colorWithRed:17/255.0 green:169/255.0 blue:132/255.0 alpha:1.0]

#define HMNavigationTitleFont [UIFont boldSystemFontOfSize:17]

//打印，如果调试就有打印信息，如果发布就没有打印信息
#ifdef DEBUG//调试状态
#define HMLog(...) NSLog(__VA_ARGS__)
#else//发布状态
#define HMLog(...)
#endif

@interface HMGlobal : NSObject

@end
