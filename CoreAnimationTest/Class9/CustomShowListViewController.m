//
//  CustomShowListViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/8/22.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "CustomShowListViewController.h"
#import "DisplayListView.h"

@interface CustomShowListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) DisplayListView *listView;
@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CustomShowListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.listView];
}
- (IBAction)showButtonClickAction:(id)sender{
    [self.listView showView];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}
#pragma mark - UITableViewDataSource && UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"----%ld%ld%ld",(long)indexPath.row,indexPath.row,indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"---selected row:%ld",indexPath.row);
    [self.listView hiddenView];
}

#pragma mark - Getters And Setters
- (DisplayListView *)listView{
    if (!_listView){
        _listView = [[DisplayListView alloc] initWithFrame:CGRectMake(0, 84, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-84)];
        _listView.contentViewHeight = 200;
        _listView.contentView = self.tableView;
    }
    return _listView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 0) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(UIView *)testView{
    if (!_testView) {
        _testView = [UIView new];
        _testView.backgroundColor = [UIColor blueColor];
        _testView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 0);
    }
    return _testView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    NSLog(@"---CustomShowListViewController dealloc");
}
@end
