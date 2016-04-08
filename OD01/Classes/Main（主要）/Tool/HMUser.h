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
/**
 *  string 友好显示名称
 */
@property (nonatomic,copy) NSString *name;

/**
 *  string 用户头像地址50*50像素
 */
@property (nonatomic,copy) NSString *profile_image_url;

+(instancetype)userWithDict:(NSDictionary *)dict;

@end
