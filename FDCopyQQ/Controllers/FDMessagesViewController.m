//
//  ViewController.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/16.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDMessagesViewController.h"
#import "FDMainViewController.h"

static FDMainViewController *MainViewController;

@interface FDMessagesViewController ()

@end

@implementation FDMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainViewController = (FDMainViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
}

- (void)viewWillAppear:(BOOL)animated {
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"消息", @"电话"]];
    segmentedControl.selectedSegmentIndex = 0;
    self.tabBarController.navigationItem.titleView = segmentedControl;
    self.tabBarController.navigationItem.titleView.tintColor = [UIColor whiteColor];
    
    self.tabBarController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self customViewOfLeftBarButtonItem]];
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"操作" style:UIBarButtonItemStylePlain target:self action:@selector(operate:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (UIView *)customViewOfLeftBarButtonItem {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = [UIImage imageNamed:@"head"];
    imageView.layer.cornerRadius = imageView.frame.size.height / 2;
    imageView.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:MainViewController action:@selector(showLeft)];
    [imageView addGestureRecognizer:tapGesture];
    imageView.userInteractionEnabled = YES;
    return imageView;
}

#pragma mark - SEL

- (void)operate:(id)sender {
    
}

@end
