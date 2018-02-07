//
//  LYPLonginNetworkTool.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/2/6.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPLonginNetworkTool.h"

@implementation LYPLonginNetworkTool
-(void)userLoginWithUserDic:(NSDictionary *)parames Success:(successBlock)success failue:(failureBlock)failure{
    
    AFHTTPSessionManager *mannger = [AFHTTPSessionManager manager];
    mannger.requestSerializer = [AFJSONRequestSerializer serializer];
    [mannger.requestSerializer setValue:APPKey forHTTPHeaderField:@"appkey"];
    
    [mannger POST:loginUrl parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        {"data":{"token":"f56e58020315728d"},"error":{"code":0,"msg":""}}
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
                success(responseObject,0);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,-1);
    }];
    
}
-(void)userLoginRegisterWithDic:(NSDictionary *)parames success:(successBlock)success failre:(failureBlock)failure{
    AFHTTPSessionManager *mannger = [AFHTTPSessionManager manager];
    mannger.requestSerializer = [AFJSONRequestSerializer serializer];
    [mannger.requestSerializer setValue:APPKey forHTTPHeaderField:@"appkey"];
    
    [mannger POST:loginRegisterUrl parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        {"data":{"token":"f56e58020315728d"},"error":{"code":0,"msg":""}}
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject,0);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,-1);
    }];
}

-(void)getVerificationCodeWithDic:(NSDictionary *)parames success:(successBlock)success failure:(failureBlock)failure{
    AFHTTPSessionManager *mannger = [AFHTTPSessionManager manager];
    mannger.requestSerializer = [AFJSONRequestSerializer serializer];
    [mannger.requestSerializer setValue:APPKey forHTTPHeaderField:@"appkey"];
    NSString *url = [NSString stringWithFormat:@"%@/getcode?mobile=%@&ctype=%@",getCodeUrl,parames[@"mobile"],parames[@"ctype"]];
    [mannger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject,0);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,-1);
    }];
}
-(void)resetPasswordWithDic:(NSDictionary *)parames success:(successBlock)success failure:(failureBlock)failure{
    AFHTTPSessionManager *mannger = [AFHTTPSessionManager manager];
    mannger.requestSerializer = [AFJSONRequestSerializer serializer];
    [mannger.requestSerializer setValue:APPKey forHTTPHeaderField:@"appkey"];
    
    [mannger POST:resetPassWordUrl parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        {"data":null,"error":{"code":0,"msg":""}}
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject,0);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,-1);
    }];
}

@end
