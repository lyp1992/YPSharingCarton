//
//  LYPServiceViewController.m
//  YPSharingCarton
//
//  Created by laiyp on 2017/12/21.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "LYPServiceViewController.h"
#import "LYPServiceV.h"
@interface LYPServiceViewController ()

@end

@implementation LYPServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    
    LYPServiceV *serviceV = [LYPServiceV loadXib];
    serviceV.frame = CGRectMake((SCREENWIDTH - 300)/2, SCREENHEIGHT - 240, 300, 230);
    [self.view addSubview:serviceV];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissView)];
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissView{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
