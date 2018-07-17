//
//  ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/10.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *layerView;

@property (nonatomic, weak) IBOutlet UIView *leftTopView;
@property (nonatomic, weak) IBOutlet UIView *rightTopView;
@property (nonatomic, weak) IBOutlet UIView *leftBottomView;
@property (nonatomic, weak) IBOutlet UIView *rightBottomView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];

    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    [self.layerView.layer addSublayer:blueLayer];
    UIImage *image = [UIImage imageNamed:@"Snowman"];
//    self.layerView.layer.contents = (__bridge id)(image.CGImage);
//    self.layerView.layer.contentsGravity = kCAGravityCenter;    //设置图像拉伸样式
//    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
//    self.layerView.layer.contentsScale = image.scale;   // 设置图像点和像素的比例关系
//    self.layerView.layer.masksToBounds = YES;           // 超出边界截取
//    self.layerView.layer.shadowColor = [UIColor redColor].CGColor;  // 阴影颜色
//    self.layerView.layer.shadowOpacity = .5f;               // 阴影透明度
//    self.layerView.layer.shadowOffset = CGSizeMake(0, 0);   // 阴影偏移量
//    self.layerView.layer.shadowRadius = 10;     // 设置阴影大小

//    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.leftTopView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.rightTopView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.leftBottomView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.rightBottomView.layer];
    self.leftTopView.layer.cornerRadius = 15;
    self.rightTopView.layer.cornerRadius = 15;
//    self.rightTopView.layer.borderColor = [UIColor redColor].CGColor;
//    self.rightTopView.layer.borderWidth = 25;     // 测试边界线在图层里边

    [self addShadowToView:self.leftBottomView withOpacity:.5f shadowRadius:3 andCornerRadius:5];
    [self addShadowToView:self.layerView withOpacity:.5f shadowRadius:3 andCornerRadius:5];
}


/**
 截取图片指定区域显示在layer上

 @param image 原始图片
 @param rect 截取的区域
 @param layer 显示图片的layer
 */
- (void) addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer{
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsRect = rect;
}


/**
 视图添加圆角和阴影

 @param view 添加阴影的视图
 @param shadowOpacity 阴影透明度
 @param shadowRadius 阴影大小
 @param cornerRadius 圆角大小
 */
- (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius
{
    //////// shadow /////////
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = view.layer.frame;

    shadowLayer.shadowColor = [UIColor redColor].CGColor;//shadowColor阴影颜色
    shadowLayer.shadowOffset = CGSizeMake(0, 0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    shadowLayer.shadowOpacity = shadowOpacity;//0.8;//阴影透明度，默认0
    shadowLayer.shadowRadius = shadowRadius;//8;//阴影半径，默认3

    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];

    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;

    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);

    CGFloat offset = -1.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];

    //设置阴影路径
    shadowLayer.shadowPath = path.CGPath;

    //////// cornerRadius /////////
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;

    [view.superview.layer insertSublayer:shadowLayer below:view.layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)layerView {
    if (!_layerView) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(20, 100, 200, 150);
        view.backgroundColor = [UIColor lightGrayColor];
        _layerView = view;
    }
    return _layerView;
}
@end
