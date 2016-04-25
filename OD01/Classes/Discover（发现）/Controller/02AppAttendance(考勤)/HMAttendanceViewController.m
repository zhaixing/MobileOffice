//
//  HMAttendanceViewController.m
//  口袋助理
//
//  Created by sam on 16/4/21.
//  Copyright © 2016年 sam. All rights reserved.
//
#import "HMGlobal.h"
#import "HMAttendanceViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface HMAttendanceViewController ()<CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager *locationManager;
@property (nonatomic,weak)UILabel *locationSite;
@end

@implementation HMAttendanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.设置这个ViewController的样式
    [self yangShi];
    
    //2.导航功能
    [self location];
}

#pragma mark - 样式
/**
 *  设置这个ViewController的样式
 */
-(void)yangShi
{
    //1.view的样式
    self.title=@"考勤";
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *rqview=[[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 120)];
    rqview.backgroundColor=themeColor;
    [self.view addSubview:rqview];
    
    //获取现在时间
    NSDate *datet = [NSDate date];//现在时间
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendars = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendars setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendars components:calendarUnit fromDate:datet];
    
    NSInteger unitFlagss = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    
    theComponents = [calendars components:unitFlagss fromDate:datet];
    int week = [theComponents weekday];
    int year = [theComponents year];
    int month = [theComponents month];
    int day = [theComponents day];
//    int hour=[theComponents hour];
//    int minute=[theComponents minute];
    
//    NSLog(@"%d年%d月",year,month);
//    NSLog(@"%d",day);
//    NSLog(@"%@",[weekdays objectAtIndex:theComponents.weekday]);//显示星期几
//    NSLog(@"%d:%d",hour,minute);
//    NSString *timeNow=[NSString stringWithFormat:@"%d:%d",hour,minute];
    //    m_labDate.text=[NSString stringWithFormat:@"%d年%d月",year,month];
    //    m_labToday.text=[NSString stringWithFormat:@"%d",day];
    //    m_labWeek.text=[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week]];
    
    //2.星期label
    UILabel *xingqi=[[UILabel alloc] initWithFrame:CGRectMake(35, 80, self.view.width*0.4, 50)];
    xingqi.textColor=[UIColor whiteColor];
//    xingqi.text=@"星期一";
    xingqi.text=[weekdays objectAtIndex:theComponents.weekday];
    
    xingqi.font=[UIFont systemFontOfSize:30];
    [self.view addSubview:xingqi];
    
    //3.日期label
    UILabel *riqi=[[UILabel alloc] initWithFrame:CGRectMake(35, 130, self.view.width*0.5, 30)];
    
//    riqi.text=@"2016年4月25日";
    NSString *riqiStr=[NSString stringWithFormat:@"%d年%d月%d日",year,month,day];
    riqi.text=riqiStr;
    
    riqi.textColor=[UIColor whiteColor];
    [self.view addSubview:riqi];
    
    //上班
    [self createBtnS];
    
    //下班
    [self createBtnX];
    
}

#pragma mark - 功能

-(void)createBtnS
{
    //1.创建button
    UIButton *phone =[[UIButton alloc]init];
    
    //2.尺寸
    CGFloat x = self.view.frame.size.width * 0.05;
    phone.frame=CGRectMake(x,200,self.view.frame.size.width * 0.9,110);
    
    //3.设置内容
    NSString *prefix1 = @"已签到";
    
    //时间
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSLog(@"---%@",dateTime);
    
    NSString *name1 =[NSString stringWithFormat:@"签到时间%@",dateTime] ;
    NSString *text1 = [NSString stringWithFormat:@"%@\n%@", prefix1, name1];
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:text1];
    [string1 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:[text1 rangeOfString:prefix1]];//prefix的样式
    [string1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text1 rangeOfString:name1]];//name的样式
    phone.titleLabel.numberOfLines=0;//允许换行
