//
//  LYPCleanMainVC.m
//  LYPShareCartoolManager
//
//  Created by laiyp on 2018/3/19.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPCleanMainVC.h"
#import "JoeExcelView.h"
#import "LYPPersonMainVC.h"
#import "LYPMessageMainVC.h"
#import "KKSliderMenuTool.h"

@interface LYPCleanMainVC ()

@end

@implementation LYPCleanMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];//导航栏
    JoeExcelView *joeExcelView = [[JoeExcelView alloc] initWithFrame:self.view.bounds];
    joeExcelView.superVC = self;
    [self.view addSubview:joeExcelView];
}
-(void)setNavBar{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_list_normal" selectImage:@"navigationbar_list_hl" target:self action:@selector(showPersonVC)];
    self.title = [LYPUserSingle shareUserSingle].deviceToken;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_msg" selectImage:@"navigationbar_msg" target:self action:@selector(showMessageVC)];
    self.navigationController.navigationBar.backgroundColor =  RGBACOLOR(43, 45, 51, 1);
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

@end
