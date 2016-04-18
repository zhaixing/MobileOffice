//
//  HMComposeViewController.m
//  OD01
//
//  Created by sam on 16/4/7.
//  Copyright © 2016年 sam. All rights reserved.
//

#import "HMComposeViewController.h"
#import "HMGlobal.h"
#import "HMTextView.h"
#import "HMComposeToolBar.h"
#import "HMComposePhotosView.h"
#import "HMAccountTool.h"
#import "HMAccount.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HMStatusTool.h"
#import "HMEmotionKeyboard.h"

@interface HMComposeViewController () <HMComposeToolbarDelegate,UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, weak) HMTextView *textView;
@property (nonatomic,weak) HMComposeToolbar *toolbar;
@property (nonatomic,weak) HMComposePhotosView *photosView;
@property (nonatomic, strong) HMEmotionKeyboard *kerboard;
/**
 *  是否正在切换键盘
 */
@property (nonatomic, assign, getter = isChangingKeyboard) BOOL changingKeyboard;
@end

@implementation HMComposeViewController
#pragma mark - 初始化方法
//懒加载键盘，只需要创建一次
- (HMEmotionKeyboard *)kerboard
{
    if (!_kerboard) {
        self.kerboard = [HMEmotionKeyboard keyboard];
        self.kerboard.backgroundColor = [UIColor blueColor];
        self.kerboard.width = HMScreenW;
        self.kerboard.height = 252;
    }
    return _kerboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航栏按钮
    [self setNavBar];
    
    //添加输入控件UITextView
    [self setupTextView];
    
    //添加工具条
    [self setupToolBar];
    
    //添加显示图片的相册控件
    [self setupPhotosView];
}

/**
 *  添加显示图片的相册控件
 */
-(void)setupPhotosView
{
    HMComposePhotosView *photosView=[[HMComposePhotosView alloc] init];
    photosView.width = self.textView.width;
    photosView.height = self.textView.height;
    photosView.y = 70;
    [self.textView addSubview:photosView];
    self.photosView = photosView;
}

/**
 *  添加工具条
 */
-(void)setupToolBar
{
    HMComposeToolbar *toolbar = [[HMComposeToolbar alloc] init];
    toolbar.width = self.view.width;
    toolbar.delegate = self;
    toolbar.height = 34;
    self.toolbar = toolbar;
    //2.显示
    toolbar.y = self.view.height - toolbar.height;
    [self.view addSubview:toolbar];
    
    
}

/**
 *  添加输入控件UITextView 的实现
 */
-(void)setupTextView
{
    //1.创建控件
    HMTextView *textView=[[HMTextView alloc] init];
    textView.alwaysBounceVertical=YES;//垂直方向上的弹簧效果
    textView.frame=self.view.bounds;
    textView.delegate=self;//遵守代理
    [self.view addSubview:textView];
    self.textView=textView;
    
    //2.设置提醒文字（站位文字）
    textView.placehoder=@"分享到同事圈...";
    //3.设置字体
    textView.font=[UIFont systemFontOfSize:15];
    
    // 4.监听键盘
    // 键盘的frame(位置)即将改变, 就会发出UIKeyboardWillChangeFrameNotification
    // 键盘即将弹出, 就会发出UIKeyboardWillShowNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 键盘即将隐藏, 就会发出UIKeyboardWillHideNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
/**
 *  监听器移除通知
 */
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  view显示完毕的时候再弹出键盘，避免显示控制器view 的时候回卡住
 */
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //成为第一响应者（叫出键盘）
    [self.textView becomeFirstResponder];
}

/**
 *  添加导航栏按钮的实现
 */
-(void)setNavBar
{
    self.title=@"发动态";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    
    //创建右边的发布按钮
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:themeColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    button.sizeToFit;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:button];//监听按钮点击
    [button addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem.enabled=NO;//默认禁用，没有文字不能发布
    //另一种方法
    //    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
//    self.navigationItem.rightBarButtonItem.enabled=NO;
}

#pragma mark - 私有方法
/**
 *  取消事件实现
 */
-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
#warning - 打印窗口里面空间层级关系的代码，注意导入头文件window_Log.h
//    NSArray *windows = [UIApplication sharedApplication].windows;
//    int count = 0;
//    for (UIWindow *window in windows) {
//        count++;
//        NSString *file = [NSString stringWithFormat:@"window_%d.xml", count];
//        HMLog(@"%@", window);
//    }
}

/**
 *  发送事件实现
 */
