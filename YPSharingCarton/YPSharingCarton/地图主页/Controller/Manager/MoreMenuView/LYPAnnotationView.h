//
//  LYPAnnotationView.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/8.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import "LYPCustomCalloutView.h"
@protocol LYPAnnotationViewDeleagte <NSObject>

-(void)guideToDestination;

@end
@interface LYPAnnotationView : MAAnnotationView

@property (nonatomic, readonly) LYPCustomCalloutView *calloutView;
@property (nonatomic, weak) id<LYPAnnotationViewDeleagte>delegate;

@end
