//
//  HMJiaBanViewController.h
//  口袋助理
//
//  Created by sam on 16/4/21.
//  Copyright © 2016年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "foldTableViewCell.h"

@interface HMJiaBanViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *testTableView;
- (foldTableViewCell *)tableViewCellForThing:(NSIndexPath *)indexPath;

@end
