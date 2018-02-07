//
//  LYPDeviceListModel.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/2/7.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYPErrorModel.h"
#import "LYPDataListModel.h"
@interface LYPDeviceListModel : NSObject

@property (nonatomic, strong) NSArray *data;

@property (nonatomic, strong) LYPErrorModel *error;

@end