-(void)send
{
    // 1.发表微博
    if (self.photosView.images.count) {
        [self sendStatusWithImage];
    } else {
        [self sendStatusWithoutImage];
    }
    
    // 2.关闭控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发表有图片的微博
 */
- (void)sendStatusWithImage
{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [HMAccountTool account].access_token;
    params[@"status"] = self.textView.text;
    
    // 3.发送POST请求
    [mgr POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
#warning 目前新浪开放的发微博接口 最多 只能上传一张图片
        UIImage *image = [self.photosView.images firstObject];
        
        NSData *data = UIImageJPEGRepresentation(image, 1.0);
        
        // 拼接文件参数
        [formData appendPartWithFileData:data name:@"pic" fileName:@"status.jpg" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation *operation, NSDictionary *statusDict) {
        [MBProgressHUD showSuccess:@"发表成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发表失败"];
    }];
}


// 图文混排 ： 图片和文字混合在一起排列

/**
 *  发表没有图片的微博
 */
- (void)sendStatusWithoutImage
{
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
//    params[@"status"] = self.textView.text;
//    
//    // 3.发送POST请求
//    [mgr POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params
//      success:^(AFHTTPRequestOperation *operation, NSDictionary *statusDict) {
//          [MBProgressHUD showSuccess:@"发布成功"];
//      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          [MBProgressHUD showError:@"发布失败"];
//      }];
    
#pragma mark - 第一次封装，面向字典
//    //封装之后
//    // 1.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = [HMAccountTool account].access_token;
//    params[@"status"] = self.textView.text;
//    //2.发送post请求
//    [HMHttpTool post:@"https://api.weibo.com/2/statuses/update.json" params:params success:^(id responseObj) {
//        [MBProgressHUD showSuccess:@"发布成功"];
//    } failure:^(NSError *error) {
//        [MBProgressHUD showError:@"发布失败"];
//    }];
#pragma mark - 第二次封装，面向模型，业务封装
    // 1.封装请求参数
    HMSendStatusParam *param = [[HMSendStatusParam alloc] init];
    param.access_token = [HMAccountTool account].access_token;
    param.status = self.textView.text;
    
    // 2.发微博
    [HMStatusTool sendStatusWithParam:param success:^(HMSendStatusResult *result) {
        [MBProgressHUD showSuccess:@"发表成功"];
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"发表失败"];
    }];
}

#pragma mark - 键盘处理
/**
 *  键盘即将隐藏
 */
-(void)keyboardWillHide:(NSNotification *)note
{
    if (self.isChangingKeyboard) {
        self.changingKeyboard = NO;
        return;
    }
    
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        self.toolbar.transform = CGAffineTransformIdentity;
    }];

}
/**
 *  键盘即将弹出
 */
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        // 取出键盘高度
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        self.toolbar.transform = CGAffineTransformMakeTranslation(0, - keyboardH);
    }];
}

#pragma mark - UITextViewDelegate
/**
 *  当用户开始拖拽scrollView时调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


/**
 *  当textView的文字改变就会调用
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = textView.text.length != 0;
}

#pragma mark - HMComposeToolbarDelegate
/**
 *  监听toolbar内部按钮的点击
 */
- (void)composeTool:(HMComposeToolbar *)toolbar didClickedButton:(HMComposeToolbarButtonType)buttonType
{
    switch (buttonType) {
        case HMComposeToolBarButtonTypePicture://相册
//            HMLog(@"打开相册");
            [self openAlbum];
            break;
            
        case HMComposeToolBarButtonTypeCamera://照相机
            HMLog(@"打开照相机");
            [self openCamera];
            break;
            
        case HMComposeToolBarButtonTypeMention://提到@
            HMLog(@"打开提到@");
            break;
        case HMComposeToolBarButtonTypeAudio://语音
            HMLog(@"打开语音");
            break;
        case HMComposeToolBarButtonTypeCamaro://视频
            HMLog(@"打开视频");
//            [self openVideo];
            break;
        case HMComposeToolBarButtonTypeEmotion://表情:
            HMLog(@"打开表情");
            [self openEmotion];
            break;
        default:
            break;
    }
}

/**
 *  打开照相机
 */
-(void)openCamera
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
- (void)openAlbum
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开表情
 */
- (void)openEmotion
{
//    HMLog(@"添加表情");
    // 正在切换键盘
    self.changingKeyboard = YES;
    
    if (self.textView.inputView) { // 当前显示的是自定义键盘，切换为系统自带的键盘
        self.textView.inputView = nil;
        
        // 显示表情图片
        self.toolbar.showEmotionButton = YES;
    } else { // 当前显示的是系统自带的键盘，切换为自定义键盘
        // 如果临时更换了文本框的键盘，一定要重新打开键盘
        self.textView.inputView = self.kerboard;
    
        // 不显示表情图片
        self.toolbar.showEmotionButton = NO;
        
//        UIView *keyboard=[[UIView alloc] init];
//        keyboard.bounds=CGRectMake(0, 0, 320, 250);
//        keyboard.backgroundColor=[UIColor redColor];
//        self.textView.inputView=keyboard;
//        self.toolbar.showEmotionButton=NO;
    }
    
    // 关闭键盘
    [self.textView resignFirstResponder];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 打开键盘
        [self.textView becomeFirstResponder];
    });
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 1.取出选中的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 2.添加图片到相册中
    [self.photosView addImage:image];
}
@end
