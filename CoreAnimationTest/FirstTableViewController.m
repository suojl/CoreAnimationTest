//
//  FirstTableViewController.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/7/18.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ViewController.h"
#import "Class3ViewController.h"
#import "Class8ViewController.h"

@interface FirstTableViewController (){
    NSArray *_dataSource;
}

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
            case 0:
            [self performSegueWithIdentifier:@"Class1Segue" sender:nil];
            break;
            case 1:
            [self performSegueWithIdentifier:@"Class1Segue" sender:nil];
            break;
            case 2:
            [self performSegueWithIdentifier:@"Class3Segue" sender:nil];
            break;
            case 3:
            [self performSegueWithIdentifier:@"Class4Segue" sender:nil];
            break;
            case 4:
            [self performSegueWithIdentifier:@"Class5Segue" sender:nil];
            break;
            case 5:
            [self performSegueWithIdentifier:@"Class6Segue" sender:nil];
            break;
            case 6:
            [self performSegueWithIdentifier:@"Class7Segue" sender:nil];
            break;
            case 7:
            [self performSegueWithIdentifier:@"Class8Segue" sender:nil];
            break;
            case 8:
            [self performSegueWithIdentifier:@"Class9Segue" sender:nil];
            break;
            case 13:
            [self performSegueWithIdentifier:@"Class14Segue" sender:nil];
            break;
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [segue destinationViewController].title = @"显式动画";
}
*/

- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"1-图层树",@"2-寄宿图",@"3-图层几何学",@"4-视觉效果",@"5-变换",@"6-专有图层",@"7-隐式动画",@"8-显式动画",@"9-图层时间",@"10-缓冲",@"11-基于定时器的动画",@"12-性能调优",@"13-高效绘图",@"14-图像IO",@"15-图层性能"];
    }
    return _dataSource;
}


-(IBAction)unwindToViewController:(UIStoryboardSegue *)unwindSegue{

    NSLog(@"item1   :%@",[unwindSegue.sourceViewController class]);
}

@end
