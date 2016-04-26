//
//  HMWorkReportTableViewController.m
//  口袋助理
//
//  Created by sam on 16/4/21.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMWorkReportTableViewController.h"
#import "SwipableViewController.h"
#import "HMDayReportViewController.h"
#import "HMWeekReportViewController.h"
#import "HMMounthReportViewController.h"
#import "HMDiscoverViewController.h"
@interface HMWorkReportTableViewController ()
{
    HMDayReportViewController *dayR;
    HMWeekReportViewController *weekR;
    HMMounthReportViewController *mounthR;
}
@property (nonatomic,strong) UINavigationController *naviController;
@end

@implementation HMWorkReportTableViewController
//
//-(BOOL)application:(UIApplication *)application
//didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions{
//    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    
//    dayR=[[HMDayReportViewController alloc]init];
//    weekR=[[HMWeekReportViewController alloc] init];
//    mounthR=[[HMMounthReportViewController alloc] init];
//    
//    SwipableViewController *viewController=[[SwipableViewController alloc] initWithTitle:@"工作汇报"
//andSubTitles:@[@"日报",@"周报",@"月报"] andControllers:@[dayR,weekR,mounthR]];
//    _naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    
//    self.window.rootViewController=_naviController;
//    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [self.window makeKeyAndVisible];
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //初始化
//    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    dayR=[[HMDayReportViewController alloc]init];
    weekR=[[HMWeekReportViewController alloc] init];
    mounthR=[[HMMounthReportViewController alloc] init];
    
    //使用框架Swipable
    SwipableViewController *viewController=[[SwipableViewController alloc] initWithTitle:@"工作汇报" andSubTitles:@[@"日报",@"周报",@"月报"] andControllers:@[dayR,weekR,mounthR]];
    [self.navigationController pushViewController:viewController animated:NO];
//    _naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    viewController.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_back"]
//                                                                                       style:UIBarButtonItemStylePlain
//                                                                                      target:self
//                                                                                      action:@selector(onClickMenuButton)];
//    
//    self.window.rootViewController=_naviController;
//    [self.window makeKeyAndVisible];
//
    
//    dayR=[[HMDayReportViewController alloc]init];
//    weekR=[[HMWeekReportViewController alloc] init];
//    mounthR=[[HMMounthReportViewController alloc] init];
//    
//    SwipableViewController *viewController=[[SwipableViewController alloc] initWithTitle:@"工作汇报" andSubTitles:@[@"日报",@"周报",@"月报"] andControllers:@[dayR,weekR,mounthR]];
//    
//    [self addNavigationItemForViewController:viewController];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
//    [self.window makeKeyAndVisible];
}


//
//- (UINavigationController *)addNavigationItemForViewController:(UIViewController *)viewController
//{
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    
//    
//     viewController.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"]
//     style:UIBarButtonItemStylePlain
//     target:self
//     action:@selector(onClickMenuButton)];
//     
//     viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
//     target:self
//     action:@selector(pushSearchViewController)];
//    
//    
//    
//    return navigationController;
//}


-(void)onClickMenuButton
{
    NSLog(@"onClickMenuButton");
    HMDiscoverViewController *discover = [[HMDiscoverViewController alloc] init];
    [self.navigationController pushViewController:discover animated:YES];
//    self.window.rootViewController=discover;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
