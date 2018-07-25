//
//  Class8ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/23.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class8ViewController.h"

@interface Class8ViewController ()
@property (nonatomic, weak) IBOutlet UIView *containerView;
@end

@implementation Class8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 100, 100);
    shipLayer.position = CGPointMake(120, 120);
    shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Snowman"].CGImage);
    [self.containerView.layer addSublayer:shipLayer];

    // animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 4.0;
    animation.byValue = @(M_PI * 3);
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
//    animation.fromValue = [(shipLayer.presentationLayer ? shipLayer.presentationLayer : shipLayer) valueForKeyPath:animation.keyPath];
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    [shipLayer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)] forKey:@"transform"];
//    [CATransaction commit];
    [shipLayer addAnimation:animation forKey:nil];

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
