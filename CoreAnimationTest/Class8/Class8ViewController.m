//
//  Class8ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/23.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class8ViewController.h"

@interface Class8ViewController () <CAAnimationDelegate>
@property (nonatomic, strong) IBOutlet UIView *containerView;
@property (nonatomic, strong) CALayer *shipLayer;
@end

@implementation Class8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 100, 100);
    self.shipLayer.position = CGPointMake(120, 120);
    self.shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Snowman"].CGImage);
    [self.containerView.layer addSublayer:self.shipLayer];

    // animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.z";
    animation.duration = 4.0;
//    animation.delegate = self;
    animation.byValue = @(M_PI * 3);
//    animation.timeOffset = 2.0;
//    animation.repeatDuration = INFINITY; // 动画无限重复
//    animation.autoreverses = YES;       // 动画自动返回
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI*3, 0, 0, 1)];
//    animation.fromValue = [(self.shipLayer.presentationLayer ? self.shipLayer.presentationLayer : self.shipLayer) valueForKeyPath:animation.keyPath];
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    [self.shipLayer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI*3, 0, 0, 1)] forKey:@"transform"];
//    [CATransaction commit];
    self.shipLayer.speed = 0;
    [self.shipLayer addAnimation:animation forKey:nil];

}
-(IBAction)startAction:(id)sender{
    CFTimeInterval timeOffset = 3.0f;
    self.shipLayer.timeOffset = timeOffset;
}
-(IBAction)stopAction:(id)sender{
    CFTimeInterval timeOffset = 1.0f;
    self.shipLayer.timeOffset = timeOffset;
}
- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    //set the backgroundColor property to match animation toValue
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.shipLayer.transform = CATransform3DMakeRotation(M_PI * 3, 0, 0, 1);
    [CATransaction commit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
