//
//  BaseTabBarVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/3.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "BaseTabBarVC.h"
#import "AccountVC.h"
#import "AddInfoVC.h"
#import "NoteVC.h"
#import "OtherVC.h"
#import "PersonVC.h"

@interface BaseTabBarVC ()

@end

@implementation BaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
//    personVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_per_ed");
    personVC.tabBarItem.selectedImage = [ThemeSelectTool imageWithImageName:@"main_per_ed"];
    
    UINavigationController *acNaviVC = [[UINavigationController alloc] initWithRootViewController:accountVC];
    UINavigationController *adNaviVC = [[UINavigationController alloc] initWithRootViewController:addVC];
    UINavigationController *noNaviVC = [[UINavigationController alloc] initWithRootViewController:noteVC];
    UINavigationController *otNaviVC = [[UINavigationController alloc] initWithRootViewController:otherVC];
    UINavigationController *peNaviVC = [[UINavigationController alloc] initWithRootViewController:personVC];
    
    acNaviVC.navigationBar.backgroundColor = [ThemeSelectTool themeColor];
    [acNaviVC.navigationBar setBackgroundImage:[UIImage imageWithColor:[ThemeSelectTool themeColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.viewControllers = @[acNaviVC,noNaviVC,adNaviVC,otNaviVC,peNaviVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end