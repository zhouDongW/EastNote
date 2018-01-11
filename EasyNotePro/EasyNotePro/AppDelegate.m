//
//  AppDelegate.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Config.h"

//#import "AccountVC.h"
//#import "AddInfoVC.h"
//#import "NoteVC.h"
//#import "OtherVC.h"
//#import "PersonVC.h"
#import "BaseTabBarVC.h"
#import "UnLockScreen.h"
#import "SetLockScreen.h"

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
    

//    ZSBntview *lock = [[ZSBntview alloc] init];
//    lock.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//    [self.window addSubview:lock];
    
    BaseTabBarVC *tabVC = [[BaseTabBarVC alloc] init];
    self.window.rootViewController = tabVC;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *locStr = [user objectForKey:@"screenKey"];
        if (!locStr) {
            SetLockScreen *slock = [[SetLockScreen alloc] init];
            slock.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            [self.window addSubview:slock];
            [self.window bringSubviewToFront:slock];
        }
        else
        {
            UnLockScreen *lock = [[UnLockScreen alloc] init];
            lock.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            [self.window addSubview:lock];
            [self.window bringSubviewToFront:lock];
        }
        
    });

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
    
//    ZSBntview *lock = [[ZSBntview alloc] init];
//    lock.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//    [application.delegate.window addSubview:lock];
    
        UnLockScreen *lock = [[UnLockScreen alloc] init];
        lock.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        [self.window addSubview:lock];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
