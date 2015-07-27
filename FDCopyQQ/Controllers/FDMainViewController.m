//
//  MainViewController.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/17.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDMainViewController.h"
#import "FDMessagesViewController.h"
#import "FDContactsViewController.h"
#import "FDStatusViewController.h"
#import "FDLeftViewController.h"
#import "OtherViewController.h"

static CGFloat CenterFullDistance = 0.78;
static CGFloat CenterProportion = 0.77;

static CGFloat LeftProportion = 0.64;
static CGFloat MaxTranslationX;
static CGFloat DistanceBetweenLeftAndMain;

@interface FDMainViewController ()

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) FDMessagesViewController *messagesViewController;
@property (strong, nonatomic) FDContactsViewController *contactsViewController;
@property (strong, nonatomic) FDStatusViewController *statusViewController;
@property (strong, nonatomic) FDLeftViewController *leftViewController;
@property (assign, nonatomic) CGFloat distance;
@property (strong, nonatomic) UIView *backCoverView;

@end

@implementation FDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.distance = 0;
    self.leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftViewController"];
    
    // 最大水平平移距离
    MaxTranslationX = (CenterFullDistance + CenterProportion / 2 - 0.5) * self.view.frame.size.width;
    DistanceBetweenLeftAndMain = (1 - CenterFullDistance) * self.view.frame.size.width / 2;
    
    CGRect frame = self.leftViewController.view.frame;
    frame.size.width = self.view.frame.size.width * CenterFullDistance;
    self.leftViewController.view.frame = frame;
    self.leftViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, LeftProportion, LeftProportion);
    [self.view addSubview:self.leftViewController.view];
    
    // leftViewController 初始位置
    self.leftViewController.view.center = CGPointMake(self.view.center.x - MaxTranslationX, self.view.center.y);
    
    self.backCoverView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backCoverView.backgroundColor = [UIColor blackColor];
    self.backCoverView.alpha = 1.0;
    [self.view addSubview:self.backCoverView];
    
    self.navController = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    [self.view addSubview:self.navController.view];
    
    self.tabBarController = self.navController.viewControllers[0];
    
    self.messagesViewController = self.tabBarController.viewControllers[0];
    [self.messagesViewController.panGesture addTarget:self action:@selector(panCenterView:)];
    [self.messagesViewController.tapGesture addTarget:self action:@selector(showHome)];
    
    self.contactsViewController = self.tabBarController.viewControllers[1];
    [self.contactsViewController.panGesture addTarget:self action:@selector(panCenterView:)];
    [self.contactsViewController.tapGesture addTarget:self action:@selector(showHome)];
    
    self.statusViewController = self.tabBarController.viewControllers[2];
    [self.statusViewController.panGesture addTarget:self action:@selector(panCenterView:)];
    [self.statusViewController.tapGesture addTarget:self action:@selector(showHome)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SEL

- (void)panCenterView:(UIPanGestureRecognizer *)panGestureRecongnizer {
    CGPoint translation = [panGestureRecongnizer translationInView:self.view];
    CGFloat trueDistance = self.distance + translation.x;
    
    if (panGestureRecongnizer.state == UIGestureRecognizerStateEnded) {
        if (trueDistance > CGRectGetWidth(self.view.frame) * CenterProportion / 3) {
            // show left
            [self showLeft];
        }
//        else if (trueDistance < CGRectGetWidth(self.view.frame) * -CenterProportion / 3) {
//            // show right
//            [self showRight];
//        }
        else {
            // show home
            [self showHome];
        }
        return;
    }
    
    // 取消向右滑动
    if (self.navController.view.frame.origin.x == 0 && trueDistance < 0) {
        return;
    }
    
    // 左右标志位
    CGFloat flag = self.navController.view.frame.origin.x >= 0 ? 1 : -1;
    
    // 缩放比 = (HomeProportion - 1) * 移动距离x / 最大移动距离 + 1    最大移动距离 = 最大移动比例 * 宽度 最大移动比例 = (HomeFullDistance + HomeProportion / 2 - 0.5)
    CGFloat homeProportion = flag * (CenterProportion - 1) * trueDistance / MaxTranslationX + 1;
    
    // 缩放比 = （1 - LeftProportion）* 移动距离x / 最大移动距离 + LeftProportion
    CGFloat leftProportion = (1 - LeftProportion) * trueDistance / MaxTranslationX + LeftProportion;
    
    // 以达到最小缩放比例
    if (homeProportion <= CenterProportion) {
        return;
    }
    
    // HomeViewController动画
    self.navController.view.center = CGPointMake(trueDistance + self.view.center.x, self.view.center.y);
    self.navController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, homeProportion, homeProportion);
    
    if (flag == 1) {
        if (![self.view.subviews containsObject:self.backCoverView]) {
            [self.view insertSubview:self.backCoverView belowSubview:self.navController.view];
        }
        
        // LeftViewController 动画
        self.leftViewController.view.center = CGPointMake(self.view.center.x - (MaxTranslationX - trueDistance) * leftProportion  - DistanceBetweenLeftAndMain, self.view.center.y);
        self.leftViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, leftProportion, leftProportion);
        
        // LeftViewController 的透明度
        self.backCoverView.alpha = 1 - trueDistance / MaxTranslationX;
        
        // leftBarButtonItem 的透明动画
        self.tabBarController.navigationItem.leftBarButtonItem.customView.alpha = 1 - trueDistance / MaxTranslationX;
    } else {
        [self.backCoverView removeFromSuperview];
    }
}

- (void)showLeft {
    self.distance = self.view.frame.size.width * (CenterFullDistance + CenterProportion / 2) - self.view.center.x;
    [self doTheHomeAnimation:CenterProportion];
    [self doTheLeftAnimation];
}

- (void)showHome {
    self.distance = 0;
    [self doTheHomeAnimation:1];
    self.tabBarController.navigationItem.leftBarButtonItem.customView.alpha = 1.0;
}

//- (void)showRight {
//    self.distance = self.view.frame.size.width * -(CenterFullDistance + CenterProportion / 2) + self.view.center.x;
//    [self doTheHomeAnimation:CenterProportion];
//}

- (void)doTheHomeAnimation:(CGFloat)proportion {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.navController.view.center = CGPointMake(self.distance + self.view.center.x, self.view.center.y);
        self.navController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
    } completion:nil];
}

- (void)doTheLeftAnimation {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.leftViewController.view.center = CGPointMake(self.view.center.x - DistanceBetweenLeftAndMain, self.view.center.y);
        self.leftViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        self.backCoverView.alpha = 0;
        self.tabBarController.navigationItem.leftBarButtonItem.customView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.backCoverView removeFromSuperview];
    }];
}

@end
