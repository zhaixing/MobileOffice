//
//  HMHomeViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMHomeViewController.h"
#import "UIView+Extension.h"
#import "HMGlobal.h"
#import "UIBarButtonItem+Extension.h"
@interface HMHomeViewController ()

@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏按钮
//    UIButton *leftButton=[[UIButton alloc] init];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"WMFormRange"] forState:UIControlStateNormal];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"WMFormRangeSelected"] forState:UIControlStateHighlighted];
//    //设置按钮的尺寸为图片的尺寸 
//    leftButton.size=leftButton.currentBackgroundImage.size;
//    
//    [leftButton addTarget:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    //设置导航栏按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
}
-(void)friendSearch
{
    HMLog(@"friendSearch---");
}
-(void)pop
{
    HMLog(@"pop---");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"首页测试数据----%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newVc=[[UIViewController alloc] init];
    newVc.view.backgroundColor=[UIColor blueColor];
    newVc.title=@"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}
@end
