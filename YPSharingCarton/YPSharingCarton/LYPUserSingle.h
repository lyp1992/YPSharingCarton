//
//  LYPUserSingle.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/1/24.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYPUserSingle : NSObject

+(LYPUserSingle*)shareUserSingle;

@property (nonatomic, copy) NSString *deviceToken;

//用户登录成功的token
@property (nonatomic, copy) NSString *token;

@end

