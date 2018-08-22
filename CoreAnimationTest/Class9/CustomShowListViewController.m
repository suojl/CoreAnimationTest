//
//  CustomShowListViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/8/22.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "CustomShowListViewController.h"
#import "DisplayListView.h"

@interface CustomShowListViewController ()

@property (nonatomic, strong) DisplayListView *listView;
@end

@implementation CustomShowListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.listView];
}

- (DisplayListView *)listView{
    if (!_listView){
        _listView = [[DisplayListView alloc] initWithFrame:CGRectMake(0, 84, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-84)];
    }
    return _listView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
