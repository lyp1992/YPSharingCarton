//
//  LYPCustomCalloutView.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/8.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
@protocol LYPCustomCalloutViewDeleagte <NSObject>

-(void)guideToDestination;

@end

@interface LYPCustomCalloutView : UIView

@property (nonatomic, strong) UIImage *image; //商户图
@property (nonatomic, copy) NSString *title; //商户名
@property (nonatomic, copy) NSString *subtitle; //地址
@property (nonatomic, strong) UIButton *guideButton;//导航按钮

@property (nonatomic, weak)id<LYPCustomCalloutViewDeleagte>delegate;
@end


