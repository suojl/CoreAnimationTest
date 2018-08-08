//
//  Class4ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/18.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class4ViewController.h"
#import <objc/runtime.h>

@interface Sark : NSObject
@property (nonatomic, copy) NSString *name;
@end

@implementation Sark
- (void)speak {
    NSLog(@"my name's %@", self.name);
}
@end
@interface Class4ViewController ()

@end

@implementation Class4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    object_getClass
//     NSString *className = [NSString stringWithFormat:@"EventTracking_%@",self.class];
//    NSLog(@"-----%@",className);
//    id cls = [Sark class];
//    void *obj = &cls;
//     [(__bridge id)obj speak];
//    object_setClass(self, cls);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