//    phone.titleLabel.attributedText=string1;//把设计好的字符串 赋值给 控件
    phone.titleLabel.textAlignment = 0;
    
    

    
    NSString *prefix = @"签到";
    NSString *name = @"";
    NSString *text = [NSString stringWithFormat:@"%@%@", prefix, name];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:[text rangeOfString:prefix]];//prefix的样式
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text rangeOfString:name]];//name的样式
    phone.titleLabel.numberOfLines=0;//允许换行
    phone.titleLabel.attributedText=string;//把设计好的字符串 赋值给 控件
    phone.titleLabel.textAlignment = 0;
    
    //    NSString *text = [NSString stringWithFormat:@"  客服QQ\n  8110 0093"];
    //    [phone setTitle:string forState:UIControlStateNormal];
    [phone setAttributedTitle:string forState:UIControlStateNormal];//把设计好的字符串 赋值给 控件
    [phone setAttributedTitle:string1 forState:UIControlStateDisabled];
    
    [phone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *name3 = [UIImage resizedImage:@"locate_bubble.png"];
    [phone setBackgroundImage:name3 forState:UIControlStateNormal];
    
    [phone setImage:[UIImage imageNamed:@"WADListSignInBtnNormal"] forState:UIControlStateNormal];
    [phone setImage:[UIImage imageNamed:@"WADListSignInBtnDisable"] forState:UIControlStateSelected];
    //[button setImageEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#向上偏移量>, <#CGFloat left#向左偏移量>, <#CGFloat bottom#向下偏移量>, <#CGFloat right#向右偏移量>)];
    [phone setImageEdgeInsets:UIEdgeInsetsMake(15, -30, 15, 0)];
    
    //    [phone setTitle:@"喜欢"forState:UIControlStateHighlighted];
    //    [phone setTitleColor:[UIColor orangeColor]forState:UIControlStateHighlighted];
    //    UIImage *name4 = [UIImage imageNamed:@"locate_bubble.png"];
    //    [phone setImage:name4 forState:UIControlStateHighlighted];
    [phone addTarget:self action:@selector(createBtnSClicked:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:phone];
}

-(void)createBtnSClicked:(id)sender
{
    UIButton *btn=(UIButton *)sender;
//    NSLog(@"%@",sender);
    btn.enabled=NO;
    
    UILabel *locationSite=[[UILabel alloc]initWithFrame:CGRectMake(0, 450, self.view.width, 50)];
    locationSite.text=@"您的当前位置:经度：114.503860,纬度：38.083051,海拔：88.603271";
    locationSite.numberOfLines=0;
    [self.view addSubview:locationSite];
    //    locationSite.text=[NSString stringWithFormat:@"您的当前位置:经度：%f,纬度：%f,海拔：%f,航向：%f,速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed];
}
-(void)createBtnX
{
    //1.创建button
    UIButton *button2 =[[UIButton alloc]init];
    
    //2.尺寸
    CGFloat x = self.view.frame.size.width * 0.05;
    button2.frame=CGRectMake(x,320,self.view.frame.size.width * 0.9,110);
    
    //3.设置内容
    NSString *prefix1 = @"已签退";
    
    //时间
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
//    NSLog(@"---%@",dateTime);
    
    NSString *name1 =[NSString stringWithFormat:@"签退时间%@",dateTime] ;
    NSString *text1 = [NSString stringWithFormat:@"%@\n%@", prefix1, name1];
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:text1];
    [string1 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:[text1 rangeOfString:prefix1]];//prefix的样式
    [string1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text1 rangeOfString:name1]];//name的样式
    button2.titleLabel.numberOfLines=0;//允许换行
    //    phone.titleLabel.attributedText=string1;//把设计好的字符串 赋值给 控件
    button2.titleLabel.textAlignment = 0;
    
    NSString *prefix = @"签退";
    NSString *name = @"";
    NSString *text = [NSString stringWithFormat:@"%@%@", prefix, name];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:[text rangeOfString:prefix]];//prefix的样式
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text rangeOfString:name]];//name的样式
    button2.titleLabel.numberOfLines=0;//允许换行
    button2.titleLabel.attributedText=string;//把设计好的字符串 赋值给 控件
    button2.titleLabel.textAlignment = 0;
    
    //    NSString *text = [NSString stringWithFormat:@"  客服QQ\n  8110 0093"];
    //    [button2 setTitle:string forState:UIControlStateNormal];
    [button2 setAttributedTitle:string forState:UIControlStateNormal];//把设计好的字符串 赋值给 控件
    
    [button2 setAttributedTitle:string1 forState:UIControlStateDisabled];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *name3 = [UIImage resizedImage:@"locate_bubble.png"];
    [button2 setBackgroundImage:name3 forState:UIControlStateNormal];
    
    [button2 setImage:[UIImage imageNamed:@"WADListSignOutBtnNormal"] forState:UIControlStateNormal];
    
    //[button setImageEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#向上偏移量>, <#CGFloat left#向左偏移量>, <#CGFloat bottom#向下偏移量>, <#CGFloat right#向右上偏移量>)];
    [button2 setImageEdgeInsets:UIEdgeInsetsMake(15, -30, 15, 15)];
    
    //    [button2 setTitle:@"喜欢"forState:UIControlStateHighlighted];
    //    [button2 setTitleColor:[UIColor orangeColor]forState:UIControlStateHighlighted];
    //    UIImage *name4 = [UIImage imageNamed:@"locate_bubble.png"];
    //    [button2 setImage:name4 forState:UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(createBtnXClicked:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

