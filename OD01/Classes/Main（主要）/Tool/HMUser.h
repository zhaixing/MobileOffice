//
//  HMUser.h
//  猫头鹰助理
//
//  Created by sam on 16/4/8.
//  Copyright © 2016年 sam. All rights reserved.
//

/**
 *  用户模型
 *字典转模型
 *  @param nonatomic <#nonatomic description#>
 *  @param copy      <#copy description#>
 *
 *  @return <#return value description#>
 */

#import <Foundation/Foundation.h>

@interface HMUser : NSObject
/**  string 友好显示名称 */
@property (nonatomic,copy) NSString *name;

/** string 用户头像地址50*50像素 */
@property (nonatomic,copy) NSString *profile_image_url;

/*  普通员工、组长、经理、CEO、产品经理*/
@property (nonatomic,assign) int mbtype;

/** 会员等级、在公司的等级*/
@property (nonatomic,assign) int mbrank;

@property (nonatomic,assign,getter=isVip,readonly) BOOL vip;

+(instancetype)userWithDict:(NSDictionary *)dict;

@end
