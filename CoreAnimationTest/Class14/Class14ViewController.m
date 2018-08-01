//
//  Class14ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/31.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class14ViewController.h"

@interface Class14ViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation Class14ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //load color image
    UIImage *image = [UIImage imageNamed:@"scenery.png"];
    //load mask image
    UIImage *mask = [UIImage imageNamed:@"SnowmanMask.png"];
    //convert mask to correct format
    CGColorSpaceRef graySpace = CGColorSpaceCreateDeviceCMYK();
    CGImageRef maskRef = CGImageCreateCopyWithColorSpace(mask.CGImage, graySpace);
    CGColorSpaceRelease(graySpace);
    //combine images
    CGImageRef resultRef = CGImageCreateWithMask(image.CGImage, maskRef);
    UIImage *result = [UIImage imageWithCGImage:resultRef];
    CGImageRelease(resultRef);
    CGImageRelease(maskRef);
    //display result
    self.imageView.image = result;
//    self.imageView.image = [UIImage imageNamed:@"scenery.png"];
//    CALayer *maskLayer = [CALayer layer];
//    maskLayer.frame = self.imageView.bounds;
//    maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"SnowmanMask.png"].CGImage);
//    self.imageView.layer.mask = maskLayer;
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