-(void)createBtnXClicked:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    btn.enabled=NO;

    self.locationSite.text=@"之后";
}
/**
 *  导航功能
 */
-(void)location
{
    //初始化locationManger管理器对象
    CLLocationManager *locationManager=[[CLLocationManager alloc]init];
    self.locationManager=locationManager;
    
    //判断当前设备定位服务是否打开
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"设备尚未打开定位服务");
    }
    
    //判断当前设备版本大于iOS8以后的话执行里面的方法
    if ([UIDevice currentDevice].systemVersion.floatValue >=8.0) {
        //持续授权
        [locationManager requestAlwaysAuthorization];
        //当用户使用的时候授权
        [locationManager requestWhenInUseAuthorization];
    }
    
    //或者使用这种方式,判断是否存在这个方法,如果存在就执行,没有的话就忽略
    //if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
    //   [locationManager requestWhenInUseAuthorization];
    //}
    
    //设置代理
    locationManager.delegate=self;
    //设置定位的精度
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    //设置定位的频率,这里我们设置精度为10,也就是10米定位一次
    CLLocationDistance distance=10;
    //给精度赋值
    locationManager.distanceFilter=distance;
    //开始启动定位
    [locationManager startUpdatingLocation];
    

}

/**
 *  定位频率
 *
 *  @param 上面我们设置的是10米              <#上面我们设置的是10米 description#>
 *  @param 也就是当位置发生>10米的时候该代理方法就会调用 <#也就是当位置发生>10米的时候该代理方法就会调用 description#>
 *
 *  @return <#return value description#>
 */
//当位置发生改变的时候调用(上面我们设置的是10米,也就是当位置发生>10米的时候该代理方法就会调用)
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //取出第一个位置
    CLLocation *location=[locations firstObject];
    NSLog(@"%@",location.timestamp);
    //位置坐标
    CLLocationCoordinate2D coordinate=location.coordinate;
    NSLog(@"您的当前位置:经度：%f,纬度：%f,海拔：%f,航向：%f,速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    //如果不需要实时定位，使用完即使关闭定位服务
    //[_locationManager stopUpdatingLocation];
    
   

}

#pragma mark - 自学获取当前时间
//NSDate *  senddate=[NSDate date];
//
//NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
//
//[dateformatter setDateFormat:@"YYYYMMdd"];
//
//NSString *  locationString=[dateformatter stringFromDate:senddate];
//
//NSLog(@"locationString:%@",locationString);
//
//[dateformatter release];


-(NSString *)getCurrentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    return dateTime;
}

#pragma mark - 自学 代码创建label
//UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,100,300,150)];
//label.text = @"Hello world!";
//
////背景颜色为红色
//label.backgroundColor= [UIColor redColor];
//
////设置字体颜色为白色
//label.textColor= [UIColor whiteColor];
//
////文字居中显示
//label.textAlignment= UITextAlignmentCenter;
//
////自动折行设置
//label.lineBreakMode= UILineBreakModeWordWrap;
//label.numberOfLines= 0;
//
////设置字体
//label.font=[UIFont fontWithName:@"Arial-BoldItalicMT" size:32];
//
//
////设置阴影的颜色
//label.shadowColor= [UIColor blackColor]

#pragma mark - 自学 代码创建label
////事件监听的问题
//CGRect btn2Frame = CGRectMake(100.0, 150.0, 60.0, 44.0);
////两种不同的方式创建
//UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//btn2.frame =btn2Frame;
////设置Title
//[btn2 setTitle:@"BTN2" forState:UIControlStateNormal];
////[btn2 setBackgroundImage:[UIImage imageNamed:@"pic.png"] forState:UIControlStateNormal];
//[btn2 setBackgroundColor:[UIColor blueColor]];
//[btn2 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
//[self.view addSubview:btn2];
//
//-(void)btnPressed:(id)sender{
//    UIButton* btn = (UIButton*)sender;
//    NSLog(@"====>name");
//    //    UIButton* thisBtn = (UIButton *)sender;
//    //    [[[UIAlertView alloc] initWithTitle:@"Button" message:[NSString stringWithFormat: @"This is button:%@ action",thisBtn] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
//    
//}
@end
