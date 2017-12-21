//
//  LYPServiceView.m
//  YPSharingCarton
//
//  Created by laiyp on 2017/12/21.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "LYPServiceV.h"

@implementation LYPServiceV

+(instancetype)loadXib{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"LYPServiceV" owner:self options:nil] firstObject];
}
@end
