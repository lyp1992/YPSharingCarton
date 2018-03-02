//
//  NSArray+LYPLog.m
//  YPSharingCartonTests
//
//  Created by laiyp on 2018/3/1.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "NSArray+LYPLog.h"

@implementation NSArray (LYPLog)
- (NSString*)descriptionWithLocale:(id)locale {
    NSMutableString*str = [NSMutableString stringWithString:@"(/n"];
    [self enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop) {
        [str appendFormat:@"/t%@,/n", obj];
    }];
    [str appendString:@")"];
    return str;
}
@end

@implementation NSDictionary (LYPLog)
- (NSString*)descriptionWithLocale:(id)locale {
    NSMutableString*str = [NSMutableString stringWithString:@"{/n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop) {
        [str appendFormat:@"/t%@ = %@;/n", key, obj];
    }];
    [str appendString:@"}/n"];
    return str;
}
@end
