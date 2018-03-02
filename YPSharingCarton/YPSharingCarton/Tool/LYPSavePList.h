//
//  LYPSavePList.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/1.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYPSavePList : NSObject

+(void)saveTokenPlistWith:(NSString *)token;

+(NSString *)readTokenPlist;

@end
