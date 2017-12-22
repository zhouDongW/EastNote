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
    accountVC.tabBarItem.image = IMAGEBYENAME(@"");
    accountVC.tabBarItem.selectedImage = IMAGEBYENAME(@"");
    
    AddInfoVC *addVC = [[AddInfoVC alloc] init];
    addVC.tabBarItem.title = @"添加";
    addVC.tabBarItem.image = IMAGEBYENAME(@"");
    addVC.tabBarItem.selectedImage = IMAGEBYENAME(@"");
    
    NoteVC *noteVC = [[NoteVC alloc] init];
    noteVC.tabBarItem.title = @"随记";
    noteVC.tabBarItem.image = IMAGEBYENAME(@"");
    noteVC.tabBarItem.selectedImage = IMAGEBYENAME(@"");
    
    OtherVC *otherVC = [[OtherVC alloc] init];
    otherVC.tabBarItem.title = @"其他";
    otherVC.tabBarItem.image = IMAGEBYENAME(@"");
    otherVC.tabBarItem.selectedImage = IMAGEBYENAME(@"");
    
    PersonVC *personVC = [[PersonVC alloc] init];
    personVC.tabBarItem.title = @"个人";
    personVC.tabBarItem.image = IMAGEBYENAME(@"");
    personVC.tabBarItem.selectedImage = IMAGEBYENAME(@"");
    
    UINavigationController *acNaviVC = [[UINavigationController alloc] initWithRootViewController:accountVC];
    UINavigationController *adNaviVC = [[UINavigationController alloc] initWithRootViewController:addVC];
    UINavigationController *noNaviVC = [[UINavigationController alloc] initWithRootViewController:noteVC];
    UINavigationController *otNaviVC = [[UINavigationController alloc] initWithRootViewController:otherVC];
    UINavigationController *peNaviVC = [[UINavigationController alloc] initWithRootViewController:personVC];
    
    tabVC.viewControllers = @[acNaviVC,noNaviVC,adNaviVC,otNaviVC,peNaviVC];
    [self.window makeKeyAndVisible];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
