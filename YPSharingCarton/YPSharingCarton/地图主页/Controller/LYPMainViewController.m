//
//  LYPMainViewController.m
//  YPSharingCarton
//
//  Created by laiyp on 2017/12/18.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "LYPMainViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "LYPMapViewController.h"
#import "LYPScanViewController.h"
#import "LYPCustomButton.h"
#import "LYPServiceViewController.h"
#import "LYPUserSingle.h"
#import "LYPLonginNetworkTool.h"
#import "LYPSavePList.h"
#import "StringEXtension.h"

#import "LYPloginModel.h"
#import "LYPLoginVC.h"
#import "LYPLonginNetworkTool.h"

@interface LYPMainViewController ()
@property (nonatomic, strong) LYPCustomButton *scanButton;
@property (nonatomic, strong) LYPCustomButton *locationButton;
@property (nonatomic, strong) LYPCustomButton *serviceButton;

@end

@implementation LYPMainViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    每次用户进来都要让他默认去登录一次系统
//    NSDictionary *userdic = [LYPSavePList readUserInfo];
//    if (userdic) {
//        NSDictionary *dic = @{@"mobile":userdic[@"mobile"],@"password":userdic[@"password"],@"deviceToken":userdic[@"deviceToken"],@"ios":@(1)};
//        LYPLonginNetworkTool *longinTool = [[LYPLonginNetworkTool alloc]init];
//        [longinTool userLoginWithUserDic:dic Success:^(id responseData, NSInteger responseCode) {
//            NSLog(@"login=%@",responseData);
//            LYPloginModel *model = [LYPloginModel mj_objectWithKeyValues:responseData];
//            if (![StringEXtension isBlankString:model.error.msg]) {
//                [SVStatusHUD showWithStatus:model.error.msg];
//            }else{
//
//                if (![StringEXtension isBlankString:model.data.token]) {
//                    //                写入本地
//                    [LYPSavePList saveTokenPlistWith:model.data.token];
//                }
//            }
//        } failue:^(id responseData, NSInteger responseCode) {
//            NSLog(@"errlogin=%@",responseData);
//            [SVStatusHUD showWithStatus:@"服务器连接失败"];
//        }];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavBar];//导航栏
//    
    [self setUPUI];//地图
    [self sweepTheYard];//扫码
//    [self createUserLocation];//定位
//    [self createService];//客服
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideNav) name:@"hideNav" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showNav) name:@"showNav" object:nil];
}


-(void)setNavBar{

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_list_normal" selectImage:@"navigationbar_list_hl" target:self action:@selector(showPersonVC)];
    self.title = [LYPUserSingle shareUserSingle].deviceToken;
  self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_msg" selectImage:@"navigationbar_msg" target:self action:@selector(showMessageVC)];
    self.navigationController.navigationBar.backgroundColor =  RGBACOLOR(43, 45, 51, 1);
}

-(void)setUPUI{
    
    LYPMapViewController *mapVC = [[LYPMapViewController alloc]init];
    [self.view addSubview:mapVC.view];
    
}

-(void)hideNav{
    [self setNav:YES];
}
-(void)showNav{
    [self setNav:NO];
}
-(void)setNav:(BOOL)parameter{
    self.navigationController.navigationBarHidden = parameter;
    self.scanButton.hidden = parameter;
    self.serviceButton.hidden = parameter;
    self.locationButton.hidden = parameter;
}


-(void)sweepTheYard{
    
    CGRect frame = CGRectMake((SCREENWIDTH -  150)/2, SCREENHEIGHT - 65 - 10, 150, 65);
    LYPCustomButton *scanButton = [[LYPCustomButton alloc]initWithFrame:frame nomalImage:@"common_scan" highLightImage:@"seviceScan" backgroundImage:@"scan_button_750" backgroundHightImage:@"" title:@"扫码开锁" titleColor:[UIColor whiteColor]];
    [scanButton addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    self.scanButton = scanButton;
    
}

-(void)createUserLocation{

    CGRect frame = CGRectMake(15, SCREENHEIGHT - 50 - 15, 50, 50);
    LYPCustomButton *locationButton = [[LYPCustomButton alloc]initWithFrame:frame nomalImage:@"" highLightImage:@"" backgroundImage:@"nav_orientation" backgroundHightImage:@"nav_orientation_highlight" title:nil titleColor:nil];
    [locationButton addTarget:self action:@selector(openLocation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton];
    self.locationButton = locationButton;
}

-(void)createService{
    
    CGRect frame = CGRectMake(SCREENWIDTH - 65, SCREENHEIGHT - 50 - 15, 50, 50);
    LYPCustomButton *serviceButton = [[LYPCustomButton alloc]initWithFrame:frame nomalImage:@"" highLightImage:@"" backgroundImage:@"main_help_normal" backgroundHightImage:@"main_help_hl" title:nil titleColor:nil];
    [serviceButton addTarget:self action:@selector(openService) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:serviceButton];
    self.serviceButton = serviceButton;
}

#pragma method
-(void)showPersonVC{
    
    LYPPersonMainVC *perVc = [[LYPPersonMainVC alloc]init];
    
   [KKSliderMenuTool showWithRootViewController:self contentViewController:perVc];
    
}
 
-(void)showMessageVC{
        
    LYPMessageMainVC *messVC = [[LYPMessageMainVC alloc]init];
    [self.navigationController pushViewController:messVC animated:YES];
}

-(void)scanAction{
    
//    判断用户是否登录了
    if ([StringEXtension isBlankString:[LYPSavePList readTokenPlist]]) {//本地没有存token，需要登录或者注册

        UIStoryboard *board = [UIStoryboard storyboardWithName:@"LYPLoginVC" bundle:nil];
        LYPLoginVC *loginVC = [board instantiateViewControllerWithIdentifier:@"LYPLoginVC"];
        [self presentViewController:loginVC animated:YES completion:nil];

    }else{//本地有token，直接进入扫码界面
    
        LYPScanViewController *scanVC = [[LYPScanViewController alloc]init];
        [self.navigationController pushViewController:scanVC animated:YES];
    }
    
}
-(void)openLocation{
    
    NSLog(@"打开定位");
}

-(void)openService{
    
    LYPServiceViewController *servieVc = [[LYPServiceViewController alloc]init];
    servieVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:servieVc animated:YES completion:nil];
    
}
    
-(void) updateNotification:(NSString *) str {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
    
@end
