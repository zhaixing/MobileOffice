//
//  HMCommonItem.m
//  猫头鹰助理
//
//  Created by sam on 16/4/19.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMCommonItem.h"

@implementation HMCommonItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon
{
    HMCommonItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title icon:nil];
}

@end
