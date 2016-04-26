//
//  HMCloudDetailViewController.m
//  口袋助理
//
//  Created by sam on 16/4/25.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMCloudDetailViewController.h"
#import "HMCommonArrowItem.h"
#import "HMCommonLabelItem.h"
#import "HMCommonGroup.h"
#import "HMGlobal.h"
@interface HMCloudDetailViewController ()

@end

@implementation HMCloudDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupGroup];
}

-(void)setupGroup
{
    HMCommonGroup *group=[HMCommonGroup group];
    [self.groups addObject:group];
    group.header=@"所有文件";
    HMCommonLabelItem *txt=[HMCommonLabelItem itemWithTitle:@"txt文件" icon:@"CDTxt"];
    txt.text=@"0.2M";
    HMCommonLabelItem *yasuo=[HMCommonLabelItem itemWithTitle:@"压缩文件" icon:@"CDCompressFile"];
    yasuo.text=@"1.7M";
    HMCommonLabelItem *excel=[HMCommonLabelItem itemWithTitle:@"Excel文件" icon:@"CDXls"];
    excel.text=@"3.2M";
    HMCommonLabelItem *doucument=[HMCommonLabelItem itemWithTitle:@"文档文件" icon:@"CDDoc"];
    doucument.text=@"1.2M";
    HMCommonLabelItem *pdf=[HMCommonLabelItem itemWithTitle:@"PDF文件" icon:@"CDPDF"];
    pdf.text=@"1.2M";
    HMCommonLabelItem *ppt=[HMCommonLabelItem itemWithTitle:@"PPT文件" icon:@"CDPpt"];
    ppt.text=@"1M";
    HMCommonLabelItem *mp3=[HMCommonLabelItem itemWithTitle:@"音乐文件" icon:@"CDMp3"];
    mp3.text=@"1.3M";
    group.items=@[txt,yasuo,excel,doucument,pdf,ppt,mp3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
