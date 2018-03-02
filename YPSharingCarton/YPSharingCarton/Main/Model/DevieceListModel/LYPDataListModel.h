//
//  LYPDataListModel.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/2/7.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYPDataListModel : NSObject

@property (nonatomic, copy) NSString *deviceId;

@property (nonatomic, copy) NSString *sn;

@property (nonatomic, copy) NSString *build;

@property (nonatomic, copy) NSString *floor;

@property (nonatomic, copy) NSString *toiletId;

@property (nonatomic, copy) NSString *toiletType;

@property (nonatomic, copy) NSString *seatId;

@property (nonatomic, assign) float lon;
@property (nonatomic, assign) float lat;

@end
