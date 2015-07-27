//
//  MainViewController.h
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/17.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDMainViewController : UIViewController

@property (strong, nonatomic) UINavigationController *navController;

- (void)showLeft;
- (void)showHome;
//- (void)showRight;

@end
