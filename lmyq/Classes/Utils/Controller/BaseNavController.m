//
//  BaseNavController.m
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

+ (void)setupNavTheme {
    
    if (SYSTEM_VERSION < 7.0f) return;
    
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:ColorWithRBG(63, 100, 254)];
    [navBar setTintColor:[UIColor whiteColor]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

@end
