//
//  Class6ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/18.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class6ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ReflectionView.h"

@interface Class6ViewController ()

@property (nonatomic, weak) IBOutlet ReflectionView *containerView;
@property (nonatomic, weak) IBOutlet UIView *containerView2;
@end

@implementation Class6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /*---------------------CAShapeLayer--------------*/
    UIView *cornerView = [UIView new];
    cornerView.frame = CGRectMake(50, 84, 100, 100);
    cornerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:cornerView];
    //define path parameters
    CGRect rect = CGRectMake(0, 0, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;

//    shapeLayer.lineWidth = 5;
//    shapeLayer.lineJoin = kCALineJoinRound;
//    shapeLayer.lineCap = kCALineCapRound;

    cornerView.layer.mask = shapeLayer;
    /*---------------------CAShapeLayer--------------*/

    /*--------------------------------------------CATextLayer------------------------------------*/
//    UIView *labelView = [UIView new];
//    labelView.frame = CGRectMake(50, 200, 200, 250);
//    [self.view addSubview:labelView];
//    CATextLayer *textLayer = [CATextLayer layer];
//    textLayer.frame = labelView.bounds;
//    [labelView.layer addSublayer:textLayer];
//
//    textLayer.foregroundColor = [UIColor redColor].CGColor;
//    textLayer.alignmentMode = kCAAlignmentJustified;
//    textLayer.wrapped = YES;
//    //choose a font
//    UIFont *font = [UIFont systemFontOfSize:15];
//
//    //set layer font
//    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
//    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
//    textLayer.font = fontRef;
//    textLayer.fontSize = font.pointSize;
//    CGFontRelease(fontRef);
//
//    //choose some text
//    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar  leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel  fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet  lobortis";
//
//    //set layer text
//    textLayer.string = text;
//    textLayer.contentsScale = [UIScreen mainScreen].scale;
    /*--------------------------------------------CATextLayer------------------------------------*/

    /*--------------------------------------------CATransformLayer------------------------------------*/
    //set up the perspective transform
//    CATransform3D pt = CATransform3DIdentity;
//    pt.m34 = -1.0 / 500.0;
//    self.containerView.layer.sublayerTransform = pt;
//
//    //set up the transform for cube 1 and add it
//    CATransform3D c1t = CATransform3DIdentity;
//    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
//    CALayer *cube1 = [self cubeWithTransform:c1t];
////    NSLog(@"---size:%@--origin:%@",NSStringFromCGSize(cube1.frame.size),NSStringFromCGPoint(cube1.frame.origin));
//    [self.containerView.layer addSublayer:cube1];
//
//    CALayer *layer = [CALayer layer];
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    layer.frame = CGRectMake(0, 0, 100, 100);
//    CGSize containerSize = self.containerView.bounds.size;
//    layer.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
//
//    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 0);
//    layer.transform = ct;
//    [self.containerView.layer addSublayer:layer];
//    //set up the transform for cube 2 and add it
//    CATransform3D c2t = CATransform3DIdentity;
//    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
//    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
//    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
//    CALayer *cube2 = [self cubeWithTransform:c2t];
//    [self.containerView.layer addSublayer:cube2];
    /*--------------------------------------------CATransformLayer------------------------------------*/

    /*--------------------------------------------CAGradientLayer------------------------------------*/
//    //create gradient layer and add it to our container view
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = self.containerView.bounds;
//    [self.containerView.layer addSublayer:gradientLayer];
//
//    //set gradient colors
//    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor, (__bridge id)[UIColor grayColor].CGColor];
//    gradientLayer.locations = @[@0.35,@0.7,@1.0];
//    //set gradient start and end points
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(0, 1);
    /*--------------------------------------------CAGradientLayer------------------------------------*/

    /*--------------------------------------------CAReplicatorLayer------------------------------------*/
    //create a replicator layer and add it to our view
//    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
//    replicator.frame = self.containerView.bounds;
//    [self.containerView.layer addSublayer:replicator];
//
//    //configure the replicator
//    replicator.instanceCount = 10;
//
//    //apply a transform for each instance
//    CATransform3D transform = CATransform3DIdentity;
//    transform = CATransform3DTranslate(transform, 0, -100, 0);
//    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
//    transform = CATransform3DTranslate(transform, 0, 100, 0);
//    replicator.instanceTransform = transform;
//
//    //apply a color shift for each instance
//    replicator.instanceBlueOffset = -0.1;
//    replicator.instanceGreenOffset = -0.1;
//
//    //create a sublayer and place it inside the replicator
//
//    CGSize containerSize = self.containerView.bounds.size;
//    CALayer *layer = [CALayer layer];
//    layer.bounds = CGRectMake(0.f, 0.f, 50.0f, 50.0f);
//    layer.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
//    layer.backgroundColor = [UIColor whiteColor].CGColor;
//    [replicator addSublayer:layer];
    /*--------------------------------------------CAReplicatorLayer------------------------------------*/

    /*--------------------------------------------ReflectionView------------------------------------*/
//    UIImage *image = [UIImage imageNamed:@"Snowman"];
//    CALayer *imageLayer = [CALayer layer];
//    imageLayer.contents = (__bridge id _Nullable)(image.CGImage);
//    imageLayer.frame = CGRectMake(50, 20, 100, 100);
//    [self.containerView.layer addSublayer:imageLayer];
    /*--------------------------------------------ReflectionView------------------------------------*/

    /*--------------------------------------------CAEmitterLayer------------------------------------*/
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = self.containerView2.bounds;
    [self.containerView2.layer addSublayer:emitterLayer];
    //configure emitter
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width / 2.0, emitterLayer.frame.size.height / 2.0);

    CAEmitterCell *cell = [CAEmitterCell new];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"black3"].CGImage);
    cell.birthRate = 150;
    cell.color = [UIColor colorWithRed:1 green:.5f blue:.1f alpha:1.f].CGColor;
    cell.lifetime = 5.f;    //存在多长时间
    cell.alphaSpeed = -0.4f;    //透明度递减
    cell.velocity = 50;     //扩散速度
    cell.velocityRange = 50;    //扩散区域
    cell.emissionRange = M_PI * 2.0;
    //add particle template to emitter
    emitterLayer.emitterCells = @[cell];
    /*--------------------------------------------CAEmitterLayer------------------------------------*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //create cube face layer
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);

    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;

    face.transform = transform;
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //create cube layer
    //CATransformLayer解决了这个问题，CATransformLayer不同于普通的CALayer，
    //因为它不能显示它自己的内容。只有当存在了一个能作用于子图层的变换它才真正存在。
    CATransformLayer *cube = [CATransformLayer layer];

    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //center the cube layer within the container
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);

    //apply the transform and return
    cube.transform = transform;
    return cube;
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
