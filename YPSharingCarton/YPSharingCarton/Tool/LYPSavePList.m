//
//  LYPSavePList.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/1.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPSavePList.h"
#import "StringEXtension.h"
@implementation LYPSavePList

+(void)saveTokenPlistWith:(NSString *)token{
    
    if ([StringEXtension isBlankString:token]) {
        return;
    }
    [token writeToFile:[LYPSavePList createFileManagerPath] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

+(NSString *)readTokenPlist{
    
    NSString *token = [NSString stringWithContentsOfFile:[LYPSavePList createFileManagerPath] encoding:NSUTF8StringEncoding error:nil];
    return token;
}


+(NSString *)createFileManagerPath{
    
//    获取本地路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"/Token.plist"];
    
    return filePath;
}

@end
