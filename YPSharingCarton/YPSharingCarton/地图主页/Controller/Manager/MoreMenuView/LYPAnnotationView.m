//
//  LYPAnnotationView.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/8.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPAnnotationView.h"
#define kCalloutWidth       200.0
#define kCalloutHeight      70.0
@interface LYPAnnotationView()<LYPCustomCalloutViewDeleagte>

@property (nonatomic, strong, readwrite) LYPCustomCalloutView *calloutView;

@end

@implementation LYPAnnotationView
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            self.calloutView = [[LYPCustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
            self.calloutView.delegate = self;
        }
        
        self.calloutView.image = [UIImage imageNamed:@"building"];
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}

-(void)guideToDestination{
    
    if ([_delegate respondsToSelector:@selector(guideToDestination)]) {
        [self.delegate guideToDestination];
    }
}

@end
