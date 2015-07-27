//
//  LeftViewController.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/20.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDLeftViewController.h"
#import "FDLeftTableViewCell.h"
#import "FDMainViewController.h"
#import "OtherViewController.h"

@interface FDLeftViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSArray *titleData;

@end

@implementation FDLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleData = @[@"开通会员", @"QQ钱包", @"网上营业厅", @"个性装扮", @"我的收藏", @"我的相册", @"我的文件"];
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"LeftTableViewCell";
    FDLeftTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:@"qq"];
    cell.title = self.titleData[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FDMainViewController *mainViewController = (FDMainViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [mainViewController showHome];
    
    OtherViewController *otherViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OtherViewController"];
    otherViewController.content = self.titleData[indexPath.row];
    
    [mainViewController.navController pushViewController:otherViewController animated:YES];
    
}

@end
