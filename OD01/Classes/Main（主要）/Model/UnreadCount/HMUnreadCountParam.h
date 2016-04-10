//
//  HMUnreadCountParam.h
//  猫头鹰助理
//
//  Created by sam on 16/4/10.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMBaseParam.h"

@interface HMUnreadCountParam : HMBaseParam
/** false	int64	需要查询的用户ID。*/
@property (nonatomic, copy) NSString *uid;
@end
