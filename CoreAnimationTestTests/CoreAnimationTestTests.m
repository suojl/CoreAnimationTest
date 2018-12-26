//
//  CoreAnimationTestTests.m
//  CoreAnimationTestTests
//
//  Created by suojl on 2018/7/10.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestModel.h"

@interface CoreAnimationTestTests : XCTestCase

@end

@implementation CoreAnimationTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    NSInteger x = floor(100/5*2);
//    NSLog(@"----%ld",(long)x);

//    // 1、创建串行队列
//    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"%@--start",[NSThread currentThread]);
//    // 2、将任务添加到队列，并且指定同步执行
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"-------%d",i);
//        dispatch_sync(queue, ^{
//            NSLog(@"%@--%d",[NSThread currentThread],i);
//        });
//    }
//    NSLog(@"%@--end",[NSThread currentThread]);
//
//    // 1. 获取主队列
////    添加到主队列的任务只能由主线程来执行。
////    先进先出的，只有当主线程的代码执行完毕后，主队列才会调度任务到主线程执行
//    dispatch_queue_t q = dispatch_get_main_queue();
//    // 2. 将任务添加到主队列, 并且指定异步执行
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"------------------------");
//        dispatch_async(q, ^{
//            NSLog(@"%@ %d", [NSThread currentThread], i);
//        });
//    }
//    // 先执行完这句代码, 才会执行主队列中的任务
//    NSLog(@"hello %@", [NSThread currentThread]);

    // 1. 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    // 2. 将任务添加到队列, 并且指定同步执行
    NSLog(@"%@============start===============", [NSThread currentThread]);
    for (int i = 0; i < 100; i++) {
        NSLog(@"%@===========================%d", [NSThread currentThread],i);
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"%@============end===============", [NSThread currentThread]);

//    NSLog(@"begin");
//    // 1. 获取主队列
//    dispatch_queue_t q = dispatch_get_main_queue();
//    // 2. 将任务添加到主队列, 并且指定同步执行
//    // 死锁
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(q, ^{
//            NSLog(@"%@ %d", [NSThread currentThread], i);
//        });
//    }
//    NSLog(@"end");
}

- (void)testModel {
//    TestModel *model = [TestModel new];
//    model.text = @"aaaaaaaaaaaaaaaa";
//    model.index = 888;
//    NSLog(@"----%@",model);
    NSString *aaa = [NSString stringWithFormat:@"aaa"];
    NSLog(@"---%p",aaa);
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:aaa];
    NSLog(@"---%p",arr);
    NSLog(@"---%p",arr[0]);
    aaa = [NSString stringWithFormat:@"bbb"];
    NSLog(@"---%p",aaa);


    NSLog(@"---aaa:%@",aaa);
    NSLog(@"---arr:%@",arr);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
