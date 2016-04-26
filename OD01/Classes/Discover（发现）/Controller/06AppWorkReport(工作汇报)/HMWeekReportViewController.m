//
//  HMWeekReportViewController.m
//  口袋助理
//
//  Created by sam on 16/4/26.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMWeekReportViewController.h"

@interface HMWeekReportViewController ()

@end

@implementation HMWeekReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc] initWithFrame:self.view.frame];
    [label setText:@"weekViewController"];
    label.textAlignment=1;
    [label setFont:[UIFont systemFontOfSize:25]];
    
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor blueColor]];
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
