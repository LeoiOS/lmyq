//
//  LoginVC.m
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupMainView];
}

/**
 *  设置主要 View
 */
- (void)setupMainView {
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录"
//                                                                              style:UIBarButtonItemStyleDone
//                                                                             target:self
//                                                                             action:@selector(loginBtnClicked)];
    
}

/**
 *  点击了登录按钮
 */
- (void)loginBtnClicked {
    
    self.view.window.rootViewController = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
}

@end
