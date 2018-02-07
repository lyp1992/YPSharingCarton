//
//  LYPListNeteworkTool.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/2/7.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id responseData, NSInteger responseCode);
typedef void(^failureBlock)(id responseData, NSInteger responseCode);

@interface LYPListNeteworkTool : NSObject

//获取设备列表
-(void)getEquipmentListWithDic:(NSDictionary *)parames success:(successBlock)success failure:(failureBlock)failure;

//设备出纸
-(void)takePaperWithDic:(NSDictionary *)parames success:(successBlock)block failure:(failureBlock)failure;

@end
