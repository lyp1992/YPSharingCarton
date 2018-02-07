//
//  LYPLonginNetworkTool.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/2/6.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^successBlock)(id responseData, NSInteger responseCode);
typedef void(^failureBlock)(id responseData, NSInteger responseCode);

@interface LYPLonginNetworkTool : NSObject

//登录
-(void)userLoginWithUserDic:(NSDictionary *)parames Success:(successBlock)success failue:(failureBlock)failure;

//注册
-(void)userLoginRegisterWithDic:(NSDictionary *)parames success:(successBlock)success failre:(failureBlock)failure;

//获取验证码
-(void)getVerificationCodeWithDic:(NSDictionary *)parames success:(successBlock)success failure:(failureBlock)failure;

//重置密码
-(void)resetPasswordWithDic:(NSDictionary *)parames success:(successBlock)success failure:(failureBlock)failure;

@end
