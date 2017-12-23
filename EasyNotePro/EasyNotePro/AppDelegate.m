//
//  AppDelegate.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Config.h"

#import "AccountVC.h"
#import "AddInfoVC.h"
#import "NoteVC.h"
#import "OtherVC.h"
#import "PersonVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initTabBarController];
    
    
    
    //配置本地数据库
    [self configSQL];
    
    return YES;
}

- (void)initTabBarController
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    self.window.rootViewController = tabVC;
    
    AccountVC *accountVC = [[AccountVC alloc] init];
    accountVC.tabBarItem.title = @"账号";
    accountVC.tabBarItem.image = IMAGEBYENAME(@"main_acc");
    accountVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_acc_ed");
    
    AddInfoVC *addVC = [[AddInfoVC alloc] init];
    addVC.tabBarItem.title = @"添加";
    addVC.tabBarItem.image = IMAGEBYENAME(@"main_add");
    addVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_add_ed");
    
    NoteVC *noteVC = [[NoteVC alloc] init];
    noteVC.tabBarItem.title = @"随记";
    noteVC.tabBarItem.image = IMAGEBYENAME(@"main_note");
    noteVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_note_ed");
    
    OtherVC *otherVC = [[OtherVC alloc] init];
    otherVC.tabBarItem.title = @"其他";
    otherVC.tabBarItem.image = IMAGEBYENAME(@"main_other");
    otherVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_other_ed");
    
    PersonVC *personVC = [[PersonVC alloc] init];
    personVC.tabBarItem.title = @"个人";
    personVC.tabBarItem.image = IMAGEBYENAME(@"main_per");
    personVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_per_ed");
    
    UINavigationController *acNaviVC = [[UINavigationController alloc] initWithRootViewController:accountVC];
    UINavigationController *adNaviVC = [[UINavigationController alloc] initWithRootViewController:addVC];
    UINavigationController *noNaviVC = [[UINavigationController alloc] initWithRootViewController:noteVC];
    UINavigationController *otNaviVC = [[UINavigationController alloc] initWithRootViewController:otherVC];
    UINavigationController *peNaviVC = [[UINavigationController alloc] initWithRootViewController:personVC];
    
    tabVC.viewControllers = @[acNaviVC,noNaviVC,adNaviVC,otNaviVC,peNaviVC];
    [self.window makeKeyAndVisible];

}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
