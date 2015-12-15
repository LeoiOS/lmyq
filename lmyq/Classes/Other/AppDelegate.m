//
//  AppDelegate.m
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavController.h"
#import <MAMapKit/MAMapKit.h>

#import "LCTabBarController.h"
#import "AttendanceVC.h"
#import "ContactsVC.h"
#import "DiscoverVC.h"
#import "SettingVC.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIStoryboard *mainSb;
@property (nonatomic, strong) UIStoryboard *loginSb;

@end

@implementation AppDelegate

- (UIStoryboard *)mainSb {
    
    if (!_mainSb) {
        
        _mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    return _mainSb;
}

- (UIStoryboard *)loginSb {
    
    if (!_loginSb) {
        
        _loginSb = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    }
    return _loginSb;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    self.window.rootViewController = self.loginSb.instantiateInitialViewController;
    
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [BaseNavController setupNavTheme];
    
    
    [MAMapServices sharedServices].apiKey = MAP_KEY;
    
    
    
    
    return YES;
}

- (void)enterMain {
    
    AttendanceVC *attendanceVC = [self.mainSb instantiateViewControllerWithIdentifier:@"AttendanceVC"];
    attendanceVC.title = @"打卡";
    attendanceVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_attend"];
    attendanceVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_attend_sel"];
    
    ContactsVC *contactsVC     = [self.mainSb instantiateViewControllerWithIdentifier:@"ContactsVC"];
    contactsVC.title = @"联系人";
    contactsVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    contactsVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_contacts_sel"];
    
    DiscoverVC *discoverVC     = [self.mainSb instantiateViewControllerWithIdentifier:@"DiscoverVC"];
    discoverVC.title = @"发现";
    discoverVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    discoverVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_sel"];
    
    SettingVC *settingVC       = [self.mainSb instantiateViewControllerWithIdentifier:@"SettingVC"];
    settingVC.title = @"设置";
    settingVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_setting"];
    settingVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_setting_sel"];
    
    
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:attendanceVC];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:contactsVC];
    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:settingVC];
    
    
    LCTabBarController *tabBarC = [[LCTabBarController alloc] init];
    tabBarC.viewControllers = @[navC1, navC2, navC3, navC4];
    self.window.rootViewController = tabBarC;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
