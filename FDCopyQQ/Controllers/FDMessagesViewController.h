//
//  ViewController.h
//  FDSideSlipDemo
//
//  Created by fergusding on 15/7/16.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDMessagesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

