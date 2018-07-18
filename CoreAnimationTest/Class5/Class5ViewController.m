//
//  Class5ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/18.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class5ViewController.h"

@interface Class5ViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) UIView *layerView2;
@property (nonatomic, strong) UIView *innerView;
@end

@implementation Class5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.layerView];
    [self.containerView addSubview:self.layerView2];
//    [self.layerView addSubview:self.innerView];

    UIImage *image = [UIImage imageNamed:@"Snowman"];
    self.layerView.layer.contents = (__bridge id)(image.CGImage);
    self.layerView2.layer.contents = (__bridge id)(image.CGImage);
//    self.layerView2.layer.affineTransform = CGAffineTransformMakeTranslation(200, 0);
//    self.layerView.layer.affineTransform = CGAffineTransformMakeShear(.5,0);
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = - 1.0 / 500.0;
    self.layerView.layer.transform = CATransform3DRotate(transform3D, M_PI_4, 0, 1, 0);

    CATransform3D transform3D2 = CATransform3DIdentity;
    transform3D2.m34 = - 1.0 / 500.0;
    self.layerView2.layer.transform = CATransform3DRotate(transform3D2, -M_PI_4, 0, 1, 0);

//    self.innerView.layer.transform = CATransform3DRotate(transform3D2, M_PI_4, 0, 1, 0);
}

// 倾斜视图
CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (UIView *)layerView {
    if (!_layerView) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(20, 10, 200, 150);
        view.backgroundColor = [UIColor lightGrayColor];
        view.layer.contentsGravity = kCAGravityResizeAspect;    //设置图像拉伸样式
        //    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
        //    self.layerView.layer.contentsScale = image.scale;   // 设置图像点和像素的比例关系
        //    self.layerView.layer.masksToBounds = YES;           // 超出边界截取
        view.layer.shadowColor = [UIColor redColor].CGColor;  // 阴影颜色
        view.layer.shadowOpacity = .5f;               // 阴影透明度
        view.layer.shadowOffset = CGSizeMake(0, 0);   // 阴影偏移量
        view.layer.shadowRadius = 10;     // 设置阴影大小
        view.layer.cornerRadius = 10;
        _layerView = view;
    }
    return _layerView;
}
- (UIView *)layerView2 {
    if (!_layerView2) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(230, 10, 200, 150);
        view.backgroundColor = [UIColor lightGrayColor];
        view.layer.contentsGravity = kCAGravityResizeAspect;    //设置图像拉伸样式
        view.layer.shadowColor = [UIColor redColor].CGColor;  // 阴影颜色
        view.layer.shadowOpacity = .5f;               // 阴影透明度
        view.layer.shadowOffset = CGSizeMake(0, 0);   // 阴影偏移量
        view.layer.shadowRadius = 10;     // 设置阴影大小
        view.layer.cornerRadius = 10;
        _layerView2 = view;
    }
    return _layerView2;
}
- (UIView *)innerView {
    if (!_innerView) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(20, 20, 50, 50);
        view.backgroundColor = [UIColor redColor];

        _innerView = view;
    }
    return _innerView;
}
-(UIView *)containerView{
    if (!_containerView) {
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, 84, 500, 200);
        view.backgroundColor = [UIColor grayColor];
        //设置3D的透视效果
        CATransform3D perspective = CATransform3DIdentity;
        perspective.m34 = - 1.0 / 500.0;
        view.layer.sublayerTransform = perspective;
        _containerView = view;
    }
    return _containerView;
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
