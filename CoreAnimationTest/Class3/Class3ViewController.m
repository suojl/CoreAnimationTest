//
//  Class3ViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/17.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "Class3ViewController.h"

@interface Class3ViewController ()

@property (nonatomic, strong) IBOutlet UIView *layerView;
@end

@implementation Class3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"----:%@",NSStringFromCGRect(self.layerView.frame));
    self.layerView.layer.cornerRadius = 10;
    self.layerView.layer.shadowColor = [UIColor redColor].CGColor;  // 阴影颜色
    self.layerView.layer.shadowOpacity = .5f;               // 阴影透明度
    self.layerView.layer.shadowOffset = CGSizeMake(0, 0);   // 阴影偏移量
    self.layerView.layer.shadowRadius = 10;     // 设置阴影大小
//    self.layerView.layer.
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DScale(transform, 0.9, 0.9, 1);
    transform.m24 = -1.0 / 500; //以x轴为起始点 进行旋转
    self.layerView.layer.transform = transform;

    NSLog(@"----:%@",NSStringFromCGRect(self.layerView.frame));
    CATransform3D transform2 = CATransform3DIdentity;
    transform2 = CATransform3DTranslate(transform2, 0, self.layerView.frame.size.height * (-0.08), 0);
    transform2 = CATransform3DScale(transform2, 1, 1, 1);
    self.layerView.layer.transform = transform2;
    NSLog(@"----:%@",NSStringFromCGRect(self.layerView.frame));
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
