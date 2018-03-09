//
//  LYPMoreMenuViewController.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/8.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapNaviKit/AMapNaviCommonObj.h>
@protocol LYPMoreMenuViewControllerDelegate;

@interface LYPMoreMenuViewController : UIViewController
@property (nonatomic, assign) id<LYPMoreMenuViewControllerDelegate> delegate;

@property (nonatomic, assign) AMapNaviViewTrackingMode trackingMode;
@property (nonatomic, assign) BOOL showNightType;

@end

@protocol LYPMoreMenuViewControllerDelegate <NSObject>
@optional

- (void)moreMenuViewFinishButtonClicked;
- (void)moreMenuViewTrackingModeChangeTo:(AMapNaviViewTrackingMode)trackingMode;
- (void)moreMenuViewNightTypeChangeTo:(BOOL)isShowNightType;

@end
