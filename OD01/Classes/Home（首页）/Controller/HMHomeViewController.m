//
//  HMHomeViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMHomeViewController.h"

@interface HMHomeViewController ()

@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
