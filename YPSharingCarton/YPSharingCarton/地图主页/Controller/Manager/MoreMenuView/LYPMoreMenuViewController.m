//
//  LYPMoreMenuViewController.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/8.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPMoreMenuViewController.h"
#import "MoreMenuView.h"
@interface LYPMoreMenuViewController ()<MoreMenuViewDelegate>

@property (nonatomic, strong) MoreMenuView *moreMenu;

@end

@implementation LYPMoreMenuViewController
#pragma mark --初始化导航菜单键
- (void)initMoreMenu
{
    if (self.moreMenu == nil)
    {
        self.moreMenu = [[MoreMenuView alloc] init];
        self.moreMenu.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        [self.moreMenu setDelegate:self];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

-(void)moreMenuViewNightTypeChangeTo:(BOOL)isShowNightType{
    
}

-(void)moreMenuViewFinishButtonClicked{
    

}

-(void)moreMenuViewTrackingModeChangeTo:(AMapNaviViewTrackingMode)trackingMode{
    
}

@end
