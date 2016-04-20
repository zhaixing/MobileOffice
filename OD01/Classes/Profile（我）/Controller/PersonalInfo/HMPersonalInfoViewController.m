//
//  HMPersonalInfoViewController.m
//  口袋助理
//
//  Created by sam on 16/4/20.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMPersonalInfoViewController.h"
#import "HMGlobal.h"
#import "HMSettingViewController.h"
#import "HMCommonGroup.h"
#import "HMCommonItem.h"
#import "HMCommonArrowItem.h"
#import "HMCommonSwitchItem.h"
#import "HMCommonLabelItem.h"
#import "HMGeneralSettingViewController.h"

@interface HMPersonalInfoViewController ()

@end

@implementation HMPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"个人信息";
    
    // 初始化模型数据
    [self setupGroups];
    
}

/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}

- (void)setupGroup0
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonArrowItem *userImage = [HMCommonArrowItem itemWithTitle:@"头像"];
    
    HMCommonLabelItem *userName = [HMCommonLabelItem itemWithTitle:@"姓名"];
    userName.text=@"程鹏远";
    
    HMCommonLabelItem *sex = [HMCommonLabelItem itemWithTitle:@"性别"];
    sex.text=@"男";
    group.items = @[userImage,userName,sex];
}

- (void)setupGroup1
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    HMCommonLabelItem *company = [HMCommonLabelItem itemWithTitle:@"公司"];
    company.text=@"爱看影视";
    
    HMCommonLabelItem *zhiwei = [HMCommonLabelItem itemWithTitle:@"部门职位"];
    zhiwei.text=@"架构师";
    
    HMCommonLabelItem *gonghao = [HMCommonLabelItem itemWithTitle:@"工号"];
    gonghao.text=@"20122792";
    
    HMCommonLabelItem *phone = [HMCommonLabelItem itemWithTitle:@"联系方式"];
    phone.text=@"18633848128";
    
    HMCommonLabelItem *mail = [HMCommonLabelItem itemWithTitle:@"邮箱"];
    mail.text=@"674917570@qq.com";
    
    HMCommonLabelItem *address = [HMCommonLabelItem itemWithTitle:@"地址"];
    address.text=@"石家庄铁道大学";
    
    group.items = @[company, zhiwei,gonghao,phone,mail,address];
}

- (void)setupGroup2
{
    // 1.创建组
    HMCommonGroup *group = [HMCommonGroup group];
    [self.groups addObject:group];
    group.header=@"隐私信息(只有管理员才能查看)";
    // 2.设置组的所有行数据
    HMCommonLabelItem *birthday = [HMCommonLabelItem itemWithTitle:@"生日"];
    birthday.text=@"3月18";
    
    HMCommonLabelItem *jiguan = [HMCommonLabelItem itemWithTitle:@"籍贯"];
    jiguan.text=@"石家庄";
    
    HMCommonLabelItem *minzu = [HMCommonLabelItem itemWithTitle:@"民族"];
    minzu.text=@"汉族";
    
    HMCommonLabelItem *idcard = [HMCommonLabelItem itemWithTitle:@"身份证"];
    idcard.text=@"130182199003181995";
    
    HMCommonLabelItem *hunyin = [HMCommonLabelItem itemWithTitle:@"婚姻状况"];
    hunyin.text=@"未婚";
    
    HMCommonLabelItem *zinv = [HMCommonLabelItem itemWithTitle:@"子女"];
    zinv.text=@"无";
    
    HMCommonLabelItem *zhuzhi = [HMCommonLabelItem itemWithTitle:@"住址"];
    zhuzhi.text=@"322宿舍";
    
    HMCommonLabelItem *jinjiphone = [HMCommonLabelItem itemWithTitle:@"紧急联系人"];
    jinjiphone.text=@"15227882612";
    
    HMCommonLabelItem *ruzhi = [HMCommonLabelItem itemWithTitle:@"入职日期"];
    ruzhi.text=@"2016年6月";
    
    HMCommonLabelItem *biye = [HMCommonLabelItem itemWithTitle:@"毕业日期"];
    biye.text=@"2016年6月";
    
    group.items = @[birthday, jiguan, minzu ,idcard , hunyin, zinv, zhuzhi, jinjiphone, ruzhi, biye];
}
@end
