//
//  HMUserInfoParam.h
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMUserInfoParam : NSObject
/**	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。*/
@property (nonatomic, copy) NSString *access_token;

/** false	int64	需要查询的用户ID。*/
@property (nonatomic, copy) NSString *uid;
@end