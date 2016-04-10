//
//  HMAccount.h
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//
/**
 *  账号模型
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param weak      <#weak description#>
 *
 *  @return <#return value description#>
 */

#import <Foundation/Foundation.h>

@interface HMAccount : NSObject  <NSCoding>
/** string 	用于调用access_token，接口获取授权后的access token。*/
@property (nonatomic, copy) NSString *access_token;

/** string 	access_token的生命周期，单位是秒数。*/
@property (nonatomic, copy) NSString *expires_in;

/** 过期时间 */
@property (nonatomic, strong) NSDate *expires_time;

/** string 	当前授权用户的UID。*/
@property (nonatomic, copy) NSString *uid;

/**
 *  用户昵称
 */
@property (nonatomic, copy) NSString *name;

+ (instancetype)accountWithDict:(NSDictionary *)dict;
@end
