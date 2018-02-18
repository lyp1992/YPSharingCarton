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

@interface LYPMainViewController ()

@end

@implementation LYPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavBar];//导航栏
    [self setUPUI];//地图
    [self sweepTheYard];//扫码
    [self createUserLocation];//定位
    [self createService];//客服
    
    LYPLonginNetworkTool *longinTool = [[LYPLonginNetworkTool alloc]init];
    NSDictionary *dic = @{@"mobile":@"13522652010",@"password":@"3D4F2BF07DC1BE38B20CD6E46949A1071F9D0E3D",@"deviceToken":@"525688FEdade",@"ios":@(0)};
    
    [longinTool userLoginWithUserDic:dic Success:^(id responseData, NSInteger responseCode) {
        NSLog(@"login=%@",responseData);
    } failue:^(id responseData, NSInteger responseCode) {
        NSLog(@"login=%@",responseData);
    }];
    NSDictionary *regisDic = @{@"mobile":@"13522652010",@"password":@"3D4F2BF07DC1BE38B20CD6E46949A1071F9D0E3D",@"deviceToken":@"525688FEdade",@"ios":@(0)};
    [longinTool userLoginRegisterWithDic:regisDic success:^(id responseData, NSInteger responseCode) {
        NSLog(@"Register=%@",responseData);
    } failre:^(id responseData, NSInteger responseCode) {
        NSLog(@"Register=%@",responseData);
    }];
    
    
}
-(void)setNavBar{

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_list_normal" selectImage:@"navigationbar_list_hl" target:self action:@selector(showPersonVC)];
    self.title = [LYPUserSingle shareUserSingle].deviceToken;
  self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_msg" selectImage:@"navigationbar_msg" target:self action:@selector(showMessageVC)];
    self.navigationController.navigationBar.backgroundColor =  RGBACOLOR(43, 45, 51, 1);
}

-(void)setUPUI{
    
    LYPMapViewController *mapVC = [[LYPMapViewController alloc]init];
//    mapVC.view.frame =CGRectMake(0, 64,SCREENWIDTH, SCREENHEIGHT-64);
    [self.view addSubview:mapVC.view];
    
}

-(void)sweepTheYard{
    
    CGRect frame = CGRectMake((SCREENWIDTH -  150)/2, SCREENHEIGHT - 65 - 10, 150, 65);
    LYPCustomButton *scanButton = [[LYPCustomButton alloc]initWithFrame:frame nomalImage:@"common_scan" highLightImage:@"seviceScan" backgroundImage:@"scan_button_750" backgroundHightImage:@"" title:@"扫码开锁" titleColor:[UIColor whiteColor]];
    [scanButton addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
}

-(void)createUserLocation{

    CGRect frame = CGRectMake(15, SCREENHEIGHT - 50 - 15, 50, 50);
    LYPCustomButton *locationButton = [[LYPCustomButton alloc]initWithFrame:frame nomalImage:@"" highLightImage:@"" backgroundImage:@"nav_orientation" backgroundHightImage:@"nav_orientation_highlight" title:nil titleColor:nil];
    [locationButton addTarget:self action:@selector(openLocation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton];
}

-(void)createService{
    
    CGRect frame = CGRectMake(SCREENWIDTH - 65, SCREENHEIGHT - 50 - 15, 50, 50);
    LYPCustomButton *serviceButton = [[LYPCustomButton alloc]initWithFrame:frame nomalImage:@"" highLightImage:@"" backgroundImage:@"main_help_normal" backgroundHightImage:@"main_help_hl" title:nil titleColor:nil];
    [serviceButton addTarget:self action:@selector(openService) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:serviceButton];
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
    
    LYPScanViewController *scanVC = [[LYPScanViewController alloc]init];
    [self.navigationController pushViewController:scanVC animated:YES];
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
