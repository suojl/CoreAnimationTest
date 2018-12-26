//
//  NSOperationTest.m
//  CoreAnimationTestTests
//
//  Created by suojl on 2018/8/7.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSOperationTest : XCTestCase

@end

@implementation NSOperationTest

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

    //创建队列
    NSOperationQueue *operationQueue1 = [[NSOperationQueue alloc] init];

    NSOperationQueue *operationQueue2 = [[NSOperationQueue alloc] init];

    //封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1-----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2-----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3-----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4-----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"5-----%@",[NSThread currentThread]);
    }];
    NSBlockOperation *op6 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"6-----%@",[NSThread currentThread]);
    }];

    //添加操作依赖,[op1 addDependency:op4]表明操作1在操作4完成之后执行。一个操作可以添加多个依赖，可以跨队列依赖。
    [op1 addDependency:op4];
    [op1 addDependency:op5];

    //添加监控，监控到该操作完成后执行代码块内的代码
    [op2 addExecutionBlock:^{
        NSLog(@"操作op2完成了-----%@",[NSThread currentThread]);
    }];

    //把任务添加到队列
    [operationQueue1 addOperation:op1];
    [operationQueue1 addOperation:op2];
    [operationQueue1 addOperation:op3];
    [operationQueue2 addOperation:op4];
    [operationQueue2 addOperation:op5];
    [operationQueue1 addOperation:op6];

    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)testConst {
    int i = 2;
//  const修饰指针变量访问的内存空间，修饰的是右边*p1，
//    const int * p1 = &i;
//    p1 = &i;
//    *p1 = 2;
    [self testaaa:&i];
}

// const放*前面约束参数，表示*a只读
// 只能修改地址a,不能通过a修改访问的内存空间
- (void)testaaa:(const int * )a
{
    int b = 89;
//     *a = 20;
    a = &b;
    NSLog(@"------------------%d",*a);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
