//
//  LYPListNeteworkTool.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/2/7.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPListNeteworkTool.h"

@implementation LYPListNeteworkTool

-(void)getEquipmentListWithDic:(NSDictionary *)parames success:(successBlock)success failure:(failureBlock)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
//    本地登录成功之后的token，appkey
    [serializer setValue:@"" forHTTPHeaderField:@"token"];
    [serializer setValue:APPKey forHTTPHeaderField:@"appkey"];
    NSString *url = [NSString stringWithFormat:@"%@/devicelist?/lon=%@&lat=%@",getCodeUrl,parames[@"lon"],parames[@"lat"]];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject,0);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,-1);
    }];
}

-(void)takePaperWithDic:(NSDictionary *)parames success:(successBlock)block failure:(failureBlock)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    //    本地登录成功之后的token，appkey
    [serializer setValue:@"" forHTTPHeaderField:@"token"];
    [serializer setValue:APPKey forHTTPHeaderField:@"appkey"];
    [manager POST:takePaperUrl parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,0);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,-1);
    }];
    
}
@end
