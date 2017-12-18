//
//  LYPMainViewController.m
//  YPSharingCarton
//
//  Created by laiyp on 2017/12/18.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "LYPMainViewController.h"
#import "UIBarButtonItem+Extension.h"


@interface LYPMainViewController ()

@end

@implementation LYPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNavBar];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)setNavBar{
//    navigationbar_list_normal
   
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_list_normal" selectImage:@"navigationbar_list_hl" target:self action:@selector(showPersonVC)];

    self.title = @"主页";
    
  self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationBar_list_newmsg" selectImage:@"navigationBar_list_newmsg_hl" target:self action:@selector(showMessageVC)];
}

-(void)showPersonVC{
    
    LYPPersonMainVC *perVc = [[LYPPersonMainVC alloc]init];
    
   [KKSliderMenuTool showWithRootViewController:self contentViewController:perVc];
    
}
 
-(void)showMessageVC{
        
    LYPMessageMainVC *messVC = [[LYPMessageMainVC alloc]init];
    [self.navigationController pushViewController:messVC animated:YES];
}
    
@end
