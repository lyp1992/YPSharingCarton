//
//  LYPQRCodeResultVC.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/1/10.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPQRCodeResultVC.h"
#import "LYPPromptView.h"

@interface LYPQRCodeResultVC ()

@end

@implementation LYPQRCodeResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUPUI];
}

-(void)setUPUI
{
    LYPPromptView *prompView = [[LYPPromptView alloc]initWithFrame:CGRectMake(30, 120, SCREENWIDTH - 60, 80) LabelString: self.qrcodeString];
    [self.view addSubview:prompView];
}
@end
