//
//  ContactsViewController.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/22.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDContactsViewController.h"

@interface FDContactsViewController ()

@end

@implementation FDContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.navigationItem.title = @"联系人";
    self.tabBarController.navigationItem.titleView = nil;
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
