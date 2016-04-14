//
//  UIDevice+Resolutions.m
//  猫头鹰助理
//
//  Created by sam on 16/4/14.
//  Copyright © 2016年 sam. All rights reserved.
//


#import "UIDevice+Resolutions.h"

@implementation UIDevice (Resolutions)

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 获取当前分辨率
 
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (UIDeviceResolution) currentResolution {
//    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
//        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
//            CGSize result = [[UIScreen mainScreen] bounds].size;
//            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
//             NSLog(@"%f",result.height);
//            if (result.height <= 480.0f) {
//                return UIDevice_iPhoneStandardRes;
//            }else if (result.height <= 960) {//iphone4/4s
//                return UIDevice_iPhoneHiRes;//返回值2，代表iPhone4/4s
//            }else if (result.height <= 1334) {//iphone6/6s
//               
//                return UIDevice_iPhone6Hires;//返回值3，代表iPhone6/6s
//            }else if (result.height <= 1336) {//iphone5/5s/5c
//                return UIDevice_iPhoneTallerHiRes;//返回值4，代表iPhone5/5s
//            }else{
//                return UIDevice_iPhone6PlusHires;//返回5，代表iPhone6Plus/6sPlus
//            }
////            return (result.height > 1920 ? UIDevice_iPhone6PlusHires : UIDevice_iPhoneTallerHiRes);
//        } else
//            return UIDevice_iPhoneStandardRes;
//    } else
//        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_iPadHiRes : UIDevice_iPadStandardRes);
//
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
//    NSLog(@"%f",result.height);
    if (result.height <= 480.0f) {
        return UIDevice_iPhoneStandardRes;
    }else if (result.height <= 960) {//iphone4/4s
        return UIDevice_iPhoneHiRes;//返回值4，代表iPhone4/4s
    }else if (result.height <= 1136) {//iphone5/5s/5c
        return UIDevice_iPhoneTallerHiRes;//返回值5，代表iPhone5/5s
    }else if (result.height <= 1334) {//iphone6/6s
        return UIDevice_iPhone6Hires;//返回值6，代表iPhone6/6s
    }else{
        return UIDevice_iPhone6PlusHires;//返回7，代表iPhone6Plus/6sPlus
    }

    /**
    //屏幕尺寸
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    NSLog(@"print %f,%f",width,height);
    
    //分辨率
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    HMLog(@"%f,%f",width*scale_screen,height*scale_screen);
     */
}

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 当前是否运行在iPhone5端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone5{
    if ([self currentResolution] == UIDevice_iPhoneTallerHiRes) {
        return YES;
    }
    return NO;
}

+(BOOL)isRunningOniPhone6{
    if ([self currentResolution]== UIDevice_iPhone6Hires) {
        return YES;
    }
    return NO;
}

+(BOOL)isRunningOniPhone6Plus{
    if ([self currentResolution]==UIDevice_iPhone6PlusHires) {
        return YES;
    }
    return NO;
}
/******************************************************************************
 函数名称 : + (BOOL)isRunningOniPhone
 函数描述 : 当前是否运行在iPhone端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

@end
