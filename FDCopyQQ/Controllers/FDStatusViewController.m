//
//  StatusViewController.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/22.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDStatusViewController.h"
@interface FDStatusViewController ()

@end

@implementation FDStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.navigationItem.title = @"动态";
    self.tabBarController.navigationItem.titleView = nil;
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
