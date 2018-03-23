//
//  LYPCleanMainVC.m
//  LYPShareCartoolManager
//
//  Created by laiyp on 2018/3/19.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPCleanMainVC.h"
#import "JoeExcelView.h"


@interface LYPCleanMainVC ()

@end

@implementation LYPCleanMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JoeExcelView *joeExcelView = [[JoeExcelView alloc] initWithFrame:self.view.bounds];
    joeExcelView.superVC = self;
    [self.view addSubview:joeExcelView];
}


@end
