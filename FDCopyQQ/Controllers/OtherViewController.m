//
//  OtherViewController.m
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/22.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.content;
    
    self.contentLabel.text = self.content;
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

@end
