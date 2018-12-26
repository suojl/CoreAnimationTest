//
//  ViewController.m
//  test_runloop_01
//
//  Created by jeffasd on 16/7/25.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL isRuning;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    _isRuning = YES;
//
//    BOOL isSuccess = [[NSRunLoop currentRunLoop] runMode:NSRunLoopCommonModes beforeDate:[NSDate distantFuture]];
//
//    NSLog(@"runLoop is %@", isSuccess ? @"YES" : @"NO");
//
//
//
//
//#if 0
//    //苹果公开提供的 Mode 有两个：kCFRunLoopDefaultMode (NSDefaultRunLoopMode) 和 UITrackingRunLoopMode，你可以用这两个 Mode Name 来操作其对应的 Mode。
//    [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode beforeDate:[NSDate distantFuture]];
//    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//
//    //同时苹果还提供了一个操作 Common 标记的字符串：kCFRunLoopCommonModes (NSRunLoopCommonModes)，你可以用这个字符串来操作 Common Items，或标记一个 Mode 为 "Common"。使用时注意区分这个字符串和其他 mode name。
//    //commonModeItems
//    //这里使用的模式是：NSRunLoopCommonModes，这个模式等效于NSDefaultRunLoopMode和NSEventTrackingRunLoopMode的结合。
//    //运行在此模式下 commonModeItems 内 每当 RunLoop 的内容发生变化时，RunLoop 都会自动将 commonModeItems 里的 Source/Observer/Timer 同步到具有 "Common" 标记的所有Mode里。由于主线程的 RunLoop 里有两个预置的 Mode：kCFRunLoopDefaultMode 和 UITrackingRunLoopMode。这两个 Mode 都已经被标记为"Common"属性。
//    //所以NSRunLoopCommonModes此模式会处理 来自UITrackingRunLoopMode和NSDefaultRunLoopMode内的时间
//
//    //设置主线程的运行模式为NSRunLoopCommonModes 主线程可以接受来自NSDefaultRunLoopMode和UITrackingRunLoopMode模式下的事件
//    [[NSRunLoop currentRunLoop] runMode:NSRunLoopCommonModes beforeDate:[NSDate distantFuture]];
//
//    NSTimer *timer = nil;
//    //将 Timer 加入到顶层的 RunLoop 的 "commonModeItems" 中。"commonModeItems" 被 RunLoop 自动更新到所有具有"Common"属性的 Mode 里去。
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//#endif
//
//    NSLog(@"the runloop is %@", [NSRunLoop currentRunLoop]);
//
//    [NSThread detachNewThreadSelector:@selector(doSomething) toTarget:self withObject:nil];




}

- (void)doSomething{

    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerDoSomething) userInfo:nil repeats:YES];

    NSLog(@"therad is %@", [NSThread currentThread]);

    NSLog(@"doSomething");

    NSLog(@"the runloop is %@", [NSRunLoop currentRunLoop]);

    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    //    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];

    //    - (void)run; 无条件运行
    //    不建议使用，因为这个接口会导致Run Loop永久性的运行在NSDefaultRunLoopMode模式，即使使用CFRunLoopStop(runloopRef);也无法停止Run Loop的运行，那么这个子线程就无法停止，只能永久运行下去。
    //    [[NSRunLoop currentRunLoop] run];


    /*
     如果是使用NSRunLoop，有三个运行的接口：

     //1。运行 NSRunLoop，运行模式为默认的NSDefaultRunLoopMode模式，没有超时限制
     无法使用CFRunLoopStop(runLoopRef)来停止RunLoop的运行
     - (void)run;

     //2.运行 NSRunLoop: 参数为运行模式、时间期限，返回值为YES表示是处理事件后返回的，NO表示是超时或者停止运行导致返回的。[Update]: 感谢网友olo的提醒：返回值只有在RunLoop没有运行的情况下才返回NO。比如：1）没有添加输入源和定时器源 2）mode为NSRunLoopCommonModes 或UITrackingRunLoopMode 等“非法”参数。如果超时的话返回YES，即使limitDate的初始值小于当前的Date，RunLoop也会执行一次然后马上返回YES。
     - (BOOL)runMode:(NSString *)mode beforeDate:(NSDate *)limitDate;

     //3.运行 NSRunLoop: 参数为运时间期限，运行模式为默认的NSDefaultRunLoopMode模式
     无法使用CFRunLoopStop(runLoopRef)来停止RunLoop的运行
     - (void)runUntilDate:(NSDate *)limitDate;
     建议是使用第二个接口来运行，因为它能够设置Run Loop的运行参数最多，而且最重要的是可以使用CFRunLoopStop(runLoopRef)来停止Run Loop的运行，而第一个和第三个接口无法使用CFRunLoopStop(runLoopRef)来停止Run Loop的运行。
     */


#if 0

    //子线程中 设置 runloop的运行模式 为 NSDefaultRunLoopMode 子线程可以接受来自NSDefaultRunLoopMode模式下的事件
    //    BOOL isSuccess1 = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

    //设置子线程的运行模式为NSRunLoopCommonModes 子线程可以接受来自NSDefaultRunLoopMode和UITrackingRunLoopMode模式下的事件 但是对于子线程和主线程有一点不同是，主线程默认已经创建了两个 runloop NSDefaultRunLoopMode和UITrackingRunLoopMode 因此主线程设置 运行在此模式下能直接 接受 NSDefaultRunLoopMode和UITrackingRunLoopMode两个模式的事件，但是由于子线程 的runloop 为空,因此 要先给子线程的runloop添加一个模式上面的[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];及时在给子线程添加一个运行模式。
    //    BOOL isSuccess = [[NSRunLoop currentRunLoop] runMode:NSRunLoopCommonModes beforeDate:[NSDate distantFuture]];

    //UITrackingRunLoopMode 只能在主线程中使用 子线程中不能使用
    //    BOOL isSuccess = [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode beforeDate:[NSDate distantFuture]];

    //    NSLog(@"runLoop is %@", isSuccess1 ? @"YES" : @"NO");
    NSLog(@"runLoop is %@", isSuccess ? @"YES" : @"NO");
#endif

    //对于子线程UITrackingRunLoopMode 参数无效, NSRunLoopCommonModes参数必须在本线程已经被添加过runloop后才有效
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];


    //    可以使用CFRunLoopStop(runLoopRef)来停止RunLoop的运行
    //    CFRunLoopRun();

    //    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

    BOOL ret = 0;

    //    while (_isRuning)
    //    {
    //        ret = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
    //                                            beforeDate:[NSDate distantFuture]];
    //
    //    }

    NSLog(@"exiting runloop.........: %d", ret);

    //    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];


    //    sleep(10);
    //    [[NSRunLoop currentRunLoop] cancelPerformSelectorsWithTarget:self];

    //    CFRunLoopStop([NSRunLoop currentRunLoop].getCFRunLoop);

    //    [[NSRunLoop currentRunLoop] run];

//    int i = _selectedPhotos.count%3 > 0 ? 1 : 0;
//    NSInteger row = _selectedPhotos.count/3 + i;

}

- (void)timerDoSomething{

    static int i = 0;
    i++;
    if (i >= 4) {
        CFRunLoopStop([NSRunLoop currentRunLoop].getCFRunLoop);

        //        CFRunLoopStop(CFRunLoopGetCurrent());
        _isRuning = NO;
    }

    NSLog(@"timerDoSomething");

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    _isRuning = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

