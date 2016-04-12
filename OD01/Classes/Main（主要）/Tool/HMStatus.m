//
//  HMStatus.m
//  猫头鹰助理
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMStatus.h"
#import "MJExtension.h"
#import "HMPhoto.h"
#import "NSDate+MJ.h"

@implementation HMStatus
-(NSDictionary *)objectClassInArray
{
    return @{@"pic_ruls":[HMPhoto class]};
}

/**
 一、今年
 1、今天
 1分钟内：刚刚
 1个小时内：xx分钟前
 
 2、昨天
 昨天 xx:xx
 
 3、至少是前天发的
 04-23 xx:xx
 
 二、非今年
 2012-07-24
 */
// _created_at == Mon Jul 14 15:48:07 +0800 2014
// Mon Jul 14 15:48:07 +0800 2014 -> NSDate -> 2014-07-14 15:48:07


-(NSString *)created_at
{
    // Tue Apr 12 14:53:09 +0800 2016
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    //必须设置下面的强制采用en-US，否则真机调试失败
    fmt.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    
    // 获得微博发布的具体时间
    NSDate *createDate = [fmt dateFromString:_created_at];
//    HMLog(@"%@",createDate);
    // 判断是否为今年
    if (createDate.isThisYear) {
        if (createDate.isToday) { // 今天
            NSDateComponents *cmps = [createDate deltaWithNow];
            if (cmps.hour >= 1) { // 至少是1小时前发的
                return [NSString stringWithFormat:@"%ld小时前", (long)cmps.hour];
            } else if (cmps.minute >= 1) { // 1~59分钟之前发的
                return [NSString stringWithFormat:@"%ld分钟前", (long)cmps.minute];
            } else { // 1分钟内发的
                return @"刚刚";
            }
        } else if (createDate.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else { // 至少是前天
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt stringFromDate:createDate];
    }
}


//-(NSString *)source
//{
//    //<a href="http://app.weibo.com/t/feed/310OQS" rel="nofollow">精彩微客</a>
//    // 截取范围
////    NSRange range;
////    range.location = [_source rangeOfString:@">"].location + 1;
////    range.length = [_source rangeOfString:@"</"].location - range.location;
////    // 开始截取
////    NSString *subsource = [_source substringWithRange:range];
////    // 头部拼接一个“来自”
////    return [NSString stringWithFormat:@"来自%@", subsource];
//
//    //跟上面冲突
////    return _source;
//    return @"";
//}

//与上面冲突，上面是get方法，下面是set方法不会一直调用
- (void)setSource:(NSString *)source
{
//    // 截取范围
//    NSRange range;
//    range.location = [source rangeOfString:@">"].location + 1;
//    range.length = [source rangeOfString:@"</"].location - range.location;
//    // 开始截取
//    NSString *subsource = [source substringWithRange:range];
//    
//    _source = [NSString stringWithFormat:@"来自%@", subsource];
}

/**
 NSCalendar *calendar = [NSCalendar currentCalendar];
 // 获得日期的所有元素
 NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:createDate];
 
 HMLog(@"%d %d %d", cmps.year, cmps.month, cmps.day);
 
 // 转换成其他格式
 fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
 NSString *timeStr = [fmt stringFromDate:createDate];
 */

@end
