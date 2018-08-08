//
//  SingleDemo.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/8/7.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "SingleDemo.h"

@implementation SingleDemo

static SingleDemo *_loginTool;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    //    @synchronized (self) {
    //        if (_loginTool == nil) {
    //            _loginTool = [super allocWithZone:zone];
    //        }
    //    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loginTool = [super allocWithZone:zone];
    });
    return _loginTool;
}
+ (instancetype)shareLoginTool
{
    return [[self alloc] init];
}
- (id)copyWithZone:(nullable NSZone *)zone
{
    return _loginTool;
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone
{
    return _loginTool;
}

@end
