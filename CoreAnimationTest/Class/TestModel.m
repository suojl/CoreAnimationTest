//
//  TestModel.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/8/9.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "TestModel.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation TestModel

/**
 NSLogL打印
 */
- (NSString *)description {
    //初始化一个字典
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    //得到当前class的所有属性
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    //循环并用KVC得到每个属性的值
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *name =@(property_getName(property));
        id value = [self valueForKey:name] ? : @"nil";//默认值为nil字符串"
        [dictionary setObject:value forKey:name];
    }
    free(properties);
    return [NSString stringWithFormat:@" %@-- %@",[self class],dictionary];
}
//https://github.com/DemoMania/DebugDescriptionDemo
/**
 使用po打印
 */
-(NSString *)debugDescription{
    //初始化一个字典
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    //得到当前class的所有属性
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    //循环并用KVC得到每个属性的值
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *name =@(property_getName(property));
        id value = [self valueForKey:name] ? : @"nil";//默认值为nil字符串"
        [dictionary setObject:value forKey:name];
    }
    free(properties);
    return [NSString stringWithFormat:@" %@-- %@",[self class],dictionary];
}
@end
