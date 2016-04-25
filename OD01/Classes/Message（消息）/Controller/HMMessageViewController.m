//
//  HMMessageViewController.m
//  OD01
//
//  Created by sam on 16/4/6.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMMessageViewController.h"
#import "HMGlobal.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface HMMessageViewController ()<ABPeoplePickerNavigationControllerDelegate>{
    ABPeoplePickerNavigationController *_abPeoplePickerVc;
}

@end

@implementation HMMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
    
    
    
    
//    //通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
//    UIBarButtonItem *appearance=[UIBarButtonItem appearance];
//    //设置普通状态的文字属性
//    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName]=themeColor;
//    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    
//    //设置不可用状态（disable）的文字属性
//    NSMutableDictionary *disableTextAttrs=[NSMutableDictionary dictionary];
//    disableTextAttrs[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
//    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateNormal];

    
    //右上角的写私信
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"写私信" forState:UIControlStateNormal];
    [button setTitleColor:themeColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    button.sizeToFit;
    
     // 监听按钮点击
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(xieSiXin) forControlEvents:UIControlEventTouchUpInside];
//     self.navigationItem.rightBarButtonItem.enabled = NO;
    
    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写消息" style:UIBarButtonItemStyleDone target:nil action:nil];
    //让这个按钮不可用
//    self.navigationItem.rightBarButtonItem.enabled=YES;
    
}
-(void)xieSiXin
{
    HMLog(@"xieSiXin---");
    
    //下面是调用系统通讯录
    _abPeoplePickerVc = [[ABPeoplePickerNavigationController alloc] init];
    _abPeoplePickerVc.peoplePickerDelegate = self;
    //下面的判断是ios8之后才需要加的，不然会自动返回app内部
    if(iOS8){
        /**
         *  predicateForSelectionOfPerson默认是true
         （当你点击某个联系人查看详情的时候会返回app），如果你默认为true 但是实现-peoplePickerNavigationController:didSelectPerson:property:identifier:
         　　　　　　   代理方法也是可以的，与此同时不能实现peoplePickerNavigationController: didSelectPerson:不然还是会返回app。
         */
        //总之在ios8之后加上此句比较稳妥
        _abPeoplePickerVc.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
        //predicateForSelectionOfProperty默认是true （当你点击某个联系人的某个属性的时候会返回app），此方法只要是默认值，无论你代理方法实现与否都会返回app。
        //_abPeoplePickerVc.predicateForSelectionOfProperty = [NSPredicate predicateWithValue:false];
        
        //predicateForEnablingPerson默认是true，当设置为false时，所有的联系人都不能被点击。
        //        _abPeoplePickerVc.predicateForEnablingPerson = [NSPredicate predicateWithValue:true];
    }
    [self presentViewController:_abPeoplePickerVc animated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationItem.rightBarButtonItem.enabled=NO;
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
    cell.textLabel.text=[NSString stringWithFormat:@"消息测试数据----%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newVc=[[UIViewController alloc] init];
    newVc.view.backgroundColor=[UIColor blueColor];
    newVc.title=@"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}



#pragma mark - ABPeoplePickerNavigationController的代理方法
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        long index = ABMultiValueGetIndexForIdentifier(phone,identifier);

        NSString *phoneNO = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, index);
        [phoneNO stringByReplacingOccurrencesOfString:@"-" withString:@""];
        if (phone && phoneNO.length == 11) {
                //TODO：获取电话号码要做的事情
                [peoplePicker dismissViewControllerAnimated:YES completion:nil];
                return;
        }else{
            if (iOS8){
                UIAlertController *tipVc = [UIAlertController alertControllerWithTitle:nil message:@"请选择正确手机号" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
                }];
                [tipVc addAction:cancleAction];
                [self presentViewController:tipVc animated:YES completion:nil];
                
            }else{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请选择正确手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
            //非ARC模式需要释放对象
            //        [alertView release];
        }
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person NS_AVAILABLE_IOS(8_0)
{
    ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
    personViewController.displayedPerson = person;
    [peoplePicker pushViewController:personViewController animated:YES];
    //非ARC模式需要释放对象
    //    [personViewController release];
}
/**
peoplePickerNavigationController点击取消按钮时调用
*/
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}
@end
