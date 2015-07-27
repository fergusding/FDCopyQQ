//
//  FDLoginViewController.m
//  FDCopyQQ
//
//  Created by fergusding on 15/7/23.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "FDLoginViewController.h"
#import "FDMainViewController.h"

@interface FDLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UITextField *qqAcountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation FDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}


- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - Private

- (void)initView {
    self.qqAcountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

#pragma mark - IBActions

- (IBAction)login:(id)sender {
    NSString *qq = self.qqAcountTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if ([qq isEqualToString:@"912015725"] && [password isEqualToString:@"abcd1234"]) {
        // 保存登录状态
        [[NSUserDefaults standardUserDefaults] setObject:@{@"qq" : qq, @"password" : password} forKey:@"OnlineUser"];
        
        // 跳到主界面
        FDMainViewController *mainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self presentViewController:mainViewController animated:NO completion:nil];
        [UIApplication sharedApplication].keyWindow.rootViewController = mainViewController;
    }
}

- (IBAction)cantLogin:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *findPasswordAction = [UIAlertAction actionWithTitle:@"找回密码" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:findPasswordAction];
    
    UIAlertAction *textCheckLoginAction = [UIAlertAction actionWithTitle:@"短信验证登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:textCheckLoginAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:cancelAction];
    NSLog(@"%@", alertController.view.subviews);
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
